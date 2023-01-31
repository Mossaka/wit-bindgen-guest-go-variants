package variants

// #include "variants.h"
import "C"

import "unsafe"

// imports
type ImportsR2 struct {
	C uint8
}

type ImportsAr struct {
	A Option[Option[uint32]]
	B ImportsR2
}

func ImportsOptionRoundtrip1(a Option[Option[ImportsAr]]) Option[Option[ImportsAr]] {
	var lower_a C.imports_option_ar_t
	if a.IsSome() {
		var lower_a_val C.imports_ar_t
		if a.Unwrap().IsSome() {
			var lower_a_val_val C.imports_ar_t
			var lower_a_val_val_a C.imports_option_option_u32_t
			if a.Unwrap().Unwrap().A.IsSome() {
				var lower_a_val_val_a_val C.imports_option_u32_t
				if a.Unwrap().Unwrap().A.Unwrap().IsSome() {
					lower_a_val_val_a_val_val := C.uint32_t(a.Unwrap().Unwrap().A.Unwrap().Unwrap())
					lower_a_val_val_a_val.val = lower_a_val_val_a_val_val
					lower_a_val_val_a_val.is_some = true
				}
				lower_a_val_val_a.val = lower_a_val_val_a_val
				lower_a_val_val_a.is_some = true
			}

			lower_a_val_val.a = lower_a_val_val_a
			var lower_a_val_val_b C.imports_r2_t
			lower_a_val_val_b_c := C.uint8_t(a.Unwrap().Unwrap().B.C)

			lower_a_val_val_b.c = lower_a_val_val_b_c

			lower_a_val_val.b = lower_a_val_val_b
			lower_a_val = lower_a_val_val
		}
		lower_a.val = lower_a_val
		lower_a.is_some = true
	}
	var ret C.imports_option_ar_t
	C.imports_option_roundtrip1(&lower_a, &ret)
	var lift_ret Option[Option[ImportsAr]]
	if ret.is_some {
		var lift_ret_val Option[ImportsAr]
		var lift_ret_val_c C.imports_ar_t
		if ret.val == lift_ret_val_c {
			lift_ret_val.Unset()
		} else {
			var lift_ret_val_val ImportsAr

			var lift_ret_val_val_A Option[Option[uint32]]
			if ret.val.a.is_some {
				var lift_ret_val_val_A_val Option[uint32]
				if ret.val.a.val.is_some {
					var lift_ret_val_val_A_val_val uint32
					lift_ret_val_val_A_val_val = uint32(ret.val.a.val.val)
					lift_ret_val_val_A_val.Set(lift_ret_val_val_A_val_val)
				} else {
					lift_ret_val_val_A_val.Unset()
				}
				lift_ret_val_val_A.Set(lift_ret_val_val_A_val)
			} else {
				lift_ret_val_val_A.Unset()
			}
			lift_ret_val_val.A = lift_ret_val_val_A
			var lift_ret_val_val_B ImportsR2

			var lift_ret_val_val_B_C uint8
			lift_ret_val_val_B_C = uint8(ret.val.b.c)
			lift_ret_val_val_B.C = lift_ret_val_val_B_C
			lift_ret_val_val.B = lift_ret_val_val_B
			lift_ret_val.Set(lift_ret_val_val)
		}
		lift_ret.Set(lift_ret_val)
	} else {
		lift_ret.Unset()
	}
	return lift_ret
}

func ImportsOptionRoundtrip2(a Option[Option[uint32]]) Option[Option[uint32]] {
	var lower_a C.imports_option_u32_t
	if a.IsSome() {
		var lower_a_val C.uint32_t
		if a.Unwrap().IsSome() {
			lower_a_val_val := C.uint32_t(a.Unwrap().Unwrap())
			lower_a_val = lower_a_val_val
		}
		lower_a.val = lower_a_val
		lower_a.is_some = true
	}
	var ret C.imports_option_u32_t
	C.imports_option_roundtrip2(&lower_a, &ret)
	var lift_ret Option[Option[uint32]]
	if ret.is_some {
		var lift_ret_val Option[uint32]
		if ret.val == 0 {
			lift_ret_val.Unset()
		} else {
			var lift_ret_val_val uint32
			lift_ret_val_val = uint32(ret.val)
			lift_ret_val.Set(lift_ret_val_val)
		}
		lift_ret.Set(lift_ret_val)
	} else {
		lift_ret.Unset()
	}
	return lift_ret
}

func ImportsOptionRoundtrip3(a Option[uint32]) Option[uint32] {
	var lower_a C.uint32_t
	if a.IsSome() {
		lower_a_val := C.uint32_t(a.Unwrap())
		lower_a = lower_a_val
	}
	var ret C.uint32_t
	C.imports_option_roundtrip3(&lower_a, &ret)
	var lift_ret Option[uint32]
	if ret == 0 {
		lift_ret.Unset()
	} else {
		var lift_ret_val uint32
		lift_ret_val = uint32(ret)
		lift_ret.Set(lift_ret_val)
	}
	return lift_ret
}

func ImportsOptionRoundtrip4(a Option[ImportsAr]) Option[ImportsAr] {
	var lower_a C.imports_ar_t
	if a.IsSome() {
		var lower_a_val C.imports_ar_t
		var lower_a_val_a C.imports_option_option_u32_t
		if a.Unwrap().A.IsSome() {
			var lower_a_val_a_val C.imports_option_u32_t
			if a.Unwrap().A.Unwrap().IsSome() {
				lower_a_val_a_val_val := C.uint32_t(a.Unwrap().A.Unwrap().Unwrap())
				lower_a_val_a_val.val = lower_a_val_a_val_val
				lower_a_val_a_val.is_some = true
			}
			lower_a_val_a.val = lower_a_val_a_val
			lower_a_val_a.is_some = true
		}

		lower_a_val.a = lower_a_val_a
		var lower_a_val_b C.imports_r2_t
		lower_a_val_b_c := C.uint8_t(a.Unwrap().B.C)

		lower_a_val_b.c = lower_a_val_b_c

		lower_a_val.b = lower_a_val_b
		lower_a = lower_a_val
	}
	var ret C.imports_ar_t
	C.imports_option_roundtrip4(&lower_a, &ret)
	var lift_ret Option[ImportsAr]
	var lift_ret_c C.imports_ar_t
	if ret == lift_ret_c {
		lift_ret.Unset()
	} else {
		var lift_ret_val ImportsAr

		var lift_ret_val_A Option[Option[uint32]]
		if ret.a.is_some {
			var lift_ret_val_A_val Option[uint32]
			if ret.a.val.is_some {
				var lift_ret_val_A_val_val uint32
				lift_ret_val_A_val_val = uint32(ret.a.val.val)
				lift_ret_val_A_val.Set(lift_ret_val_A_val_val)
			} else {
				lift_ret_val_A_val.Unset()
			}
			lift_ret_val_A.Set(lift_ret_val_A_val)
		} else {
			lift_ret_val_A.Unset()
		}
		lift_ret_val.A = lift_ret_val_A
		var lift_ret_val_B ImportsR2

		var lift_ret_val_B_C uint8
		lift_ret_val_B_C = uint8(ret.b.c)
		lift_ret_val_B.C = lift_ret_val_B_C
		lift_ret_val.B = lift_ret_val_B
		lift_ret.Set(lift_ret_val)
	}
	return lift_ret
}

func ImportsOptionRoundtrip5(a Option[uint32]) (Option[uint32], uint32) {
	var lower_a C.uint32_t
	if a.IsSome() {
		lower_a_val := C.uint32_t(a.Unwrap())
		lower_a = lower_a_val
	}
	var ret0 C.imports_option_u32_t
	var ret1 C.uint32_t
	C.imports_option_roundtrip5(&lower_a, &ret0, &ret1)
	var lift_ret0 Option[uint32]
	if ret0.is_some {
		var lift_ret0_val uint32
		lift_ret0_val = uint32(ret0.val)
		lift_ret0.Set(lift_ret0_val)
	} else {
		lift_ret0.Unset()
	}
	var lift_ret1 uint32
	lift_ret1 = uint32(ret1)
	return lift_ret0, lift_ret1
}

func ImportsResultRoundtrip(a Result[uint32, uint32]) Result[uint64, uint8] {
	var lower_a C.imports_result_u32_u32_t

	lower_a.is_err = a.IsErr()
	if a.IsOk() {
		lower_a_ptr := (*uint32)(unsafe.Pointer(&lower_a.val))
		*lower_a_ptr = a.Unwrap()
	} else {
		lower_a_ptr := (*uint32)(unsafe.Pointer(&lower_a.val))
		*lower_a_ptr = a.UnwrapErr()
	}
	var ret C.uint64_t
	var empty_ret C.uint64_t
	var err C.uint8_t
	C.imports_result_roundtrip(&lower_a, &ret, &err)
	var lift_ret Result[uint64, uint8]

	if ret == empty_ret {
		lift_ret_ptr := (*uint8)(unsafe.Pointer(&err))
		lift_ret.SetErr(*lift_ret_ptr)
	} else {
		lift_ret_ptr := (*uint64)(unsafe.Pointer(&ret))
		lift_ret.Set(*lift_ret_ptr)
	}
	return lift_ret
}

func ImportsRoundtripOptionResult(a Option[Result[uint32, struct{}]]) Option[Result[uint32, struct{}]] {
	var lower_a C.imports_result_u32_void_t
	if a.IsSome() {
		var lower_a_val C.imports_result_u32_void_t

		lower_a_val.is_err = a.Unwrap().IsErr()
		lower_a_val_ptr := (*uint32)(unsafe.Pointer(&lower_a_val.val))
		if a.Unwrap().IsOk() {
			*lower_a_val_ptr = a.Unwrap().Unwrap()
		}
		lower_a = lower_a_val
	}
	var ret C.imports_result_u32_void_t
	C.imports_roundtrip_option_result(&lower_a, &ret)
	var lift_ret Option[Result[uint32, struct{}]]
	var lift_ret_c C.imports_result_u32_void_t
	if ret == lift_ret_c {
		lift_ret.Unset()
	} else {
		var lift_ret_val Result[uint32, struct{}]

		lift_ret_val_ptr := (*uint32)(unsafe.Pointer(&ret.val))
		if ret.is_err {
			lift_ret_val.SetErr(struct{}{})
		} else {
			lift_ret_val.Set(*lift_ret_val_ptr)
		}
		lift_ret.Set(lift_ret_val)
	}
	return lift_ret
}

func ImportsRoundtripResultOption(a Result[Option[uint32], struct{}]) Result[Option[uint32], struct{}] {
	var lower_a C.imports_result_option_u32_void_t

	lower_a.is_err = a.IsErr()
	lower_a_ptr := (*Option[uint32])(unsafe.Pointer(&lower_a.val))
	if a.IsOk() {
		*lower_a_ptr = a.Unwrap()
	}
	var ret C.imports_option_u32_t
	var empty_ret C.imports_option_u32_t
	C.imports_roundtrip_result_option(&lower_a, &ret)
	var lift_ret Result[Option[uint32], struct{}]

	lift_ret_ptr := (*Option[uint32])(unsafe.Pointer(&ret))
	if ret == empty_ret {
		lift_ret.SetErr(struct{}{})
	} else {
		lift_ret.Set(*lift_ret_ptr)
	}
	return lift_ret
}

// default variants
type VariantsAr struct {
	A uint32
}

type VariantsF1 uint64

const (
	VariantsF1_A VariantsF1 = 1 << iota
	VariantsF1_B
)

var variants Variants = nil

func SetVariants(i Variants) {
	variants = i
}

type Variants interface {
	TestImports()
	RoundtripOption1(a Option[Option[uint32]]) Option[Option[uint32]]
	RoundtripOption2(a Option[VariantsAr]) Option[VariantsAr]
	RoundtripOption3(a Option[uint32]) Option[uint32]
	RoundtripOption4(a Option[VariantsF1]) Option[VariantsF1]
	RoundtripResult(a Result[VariantsAr, struct{}]) Result[VariantsAr, struct{}]
	RoundtripOptionResult(a Option[Result[uint32, struct{}]]) Option[Result[uint32, struct{}]]
	RoundtripResultOption(a Result[Option[uint32], struct{}]) Result[Option[uint32], struct{}]
}

//export variants_test_imports
func VariantsTestImports() {
	variants.TestImports()

}

//export variants_roundtrip_option1
func VariantsRoundtripOption1(a *C.variants_option_u32_t, ret *C.variants_option_u32_t) bool {
	var lift_a Option[Option[uint32]]
	if a.is_some {
		var lift_a_val Option[uint32]
		if a.val == 0 {
			lift_a_val.Unset()
		} else {
			var lift_a_val_val uint32
			lift_a_val_val = uint32(a.val)
			lift_a_val.Set(lift_a_val_val)
		}
		lift_a.Set(lift_a_val)
	} else {
		lift_a.Unset()
	}
	result := variants.RoundtripOption1(lift_a)
	var lower_result C.variants_option_u32_t
	if result.IsSome() {
		var lower_result_val C.uint32_t
		if result.Unwrap().IsSome() {
			lower_result_val_val := C.uint32_t(result.Unwrap().Unwrap())
			lower_result_val = lower_result_val_val
		}
		lower_result.val = lower_result_val
		lower_result.is_some = true
	}
	*ret = lower_result

	return result.IsSome()

}

//export variants_roundtrip_option2
func VariantsRoundtripOption2(a *C.variants_ar_t, ret *C.variants_ar_t) bool {
	var lift_a Option[VariantsAr]
	if a == nil {
		lift_a.Unset()
	} else {
		var lift_a_val VariantsAr

		var lift_a_val_A uint32
		lift_a_val_A = uint32(a.a)
		lift_a_val.A = lift_a_val_A
		lift_a.Set(lift_a_val)
	}
	result := variants.RoundtripOption2(lift_a)
	var lower_result C.variants_ar_t
	if result.IsSome() {
		var lower_result_val C.variants_ar_t
		lower_result_val_a := C.uint32_t(result.Unwrap().A)

		lower_result_val.a = lower_result_val_a
		lower_result = lower_result_val
	}
	*ret = lower_result

	return result.IsSome()

}

//export variants_roundtrip_option3
func VariantsRoundtripOption3(a *C.uint32_t, ret *C.uint32_t) bool {
	var lift_a Option[uint32]
	if a == nil {
		lift_a.Unset()
	} else {
		var lift_a_val uint32
		lift_a_val = uint32(*a)
		lift_a.Set(lift_a_val)
	}
	result := variants.RoundtripOption3(lift_a)
	var lower_result C.uint32_t
	if result.IsSome() {
		lower_result_val := C.uint32_t(result.Unwrap())
		lower_result = lower_result_val
	}
	*ret = lower_result

	return result.IsSome()

}

//export variants_roundtrip_option4
func VariantsRoundtripOption4(a *C.variants_f1_t, ret *C.variants_f1_t) bool {
	var lift_a Option[VariantsF1]
	if a == nil {
		lift_a.Unset()
	} else {
		var lift_a_val VariantsF1

		lift_a_val = VariantsF1(*a)
		lift_a.Set(lift_a_val)
	}
	result := variants.RoundtripOption4(lift_a)
	var lower_result C.variants_f1_t
	if result.IsSome() {
		lower_result_val := C.uint8_t(result.Unwrap())
		lower_result = lower_result_val
	}
	*ret = lower_result

	return result.IsSome()

}

//export variants_roundtrip_result
func VariantsRoundtripResult(a *C.variants_result_ar_void_t, ret *C.variants_ar_t) bool {
	var lift_a Result[VariantsAr, struct{}]

	lift_a_ptr := (*VariantsAr)(unsafe.Pointer(&a.val))
	if a.is_err {
		lift_a.SetErr(struct{}{})
	} else {
		lift_a.Set(*lift_a_ptr)
	}
	result := variants.RoundtripResult(lift_a)
	var lower_result C.variants_result_ar_void_t

	lower_result.is_err = result.IsErr()
	lower_result_ptr := (*VariantsAr)(unsafe.Pointer(&lower_result.val))
	if result.IsOk() {
		*lower_result_ptr = result.Unwrap()
	}

	if lower_result.is_err == false {
		*ret = lower_result.val.ok
	}
	return result.IsOk()

}

//export variants_roundtrip_option_result
func VariantsRoundtripOptionResult(a *C.variants_result_u32_void_t, ret *C.variants_result_u32_void_t) bool {
	var lift_a Option[Result[uint32, struct{}]]
	if a == nil {
		lift_a.Unset()
	} else {
		var lift_a_val Result[uint32, struct{}]

		lift_a_val_ptr := (*uint32)(unsafe.Pointer(&a.val))
		if a.is_err {
			lift_a_val.SetErr(struct{}{})
		} else {
			lift_a_val.Set(*lift_a_val_ptr)
		}
		lift_a.Set(lift_a_val)
	}
	result := variants.RoundtripOptionResult(lift_a)
	var lower_result C.variants_result_u32_void_t
	if result.IsSome() {
		var lower_result_val C.variants_result_u32_void_t

		lower_result_val.is_err = result.Unwrap().IsErr()
		lower_result_val_ptr := (*uint32)(unsafe.Pointer(&lower_result_val.val))
		if result.Unwrap().IsOk() {
			*lower_result_val_ptr = result.Unwrap().Unwrap()
		}
		lower_result = lower_result_val
	}
	*ret = lower_result

	return result.IsSome()

}

//export variants_roundtrip_result_option
func VariantsRoundtripResultOption(a *C.variants_result_option_u32_void_t, ret *C.variants_option_u32_t) bool {
	var lift_a Result[Option[uint32], struct{}]

	lift_a_ptr := (*Option[uint32])(unsafe.Pointer(&a.val))
	if a.is_err {
		lift_a.SetErr(struct{}{})
	} else {
		lift_a.Set(*lift_a_ptr)
	}
	result := variants.RoundtripResultOption(lift_a)
	var lower_result C.variants_result_option_u32_void_t

	lower_result.is_err = result.IsErr()
	lower_result_ptr := (*Option[uint32])(unsafe.Pointer(&lower_result.val))
	if result.IsOk() {
		*lower_result_ptr = result.Unwrap()
	}

	if lower_result.is_err == false {
		*ret = lower_result.val.ok
	}
	return result.IsOk()

}
