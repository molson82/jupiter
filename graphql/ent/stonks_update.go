// Code generated by entc, DO NOT EDIT.

package ent

import (
	"context"
	"fmt"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/molson82/jupiter/graphql/ent/predicate"
	"github.com/molson82/jupiter/graphql/ent/stonks"
)

// StonksUpdate is the builder for updating Stonks entities.
type StonksUpdate struct {
	config
	hooks    []Hook
	mutation *StonksMutation
}

// Where adds a new predicate for the StonksUpdate builder.
func (su *StonksUpdate) Where(ps ...predicate.Stonks) *StonksUpdate {
	su.mutation.predicates = append(su.mutation.predicates, ps...)
	return su
}

// SetSymbol sets the "symbol" field.
func (su *StonksUpdate) SetSymbol(s string) *StonksUpdate {
	su.mutation.SetSymbol(s)
	return su
}

// SetPriceChange sets the "PriceChange" field.
func (su *StonksUpdate) SetPriceChange(s string) *StonksUpdate {
	su.mutation.SetPriceChange(s)
	return su
}

// Mutation returns the StonksMutation object of the builder.
func (su *StonksUpdate) Mutation() *StonksMutation {
	return su.mutation
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (su *StonksUpdate) Save(ctx context.Context) (int, error) {
	var (
		err      error
		affected int
	)
	if len(su.hooks) == 0 {
		affected, err = su.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*StonksMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			su.mutation = mutation
			affected, err = su.sqlSave(ctx)
			mutation.done = true
			return affected, err
		})
		for i := len(su.hooks) - 1; i >= 0; i-- {
			mut = su.hooks[i](mut)
		}
		if _, err := mut.Mutate(ctx, su.mutation); err != nil {
			return 0, err
		}
	}
	return affected, err
}

// SaveX is like Save, but panics if an error occurs.
func (su *StonksUpdate) SaveX(ctx context.Context) int {
	affected, err := su.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (su *StonksUpdate) Exec(ctx context.Context) error {
	_, err := su.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (su *StonksUpdate) ExecX(ctx context.Context) {
	if err := su.Exec(ctx); err != nil {
		panic(err)
	}
}

func (su *StonksUpdate) sqlSave(ctx context.Context) (n int, err error) {
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   stonks.Table,
			Columns: stonks.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeInt,
				Column: stonks.FieldID,
			},
		},
	}
	if ps := su.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := su.mutation.Symbol(); ok {
		_spec.Fields.Set = append(_spec.Fields.Set, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: stonks.FieldSymbol,
		})
	}
	if value, ok := su.mutation.PriceChange(); ok {
		_spec.Fields.Set = append(_spec.Fields.Set, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: stonks.FieldPriceChange,
		})
	}
	if n, err = sqlgraph.UpdateNodes(ctx, su.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{stonks.Label}
		} else if cerr, ok := isSQLConstraintError(err); ok {
			err = cerr
		}
		return 0, err
	}
	return n, nil
}

// StonksUpdateOne is the builder for updating a single Stonks entity.
type StonksUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *StonksMutation
}

// SetSymbol sets the "symbol" field.
func (suo *StonksUpdateOne) SetSymbol(s string) *StonksUpdateOne {
	suo.mutation.SetSymbol(s)
	return suo
}

// SetPriceChange sets the "PriceChange" field.
func (suo *StonksUpdateOne) SetPriceChange(s string) *StonksUpdateOne {
	suo.mutation.SetPriceChange(s)
	return suo
}

// Mutation returns the StonksMutation object of the builder.
func (suo *StonksUpdateOne) Mutation() *StonksMutation {
	return suo.mutation
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (suo *StonksUpdateOne) Select(field string, fields ...string) *StonksUpdateOne {
	suo.fields = append([]string{field}, fields...)
	return suo
}

// Save executes the query and returns the updated Stonks entity.
func (suo *StonksUpdateOne) Save(ctx context.Context) (*Stonks, error) {
	var (
		err  error
		node *Stonks
	)
	if len(suo.hooks) == 0 {
		node, err = suo.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*StonksMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			suo.mutation = mutation
			node, err = suo.sqlSave(ctx)
			mutation.done = true
			return node, err
		})
		for i := len(suo.hooks) - 1; i >= 0; i-- {
			mut = suo.hooks[i](mut)
		}
		if _, err := mut.Mutate(ctx, suo.mutation); err != nil {
			return nil, err
		}
	}
	return node, err
}

// SaveX is like Save, but panics if an error occurs.
func (suo *StonksUpdateOne) SaveX(ctx context.Context) *Stonks {
	node, err := suo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (suo *StonksUpdateOne) Exec(ctx context.Context) error {
	_, err := suo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (suo *StonksUpdateOne) ExecX(ctx context.Context) {
	if err := suo.Exec(ctx); err != nil {
		panic(err)
	}
}

func (suo *StonksUpdateOne) sqlSave(ctx context.Context) (_node *Stonks, err error) {
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   stonks.Table,
			Columns: stonks.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeInt,
				Column: stonks.FieldID,
			},
		},
	}
	id, ok := suo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "ID", err: fmt.Errorf("missing Stonks.ID for update")}
	}
	_spec.Node.ID.Value = id
	if fields := suo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, stonks.FieldID)
		for _, f := range fields {
			if !stonks.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != stonks.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := suo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := suo.mutation.Symbol(); ok {
		_spec.Fields.Set = append(_spec.Fields.Set, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: stonks.FieldSymbol,
		})
	}
	if value, ok := suo.mutation.PriceChange(); ok {
		_spec.Fields.Set = append(_spec.Fields.Set, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: stonks.FieldPriceChange,
		})
	}
	_node = &Stonks{config: suo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, suo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{stonks.Label}
		} else if cerr, ok := isSQLConstraintError(err); ok {
			err = cerr
		}
		return nil, err
	}
	return _node, nil
}
