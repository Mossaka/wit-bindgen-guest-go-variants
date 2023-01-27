package variants

// #include "variants.h"
import "C"

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
	var result C.imports_option_ar_t
	C.imports_option_roundtrip1(&lower_a, &result)
	var lift_result Option[Option[ImportsAr]]
	if result.is_some {
		var lift_result_val Option[ImportsAr]
		var lift_result_val_c C.imports_ar_t
		if result.val == lift_result_val_c {
			lift_result_val.Unset()
		} else {
			var lift_result_val_val ImportsAr

			var lift_result_val_val_A Option[Option[uint32]]
			if result.val.a.is_some {
				var lift_result_val_val_A_val Option[uint32]
				if result.val.a.val.is_some {
					var lift_result_val_val_A_val_val uint32
					lift_result_val_val_A_val_val = uint32(result.val.a.val.val)
					lift_result_val_val_A_val.Set(lift_result_val_val_A_val_val)
				} else {
					lift_result_val_val_A_val.Unset()
				}
				lift_result_val_val_A.Set(lift_result_val_val_A_val)
			} else {
				lift_result_val_val_A.Unset()
			}
			lift_result_val_val.A = lift_result_val_val_A
			var lift_result_val_val_B ImportsR2

			var lift_result_val_val_B_C uint8
			lift_result_val_val_B_C = uint8(result.val.b.c)
			lift_result_val_val_B.C = lift_result_val_val_B_C
			lift_result_val_val.B = lift_result_val_val_B
			lift_result_val.Set(lift_result_val_val)
		}
		lift_result.Set(lift_result_val)
	} else {
		lift_result.Unset()
	}
	return lift_result
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
	var result C.imports_option_u32_t
	C.imports_option_roundtrip2(&lower_a, &result)
	var lift_result Option[Option[uint32]]
	if result.is_some {
		var lift_result_val Option[uint32]
		if result.val == 0 {
			lift_result_val.Unset()
		} else {
			var lift_result_val_val uint32
			lift_result_val_val = uint32(result.val)
			lift_result_val.Set(lift_result_val_val)
		}
		lift_result.Set(lift_result_val)
	} else {
		lift_result.Unset()
	}
	return lift_result
}

func ImportsOptionRoundtrip3(a Option[uint32]) Option[uint32] {
	var lower_a C.uint32_t
	if a.IsSome() {
		lower_a_val := C.uint32_t(a.Unwrap())
		lower_a = lower_a_val
	}
	var result C.uint32_t
	C.imports_option_roundtrip3(&lower_a, &result)
	var lift_result Option[uint32]
	if result == 0 {
		lift_result.Unset()
	} else {
		var lift_result_val uint32
		lift_result_val = uint32(result)
		lift_result.Set(lift_result_val)
	}
	return lift_result
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
	var result C.imports_ar_t
	C.imports_option_roundtrip4(&lower_a, &result)
	var lift_result Option[ImportsAr]
	var lift_result_c C.imports_ar_t
	if result == lift_result_c {
		lift_result.Unset()
	} else {
		var lift_result_val ImportsAr

		var lift_result_val_A Option[Option[uint32]]
		if result.a.is_some {
			var lift_result_val_A_val Option[uint32]
			if result.a.val.is_some {
				var lift_result_val_A_val_val uint32
				lift_result_val_A_val_val = uint32(result.a.val.val)
				lift_result_val_A_val.Set(lift_result_val_A_val_val)
			} else {
				lift_result_val_A_val.Unset()
			}
			lift_result_val_A.Set(lift_result_val_A_val)
		} else {
			lift_result_val_A.Unset()
		}
		lift_result_val.A = lift_result_val_A
		var lift_result_val_B ImportsR2

		var lift_result_val_B_C uint8
		lift_result_val_B_C = uint8(result.b.c)
		lift_result_val_B.C = lift_result_val_B_C
		lift_result_val.B = lift_result_val_B
		lift_result.Set(lift_result_val)
	}
	return lift_result
}

// default variants
type VariantsAr struct {
	A uint32
}

type VariantsF1 uint8

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
