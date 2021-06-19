package models

type IndvSymbolTicker struct {
	EventType              string `json:"e"`
	EventTime              int    `json:"E"`
	Symbol                 string `json:"s"`
	PriceChange            string `json:"p"`
	PriceChangePercent     string `json:"P"`
	WeightedAveragePrice   string `json:"w"`
	LastPrice              string `json:"c"`
	LastQuantity           string `json:"Q"`
	OpenPrice              string `json:"o"`
	HighPrice              string `json:"h"`
	LowPrice               string `json:"l"`
	TotalTradedBaseVolume  string `json:"v"`
	TotalTradedQuoteVolume string `json:"q"`
	StatisticsOpenTime     int    `json:"O"`
	StatisticsCloseTime    int    `json:"C"`
	FirstTradeID           int    `json:"F"`
	LastTradeID            int    `json:"L"`
	TotalNumberTrades      int    `json:"n"`
}
