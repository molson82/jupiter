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
- [ ] Make local dev use Vault, Prod use env variables
- [ ] Connect to Binace websocket
