package main

import (
	"log"

	"github.com/molson82/jupiter/internal/config"
)

func main() {
	_, err := config.New()
	if err != nil {
		log.Fatalf("Error creating config: %v\n", err)
	}

	log.Printf("Jupiter App Running...\n")
}
