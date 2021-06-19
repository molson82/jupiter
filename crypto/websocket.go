package crypto

import (
	"fmt"
	"log"

	"github.com/gorilla/websocket"
	"github.com/molson82/jupiter/config"
)

func BinanceEthTicker(c *config.Config) {
	log.Println("connecting to wss")
	conn, _, err := websocket.DefaultDialer.Dial(fmt.Sprintf("%v/ethusdt@ticker", c.Constants.WssBaseURL), nil)
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

func BinanceEthTrades(c *config.Config) {
	log.Println("connecting to wss")
	conn, _, err := websocket.DefaultDialer.Dial(fmt.Sprintf("%v/ethusdt@trade", c.Constants.WssBaseURL), nil)
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
