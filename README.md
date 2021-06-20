# Jupiter

Golang crypto bot / monitor using Vault for private key storage.
Let's see how far this rabbit hole goes.

## Todo

- [x] Create Vault Docker server
- [x] Setup config for app
- [x] Connect to Vault
  - [x] Load Vault secrets into config
- [x] Create Binace API Token
  - [x] Add token to vault
  - [x] Update config
- [x] Set up Sentry for monitoring
  - [x] Add Sentry key/dsn to Vault
  - [x] Add Sentry middleware
- [x] Make local dev use Vault, Prod use env variables
- [x] Create docker and docker-compose files
- [x] Connect to Binace websocket
  - [x] ETH trades
  - [x] ETH mark price
  - [x] ETH 24hr rolling window ticker
- [x] Create database schema
- [x] Store coin info
  - [x] Only save data every 15 min
- [ ] Make bot
