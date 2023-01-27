package main

import (
	variants "github.com/mossaka/go-wit-bindgen-variants/variants"
)

func init() {
	variants.SetVariants(VariantsImpl{})
}

type VariantsImpl struct{}

func (i VariantsImpl) TestImports() {

	var inner_a variants.Option[variants.Option[uint32]]
	inner_a.Set(variants.Option[uint32]{
		Kind: variants.Some,
		Val:  42,
	})
	a := variants.ImportsAr{
		A: inner_a,
		B: variants.ImportsR2{
			C: 42,
		},
	}
	var arg variants.Option[variants.Option[variants.ImportsAr]]
	arg.Set(variants.Option[variants.ImportsAr]{
		Kind: variants.Some,
		Val:  a,
	})
	b := variants.ImportsOptionRoundtrip1(arg)
	println(b.Unwrap().Unwrap().A.Unwrap().Unwrap())

	var d variants.Option[uint32]
	d.Set(42)
	var e variants.Option[variants.Option[uint32]]
	e.Set(d)
	f := variants.ImportsOptionRoundtrip2(e)
	println(f.Unwrap().Unwrap())

	arg3 := variants.Option[uint32]{Kind: variants.Some, Val: 42}
	b3 := variants.ImportsOptionRoundtrip3(arg3)
	println(b3.Unwrap())

	var arg4 variants.Option[variants.ImportsAr]
	arg4.Set(a)
	b4 := variants.ImportsOptionRoundtrip4(arg4)
	println(b4.Unwrap().A.Unwrap().Unwrap())

	var arg5 variants.Result[uint32, uint32]
	arg5.Set(5)
	b5 := variants.ImportsResultRoundtrip(arg5)
	println(b5.Unwrap())

	var arg6 variants.Option[variants.Result[uint32, struct{}]]
	arg6.Set(variants.Result[uint32, struct{}]{
		Kind: variants.Ok,
		Val:  5,
	})
	b6 := variants.ImportsRoundtripOptionResult(arg6)
	println(b6.Unwrap().Unwrap())

	var arg7 variants.Result[variants.Option[uint32], struct{}]
	arg7.Set(variants.Option[uint32]{
		Kind: variants.Some,
		Val:  5,
	})
	b7 := variants.ImportsRoundtripResultOption(arg7)
	println(b7.Unwrap().Unwrap())
}

func (i VariantsImpl) RoundtripOption1(a variants.Option[variants.Option[uint32]]) variants.Option[variants.Option[uint32]] {
	return a
}
func (i VariantsImpl) RoundtripOption2(a variants.Option[variants.VariantsAr]) variants.Option[variants.VariantsAr] {
	return a
}
func (i VariantsImpl) RoundtripOption3(a variants.Option[uint32]) variants.Option[uint32] {
	return a
}
func (i VariantsImpl) RoundtripOption4(a variants.Option[variants.VariantsF1]) variants.Option[variants.VariantsF1] {
	return a
}
func (i VariantsImpl) RoundtripResult(a variants.Result[variants.VariantsAr, struct{}]) variants.Result[variants.VariantsAr, struct{}] {
	return a
}
func (i VariantsImpl) RoundtripOptionResult(a variants.Option[variants.Result[uint32, struct{}]]) variants.Option[variants.Result[uint32, struct{}]] {
	return a
}
func (i VariantsImpl) RoundtripResultOption(a variants.Result[variants.Option[uint32], struct{}]) variants.Result[variants.Option[uint32], struct{}] {
	return a
}

func main() {
}
