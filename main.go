package main

import (
	"github.com/mossaka/go-wit-bindgen-variants/exports"
)

func init() {
	exports.SetExports(VariantsExportImpl{})
}

type VariantsExportImpl struct{}

func (i VariantsExportImpl) TestImports() {

}

func main() {
}
