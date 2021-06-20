package crypto

import (
	"encoding/json"
	"fmt"
	"log"
	"time"

	"github.com/getsentry/sentry-go"
	"github.com/gorilla/websocket"
	"github.com/molson82/jupiter/config"
	"github.com/molson82/jupiter/crypto/models"
	table "github.com/molson82/jupiter/models"
)

// BinanceEthTicker : 24hr rollwing window ticker statistics for a single symbol.
// These are NOT the statistics of the UTC day, but a 24hr rolling window from requestTime to 24hrs before.
func BinanceEthTicker(c *config.Config) {
	log.Println("connecting to wss")
	conn, _, err := websocket.DefaultDialer.Dial(fmt.Sprintf("%v/%v@ticker", c.Constants.WssFuturesBaseURL, c.Symbols.ETH), nil)
	if err != nil {
		log.Println("error dialing wss")
		return
	}
	defer conn.Close()

	for {
		_, message, err := conn.ReadMessage()
		if err != nil {
			log.Printf("error reading ws message: %v\n", err)
			//return
		}

		log.Printf("recv: %v\n", string(message))

		createBinanceTickerEntry(message, c)
		time.Sleep(10 * time.Second)
	}
}

// BinanceEthTrades : The Trade Streams push raw trade information; each trade has a unique buyer and seller.
func BinanceEthTrades(c *config.Config) {
	log.Println("connecting to wss")
	conn, _, err := websocket.DefaultDialer.Dial(fmt.Sprintf("%v/%v@trade", c.Constants.WssSpotBaseURL, c.Symbols.ETH), nil)
	if err != nil {
		log.Println("error dialing wss")
		return
	}
	defer conn.Close()

	for {
		_, message, err := conn.ReadMessage()
		if err != nil {
			log.Printf("error reading ws message: %v\n", err)
			//return
		}

		log.Printf("recv: %v\n", string(message))
	}
}

// BinanceEthMarkPrice : Mark price and funding rate for a single symbol pushed every 3 seconds or every second.
func BinanceEthMarkPrice(c *config.Config) {
	log.Println("connecting to wss")
	conn, _, err := websocket.DefaultDialer.Dial(fmt.Sprintf("%v/%v@markPrice", c.Constants.WssFuturesBaseURL, c.Symbols.ETH), nil)
	if err != nil {
		log.Println("error dialing wss")
		return
	}
	defer conn.Close()

	for {
		_, message, err := conn.ReadMessage()
		if err != nil {
			log.Printf("error reading ws message: %v\n", err)
			//return
		}

		log.Printf("recv: %v\n", string(message))
	}
}

func createBinanceTickerEntry(message []byte, c *config.Config) {
	var ethTick models.IndvSymbolTicker
	err := json.Unmarshal(message, &ethTick)
	if err != nil {
		log.Printf("error unmarshalling message: %v\n", err)
		return
	}

	c.Psql.DB.Create(&table.Stonks{
		Symbol:               ethTick.Symbol,
		PriceChange:          ethTick.PriceChange,
		PriceChangePercent:   ethTick.PriceChangePercent,
		WeightedAveragePrice: ethTick.WeightedAveragePrice,
		LastPrice:            ethTick.LastPrice,
		FullPayload:          string(message),
	})

	sentry.CaptureMessage(fmt.Sprintf("Created %v Stonks Table row.", ethTick.Symbol))
	return
}
