package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/field"
)

// Stonks holds the schema definition for the Stonks entity.
type Stonks struct {
	ent.Schema
}

// Fields of the Stonks.
func (Stonks) Fields() []ent.Field {
	return []ent.Field{
		field.String("symbol"),
		field.String("PriceChange"),
	}
}

// Edges of the Stonks.
func (Stonks) Edges() []ent.Edge {
	return nil
}
