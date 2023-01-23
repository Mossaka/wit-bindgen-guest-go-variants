package variants

import (
	optionresult "github.com/mossaka/go-wit-bindgen-variants/result"
)

// #include "variants.h"
import "C"

// imports
func OptionRoundtrip(a optionresult.Option[uint32]) optionresult.Option[uint8] {
	// lower
	var lower_a *C.uint32_t
	if a.IsSome() {
		*lower_a = C.uint32_t(a.Unwrap())
	}

	var result *C.uint8_t
	// call
	C.imports_option_roundtrip(lower_a, result)

	// lift
	var ret optionresult.Option[uint8]
	if result != nil {
		ret.Set(uint8(*result))
	}

	// return
	return ret
}

func ResultRoundtrip(a optionresult.Result[uint32, uint32]) optionresult.Result[uint64, uint8] {

	var lower_a *C.imports_result_u32_u32_t
	// lower_a.is_err = a.IsErr()
	// if a.IsOk() {
	// 	ok_ptr := (*uint32)(unsafe.Pointer(&lower_a.val))
	// 	*ok_ptr = a.Unwrap()
	// } else {
	// 	err_ptr := (*uint32)(unsafe.Pointer(&lower_a.val))
	// 	*err_ptr = a.UnwrapErr()
	// }

	var result *C.uint64_t
	var err *C.uint8_t
	C.imports_result_roundtrip(lower_a, result, err)

	// var ret optionresult.Result[uint64, uint8]
	// if result != nil {
	// 	ret.Set(uint64(*result))
	// } else {
	// 	ret.SetErr(uint8(*err))
	// }
	// return ret
	// C.imports_roundtrip_result(lower_a, result, err)

	var ret optionresult.Result[uint64, uint8]
	ret.Set(42)
	return ret
}

func B(a uint32) {
	C.imports_b(C.uint32_t(a))
}

var variants Variants = nil

func SetVariants(i Variants) {
	variants = i
}

type Variants interface {
	TestImports()
}

//export variants_test_imports
func exportstestImports() {
	variants.TestImports()
}
