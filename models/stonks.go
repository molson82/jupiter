package models

import (
	"database/sql/driver"
	"encoding/json"
	"time"
)

type JSONB map[string]interface{}

type Stonks struct {
	ID                   int        `gorm:"primaryKey" json:"id"`
	CreatedAt            time.Time  `gorm:"not null" json:"created_at"`
	UpdatedAt            time.Time  `gorm:"not null" json:"updated_at"`
	DeletedAt            *time.Time `sql:"index" json:"deleted_at"`
	EventTime            time.Time
	Symbol               string
	PriceChange          string
	PriceChangePercent   string
	WeightedAveragePrice string
	LastPrice            string
	FullPayload          string `sql:"type:jsonb"`
}

func (j JSONB) Value() (driver.Value, error) {
	valueString, err := json.Marshal(j)
	return string(valueString), err
}

func (j *JSONB) Scan(value interface{}) error {
	if err := json.Unmarshal(value.([]byte), &j); err != nil {
		return err
	}

	return nil
}
