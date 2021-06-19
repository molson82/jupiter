package crypto

import (
	"log"

	"github.com/gorilla/websocket"
)

func BinanceConnect() {
	log.Println("connecting to wss")
	conn, _, err := websocket.DefaultDialer.Dial("wss://fstream.binance.com/ws/ethusdt@ticker", nil)
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
