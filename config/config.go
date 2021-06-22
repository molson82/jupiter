package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"strings"
	"time"

	sentry "github.com/getsentry/sentry-go"
	vaultAPI "github.com/hashicorp/vault/api"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

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

type Keys struct {
	BinanceAPIKey string `json:"binance_api_key"`
	BinanceSecret string `json:"binance_secret"`
	SentryDSN     string `json:"sentry_dsn"`
}

type Constants struct {
	Port              string `json:"port"`
	LogLevel          string `json:"log_level"`
	WssFuturesBaseURL string `json:"wss_futures_base_url"`
	WssSpotBaseURL    string `json:"wss_spot_base_url"`
	DatabaseURL       string `json:"database_url"`
}

type Symbols struct {
	ETH string `json:"eth"`
	BTC string `json:"btc"`
}

type PsqlInstance struct {
	DB *gorm.DB
}

type Config struct {
	Keys
	Constants
	Symbols
	Psql PsqlInstance
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
	var psql PsqlInstance

	AppConfig.Constants = Constants{
		Port:              os.Getenv("PORT"),
		LogLevel:          os.Getenv("LOG_LEVEL"),
		WssFuturesBaseURL: os.Getenv("WSS_FUTURES_BASE_URL"),
		WssSpotBaseURL:    os.Getenv("WSS_SPOT_BASE_URL"),
		DatabaseURL:       os.Getenv("DATABASE_URL"),
	}

	AppConfig.Symbols = Symbols{
		ETH: "ethusdt",
		BTC: "btcusdt",
	}

	vaultKeys, err := loadVaultKeys()
	if err != nil {
		log.Println("loadVaultKeys err")
		log.Println("using config/env vars instead")
		AppConfig.Keys = Keys{
			BinanceAPIKey: os.Getenv("BINANCE_API_KEY"),
			BinanceSecret: os.Getenv("BINANCE_SECRET"),
			SentryDSN:     os.Getenv("SENTRY_DSN"),
		}
	} else {
		AppConfig.Keys = vaultKeys
	}

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

	// Gorm setup
	log.Println(fmt.Sprintf("Connecting to db: %v", getDSN(AppConfig.Constants.DatabaseURL)))
	database, err := sql.Open("postgres", getDSN(AppConfig.Constants.DatabaseURL))
	if err != nil {
		log.Println("gorm connection err")
		return &Config{}, err
	}
	gormDB, err := gorm.Open(postgres.New(postgres.Config{
		Conn: database,
	}), &gorm.Config{})
	if err != nil {
		log.Println("gorm setup/config err")
		return &Config{}, err
	}
	psql.DB = gormDB

	AppConfig.Psql = psql

	return &AppConfig, nil
}

func loadVaultKeys() (Keys, error) {
	vaultConfig := vaultAPI.DefaultConfig()
	err := vaultConfig.ReadEnvironment()
	if err != nil {
		log.Println("vaultConfig err")
		return Keys{}, err
	}

	client, err := vaultAPI.NewClient(vaultConfig)
	if err != nil {
		log.Println("vaultClient err")
		return Keys{}, err
	}

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

func getDSN(url string) string {
	var host string
	var user string
	var password string
	var dbname string
	var port string

	s1 := strings.Split(url, "://")
	s2 := strings.Split(s1[1], ":")
	user = s2[0]
	s3 := strings.Split(s2[1], "@")
	password = s3[0]
	host = s3[1]
	s4 := strings.Split(s2[2], "/")
	port = s4[0]
	dbname = s4[1]

	return fmt.Sprintf("host=%v user=%v password=%v dbname=%v port=%v sslmode=disable", host, user, password, dbname, port)
}

func initEnv() error {
	err := godotenv.Load()
	if err != nil {
		log.Println("initEnv > Load err")
		return err
	}
	return nil
}

func main() {
	testConfig, err := New()
	if err != nil {
		log.Printf("Error creating config: %v\n", err)
	}

	log.Printf("Config created: %v\n", testConfig)
}
