package main

import (
	"context"
	"log"

	"entgo.io/ent/dialect"
	_ "github.com/lib/pq"
	"github.com/molson82/jupiter/config"
	"github.com/molson82/jupiter/graphql/ent"
)

func main() {
	log.Println("Database GraphQL API")

	client, err := ent.Open(dialect.Postgres, config.Constants.DatabaseURL)
	if err != nil {
		log.Fatalf("failed opening connection to postgres: %v\n", err)
	}
	defer client.Close()

	// Run the auto migration tool.
	if err := client.Schema.Create(context.Background()); err != nil {
		log.Fatalf("failed creating schema resources: %v\n", err)
	}
}
