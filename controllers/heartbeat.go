package controllers

import (
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/molson82/jupiter/config"
)

func HeartbeatRoutes(c *config.Config) *chi.Mux {
	router := chi.NewRouter()
	router.Get("/", getHeartbeat(c))

	return router
}

func getHeartbeat(c *config.Config) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		requestID := middleware.GetReqID(r.Context())

		w.Write([]byte(requestID))
	}
}
