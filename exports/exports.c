#include <stdlib.h>
#include <exports.h>

__attribute__((weak, export_name("cabi_realloc")))
void *cabi_realloc(
void *ptr,
size_t orig_size,
size_t org_align,
size_t new_size
) {
  void *ret = realloc(ptr, new_size);
  if (!ret)
  abort();
  return ret;
}
typedef struct {
  bool is_some;
  uint8_t val;
} exports_option_u8_t;

__attribute__((aligned(8)))
static uint8_t RET_AREA[16];
__attribute__((export_name("test-imports: func() -> ()")))
void __wasm_export_exports_test_imports(void) {
  exports_test_imports();
}
__attribute__((export_name("roundtrip-option: func(a: option<float32>) -> option<u8>")))
int32_t __wasm_export_exports_roundtrip_option(int32_t arg, float arg0) {
  exports_option_float32_t option;
  switch (arg) {
    case 0: {
      option.is_some = false;
      
      break;
    }
    case 1: {
      option.is_some = true;
      
      option.val = arg0;
      break;
    }
  }exports_option_float32_t arg1 = option;
  uint8_t val;
  bool ret = exports_roundtrip_option(&arg1, &val);
  
  exports_option_u8_t ret2;
  ret2.is_some = ret;
  ret2.val = val;
  int32_t ptr = (int32_t) &RET_AREA;
  
  if ((ret2).is_some) {
    const uint8_t *payload3 = &(ret2).val;
    *((int8_t*)(ptr + 0)) = 1;
    *((int8_t*)(ptr + 1)) = (int32_t) (*payload3);
    
  } else {
    *((int8_t*)(ptr + 0)) = 0;
    
  }
  return ptr;
}
__attribute__((export_name("roundtrip-result: func(a: result<u32, float32>) -> result<float64, u8>")))
int32_t __wasm_export_exports_roundtrip_result(int32_t arg, int32_t arg0) {
  exports_result_u32_float32_t result;
  switch (arg) {
    case 0: {
      result.is_err = false;
      
      result.val.ok = (uint32_t) (arg0);
      break;
    }
    case 1: {
      result.is_err = true;
      
      result.val.err = ((union { int32_t a; float b; }){ arg0 }).b;
      break;
    }
  }exports_result_u32_float32_t arg1 = result;
  exports_result_float64_u8_t ret;
  exports_roundtrip_result(&arg1, &ret);
  int32_t ptr = (int32_t) &RET_AREA;
  
  if ((ret).is_err) {
    const uint8_t *payload2 = &(ret).val.err;
    *((int8_t*)(ptr + 0)) = 1;
    *((int8_t*)(ptr + 8)) = (int32_t) (*payload2);
    
  } else {
    const double *payload = &(ret).val.ok;
    *((int8_t*)(ptr + 0)) = 0;
    *((double*)(ptr + 8)) = *payload;
    
  }
  return ptr;
}
__attribute__((export_name("roundtrip-enum: func(a: enum { a, b }) -> enum { a, b }")))
int32_t __wasm_export_exports_roundtrip_enum(int32_t arg) {
  exports_e1_t ret = exports_roundtrip_enum(arg);
  return (int32_t) ret;
}
__attribute__((export_name("variant-c1: func(a: variant { a(s32), b(s64) }) -> variant { a(s32), b(s64) }")))
int32_t __wasm_export_exports_variant_c1(int32_t arg, int64_t arg0) {
  exports_c1_t variant;
  variant.tag = arg;
  switch ((int32_t) variant.tag) {
    case 0: {
      variant.val.a = (int32_t) arg0;
      break;
    }
    case 1: {
      variant.val.b = arg0;
      break;
    }
  }
  exports_c1_t arg1 = variant;
  exports_c1_t ret;
  exports_variant_c1(&arg1, &ret);
  int32_t ptr = (int32_t) &RET_AREA;
  switch ((int32_t) (ret).tag) {
    case 0: {
      const int32_t *payload = &(ret).val.a;
      *((int8_t*)(ptr + 0)) = 0;
      *((int32_t*)(ptr + 8)) = *payload;
      break;
    }
    case 1: {
      const int64_t *payload2 = &(ret).val.b;
      *((int8_t*)(ptr + 0)) = 1;
      *((int64_t*)(ptr + 8)) = *payload2;
      break;
    }
  }
  return ptr;
}
