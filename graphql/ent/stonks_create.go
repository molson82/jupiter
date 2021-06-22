// Code generated by entc, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"

	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/molson82/jupiter/graphql/ent/stonks"
)

// StonksCreate is the builder for creating a Stonks entity.
type StonksCreate struct {
	config
	mutation *StonksMutation
	hooks    []Hook
}

// SetSymbol sets the "symbol" field.
func (sc *StonksCreate) SetSymbol(s string) *StonksCreate {
	sc.mutation.SetSymbol(s)
	return sc
}

// SetPriceChange sets the "PriceChange" field.
func (sc *StonksCreate) SetPriceChange(s string) *StonksCreate {
	sc.mutation.SetPriceChange(s)
	return sc
}

// Mutation returns the StonksMutation object of the builder.
func (sc *StonksCreate) Mutation() *StonksMutation {
	return sc.mutation
}

// Save creates the Stonks in the database.
func (sc *StonksCreate) Save(ctx context.Context) (*Stonks, error) {
	var (
		err  error
		node *Stonks
	)
	if len(sc.hooks) == 0 {
		if err = sc.check(); err != nil {
			return nil, err
		}
		node, err = sc.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*StonksMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			if err = sc.check(); err != nil {
				return nil, err
			}
			sc.mutation = mutation
			node, err = sc.sqlSave(ctx)
			mutation.done = true
			return node, err
		})
		for i := len(sc.hooks) - 1; i >= 0; i-- {
			mut = sc.hooks[i](mut)
		}
		if _, err := mut.Mutate(ctx, sc.mutation); err != nil {
			return nil, err
		}
	}
	return node, err
}

// SaveX calls Save and panics if Save returns an error.
func (sc *StonksCreate) SaveX(ctx context.Context) *Stonks {
	v, err := sc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// check runs all checks and user-defined validators on the builder.
func (sc *StonksCreate) check() error {
	if _, ok := sc.mutation.Symbol(); !ok {
		return &ValidationError{Name: "symbol", err: errors.New("ent: missing required field \"symbol\"")}
	}
	if _, ok := sc.mutation.PriceChange(); !ok {
		return &ValidationError{Name: "PriceChange", err: errors.New("ent: missing required field \"PriceChange\"")}
	}
	return nil
}

func (sc *StonksCreate) sqlSave(ctx context.Context) (*Stonks, error) {
	_node, _spec := sc.createSpec()
	if err := sqlgraph.CreateNode(ctx, sc.driver, _spec); err != nil {
		if cerr, ok := isSQLConstraintError(err); ok {
			err = cerr
		}
		return nil, err
	}
	id := _spec.ID.Value.(int64)
	_node.ID = int(id)
	return _node, nil
}

func (sc *StonksCreate) createSpec() (*Stonks, *sqlgraph.CreateSpec) {
	var (
		_node = &Stonks{config: sc.config}
		_spec = &sqlgraph.CreateSpec{
			Table: stonks.Table,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeInt,
				Column: stonks.FieldID,
			},
		}
	)
	if value, ok := sc.mutation.Symbol(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: stonks.FieldSymbol,
		})
		_node.Symbol = value
	}
	if value, ok := sc.mutation.PriceChange(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: stonks.FieldPriceChange,
		})
		_node.PriceChange = value
	}
	return _node, _spec
}

// StonksCreateBulk is the builder for creating many Stonks entities in bulk.
type StonksCreateBulk struct {
	config
	builders []*StonksCreate
}

// Save creates the Stonks entities in the database.
func (scb *StonksCreateBulk) Save(ctx context.Context) ([]*Stonks, error) {
	specs := make([]*sqlgraph.CreateSpec, len(scb.builders))
	nodes := make([]*Stonks, len(scb.builders))
	mutators := make([]Mutator, len(scb.builders))
	for i := range scb.builders {
		func(i int, root context.Context) {
			builder := scb.builders[i]
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*StonksMutation)
				if !ok {
					return nil, fmt.Errorf("unexpected mutation type %T", m)
				}
				if err := builder.check(); err != nil {
					return nil, err
				}
				builder.mutation = mutation
				nodes[i], specs[i] = builder.createSpec()
				var err error
				if i < len(mutators)-1 {
					_, err = mutators[i+1].Mutate(root, scb.builders[i+1].mutation)
				} else {
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, scb.driver, &sqlgraph.BatchCreateSpec{Nodes: specs}); err != nil {
						if cerr, ok := isSQLConstraintError(err); ok {
							err = cerr
						}
					}
				}
				mutation.done = true
				if err != nil {
					return nil, err
				}
				id := specs[i].ID.Value.(int64)
				nodes[i].ID = int(id)
				return nodes[i], nil
			})
			for i := len(builder.hooks) - 1; i >= 0; i-- {
				mut = builder.hooks[i](mut)
			}
			mutators[i] = mut
		}(i, ctx)
	}
	if len(mutators) > 0 {
		if _, err := mutators[0].Mutate(ctx, scb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (scb *StonksCreateBulk) SaveX(ctx context.Context) []*Stonks {
	v, err := scb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}
