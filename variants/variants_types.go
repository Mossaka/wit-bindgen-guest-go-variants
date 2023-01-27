package variants

type OptionKind int

const (
None OptionKind = iota
Some
)

type Option[T any] struct {
  Kind OptionKind
  Val  T
}

func (o Option[T]) IsNone() bool {
  return o.Kind == None
}

func (o Option[T]) IsSome() bool {
  return o.Kind == Some
}

func (o Option[T]) Unwrap() T {
  if o.Kind != Some {
    panic("Option is None")
  }
  return o.Val
}

func (o *Option[T]) Set(val T) {
  o.Kind = Some
  o.Val = val
}

func (o *Option[T]) Unset() {
  o.Kind = None
}

type ResultKind int

const (
Ok ResultKind = iota
Err
)

type Result[T any, E any] struct {
  Kind ResultKind
  Val  T
  Err  E
}

func (r Result[T, E]) IsOk() bool {
  return r.Kind == Ok
}

func (r Result[T, E]) IsErr() bool {
  return r.Kind == Err
}

func (r Result[T, E]) Unwrap() T {
  if r.Kind != Ok {
    panic("Result is Err")
  }
  return r.Val
}

func (r Result[T, E]) UnwrapErr() E {
  if r.Kind != Err {
    panic("Result is Ok")
  }
  return r.Err
}

func (r *Result[T, E]) Set(val T) {
  r.Kind = Ok
  r.Val = val
}

func (r *Result[T, E]) SetErr(err E) {
  r.Kind = Err
  r.Err = err
}
