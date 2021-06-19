package models

import "time"

type Sells struct {
	ID        int        `gorm:"primaryKey" json:"id"`
	CreatedAt time.Time  `gorm:"not null" json:"created_at"`
	UpdatedAt time.Time  `gorm:"not null" json:"updated_at"`
	DeletedAt *time.Time `sql:"index" json:"deleted_at"`
}
