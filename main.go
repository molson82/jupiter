package main

import (
	"log"
	"net/http"
	"os"

	sentryhttp "github.com/getsentry/sentry-go/http"
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/go-chi/httplog"
	"github.com/go-chi/render"
	"github.com/molson82/jupiter/config"
	"github.com/molson82/jupiter/controllers"
	"github.com/molson82/jupiter/crypto"
	"github.com/molson82/jupiter/models"
)

func routes(c *config.Config) *chi.Mux {
	r := chi.NewRouter()

	logger := httplog.NewLogger("jupiter-logger", httplog.Options{
		JSON:     true,
		Concise:  true,
		LogLevel: c.Constants.LogLevel,
	})

	sentry := sentryhttp.New(sentryhttp.Options{})

	r.Use(render.SetContentType(render.ContentTypeJSON),
		middleware.RequestID,
		middleware.RedirectSlashes,
		httplog.RequestLogger(logger),
		middleware.Recoverer)

	r.Route("/api", func(r chi.Router) {
		r.Mount("/heartbeat", sentry.Handle(controllers.HeartbeatRoutes(c)))
	})

	return r
}

func migrations(c *config.Config) {
	c.Psql.DB.AutoMigrate(&models.Stonks{})
	c.Psql.DB.AutoMigrate(&models.Buys{})
	c.Psql.DB.AutoMigrate(&models.Sells{})
}

func main() {
	config, err := config.New()
	if err != nil {
		log.Fatalf("Error creating config: %v\n", err)
	}

	router := routes(config)

	migrations(config)

	go crypto.BinanceEthTicker(config)
	//go crypto.BinanceEthTrades(config)
	//go crypto.BinanceEthMarkPrice(config)

	log.Printf("Jupiter Go server running on PORT %v...\n", os.Getenv("PORT"))
	log.Fatal(http.ListenAndServe(":"+os.Getenv("PORT"), router))
}
