package config

import (
	"log"
	"os"
	"time"

	"github.com/getsentry/sentry-go"
	vaultAPI "github.com/hashicorp/vault/api"
	"github.com/joho/godotenv"
)

type Keys struct {
	BinanceAPIKey string `json:"binance_api_key"`
	BinanceSecret string `json:"binance_secret"`
	SentryDSN     string `json:"sentry_dsn"`
}

type Constants struct {
	Port     string `json:"port"`
	LogLevel string `json:"log_level"`
}

type Config struct {
	Keys
	Constants
}

var AppConfig Config

func GetAppConfig() *Config {
	return &AppConfig
}

func New() (*Config, error) {
	err := initEnv()
	if err != nil {
		log.Println("initEnv err")
		return &Config{}, err
	}

	AppConfig = Config{}

	AppConfig.Constants = Constants{
		Port:     os.Getenv("PORT"),
		LogLevel: os.Getenv("LOG_LEVEL"),
	}

	vaultConfig := vaultAPI.DefaultConfig()
	err = vaultConfig.ReadEnvironment()
	if err != nil {
		log.Println("vaultConfig err")
		return &Config{}, err
	}

	vaultClient, err := vaultAPI.NewClient(vaultConfig)
	if err != nil {
		log.Println("vaultClient err")
		return &Config{}, err
	}

	vaultKeys, err := loadVaultKeys(vaultClient)
	if err != nil {
		log.Println("loadVaultKeys err")
		return &Config{}, err
	}

	AppConfig.Keys = vaultKeys

	// Sentry setup
	if err = sentry.Init(sentry.ClientOptions{
		Dsn: AppConfig.Keys.SentryDSN,
	}); err != nil {
		log.Println("sentry setup err")
		return &Config{}, err
	}
	defer sentry.Flush(2 * time.Second)
	sentry.CaptureMessage("Jupiter Go Crypto bot - Build")
	log.Println("sentry connected")

	return &AppConfig, nil
}

func loadVaultKeys(client *vaultAPI.Client) (Keys, error) {
	req := client.NewRequest("GET", "/v1/kv-v1/jupiter/keys")
	resp, err := client.RawRequest(req)
	defer resp.Body.Close()

	var respBody VaultAPIResponse
	err = resp.DecodeJSON(&respBody)
	if err != nil {
		log.Println("loadVaultKeys > DecodeJSON err")
		return Keys{}, err
	}

	return Keys{
		BinanceAPIKey: respBody.Data.BinanceAPIKey,
		BinanceSecret: respBody.Data.BinanceSecret,
		SentryDSN:     respBody.Data.SentryDSN,
	}, nil
}

func initEnv() error {
	err := godotenv.Load()
	if err != nil {
		log.Println("initEnv > Load err")
		return err
	}
	return nil
}
