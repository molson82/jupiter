package config

import (
	"log"

	vaultAPI "github.com/hashicorp/vault/api"
	"github.com/joho/godotenv"
)

type Keys struct {
	Test        string `json:"test"`
	DatabaseURL string `json:"database_url"`
}

type Config struct {
	Keys
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
		Test:        respBody.Data.Test,
		DatabaseURL: respBody.Data.DatabaseURL,
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
