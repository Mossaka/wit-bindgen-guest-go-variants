package main

import (
	optionresult "github.com/mossaka/go-wit-bindgen-variants/result"
	variants "github.com/mossaka/go-wit-bindgen-variants/variants"
)

func init() {
	variants.SetVariants(VariantsImpl{})
}

type VariantsImpl struct{}

func (i VariantsImpl) TestImports() {

	// variants.B(234)

	var a optionresult.Option[uint32]
	a.Set(42)
	b := variants.OptionRoundtrip(a)
	println(b.Unwrap())

	var c optionresult.Result[uint32, uint32]
	c.Set(42)
	d := variants.ResultRoundtrip(c)
	println(d.Unwrap())

}

func main() {
}
