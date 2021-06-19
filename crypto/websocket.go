package crypto

import (
	"fmt"
	"log"

	"github.com/gorilla/websocket"
	"github.com/molson82/jupiter/config"
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
