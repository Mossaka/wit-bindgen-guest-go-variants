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

func main() {
}
