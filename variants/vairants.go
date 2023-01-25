package variants

import (
	"unsafe"

	optionresult "github.com/mossaka/go-wit-bindgen-variants/result"
)

// #include "variants.h"
import "C"

// imports
func OptionRoundtrip(a optionresult.Option[uint32]) optionresult.Option[uint8] {
	var lower_a C.uint32_t = 0
	if a.IsSome() {
		lower_a = C.uint32_t(a.Unwrap())
	}

	var result C.uint8_t
	C.imports_option_roundtrip(&lower_a, &result)

	var ret optionresult.Option[uint8]
	if result == 0 {
		ret.Unset()
	} else {
		ret.Set(uint8(result))
	}
	return ret
}

func ResultRoundtrip(a optionresult.Result[uint32, uint32]) optionresult.Result[uint64, uint8] {

	var lower_a C.imports_result_u32_u32_t
	lower_a.is_err = a.IsErr()
	ptr := (*uint32)(unsafe.Pointer(&lower_a.val))
	if a.IsOk() {
		*ptr = a.Unwrap()
	} else {
		*ptr = a.UnwrapErr()
	}

	var result C.uint64_t
	var err C.uint8_t
	C.imports_result_roundtrip(&lower_a, &result, &err)

	var ret optionresult.Result[uint64, uint8]
	if result != 0 {
		ret.Set(uint64(result))
	} else {
		ret.SetErr(uint8(err))
	}
	return ret
}

var variants Variants = nil

func SetVariants(i Variants) {
	variants = i
}

type Variants interface {
	TestImports()
	RoundtripOption(a optionresult.Option[uint32]) optionresult.Option[uint8]
	RoundtripResult(a optionresult.Result[uint32, uint32]) optionresult.Result[uint64, uint8]
}

//export variants_test_imports
func exportstestImports() {
	variants.TestImports()
}

//export variants_roundtrip_option
func exportsroundtripOption(maybe_a *C.uint32_t, ret *C.uint32_t) bool {
	var lift_a optionresult.Option[uint32]
	if maybe_a == nil {
		lift_a.Unset()
	} else {
		lift_a.Set(uint32(*maybe_a))
	}

	result := variants.RoundtripOption(lift_a)

	if result.IsSome() {
		*ret = C.uint32_t(result.Unwrap())
	}
	return result.IsSome()
}

//export variants_roundtrip_result
func exportsroundtripResult(a *C.variants_result_u32_u32_t, ret *C.uint64_t, err *C.uint8_t) bool {
	var lift_a optionresult.Result[uint32, uint32]
	ptr := (*uint32)(unsafe.Pointer(&a.val))
	if a.is_err {
		lift_a.SetErr(*ptr)
	} else {
		lift_a.Set(*ptr)
	}

	result := variants.RoundtripResult(lift_a)

	if result.IsOk() {
		*ret = C.uint64_t(result.Unwrap())
	} else {
		*err = C.uint8_t(result.UnwrapErr())
	}
	return result.IsOk()
}
