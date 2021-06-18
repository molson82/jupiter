package config

type VaultAPIResponse struct {
	RequestID     string `json:"request_id"`
	LeaseID       string `json:"lease_id"`
	Renewable     bool   `json:"renewable"`
	LeaseDuration int    `json:"lease_duration"`
	Data          struct {
		BinanceAPIKey string `json:"binance_api_key"`
		BinanceSecret string `json:"binance_secret"`
		SentryDSN     string `json:"sentry_dsn"`
	} `json:"data"`
	WrapInfo interface{} `json:"wrap_info"`
	Warnings interface{} `json:"warnings"`
	Auth     interface{} `json:"auth"`
}
