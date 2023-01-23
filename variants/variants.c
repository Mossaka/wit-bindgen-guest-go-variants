#include "variants.h"


typedef struct {
  bool is_some;
  uint32_t val;
} imports_option_u32_t;

typedef struct {
  bool is_some;
  uint8_t val;
} imports_option_u8_t;

typedef struct {
  bool is_err;
  union {
    uint64_t ok;
    uint8_t err;
  } val;
} imports_result_u64_u8_t;

__attribute__((import_module("imports"), import_name("option-roundtrip")))
void __wasm_import_imports_option_roundtrip(int32_t, int32_t, int32_t);

__attribute__((import_module("imports"), import_name("b")))
void __wasm_import_imports_b(int32_t);

__attribute__((import_module("imports"), import_name("result-roundtrip")))
void __wasm_import_imports_result_roundtrip(int32_t, int32_t, int32_t);

__attribute__((weak, export_name("cabi_realloc")))
void *cabi_realloc(void *ptr, size_t orig_size, size_t org_align, size_t new_size) {
  void *ret = realloc(ptr, new_size);
  if (!ret) abort();
  return ret;
}

// Component Adapters

bool imports_option_roundtrip(uint32_t *maybe_a, uint8_t *ret) {
  imports_option_u32_t a;
  a.is_some = maybe_a != NULL;if (maybe_a) {
    a.val = *maybe_a;
  }
  int32_t option;
  int32_t option1;
  if ((a).is_some) {
    const uint32_t *payload0 = &(a).val;
    option = 1;
    option1 = (int32_t) (*payload0);
  } else {
    option = 0;
    option1 = 0;
  }
  __attribute__((aligned(1)))
  uint8_t ret_area[2];
  int32_t ptr = (int32_t) &ret_area;
  __wasm_import_imports_option_roundtrip(option, option1, ptr);
  imports_option_u8_t option2;
  switch ((int32_t) (*((uint8_t*) (ptr + 0)))) {
    case 0: {
      option2.is_some = false;
      break;
    }
    case 1: {
      option2.is_some = true;
      option2.val = (uint8_t) ((int32_t) (*((uint8_t*) (ptr + 1))));
      break;
    }
  }
  *ret = option2.val;
  return option2.is_some;
}

void imports_b(uint32_t a) {
  __wasm_import_imports_b((int32_t) (a));
}

bool imports_result_roundtrip(imports_result_u32_u32_t *a, uint64_t *ret, uint8_t *err) {
  int32_t result;
  int32_t result1;
  if ((*a).is_err) {
    const uint32_t *payload0 = &(*a).val.err;result = 1;
    result1 = (int32_t) (*payload0);
  } else {
    const uint32_t *payload = &(*a).val.ok;result = 0;
    result1 = (int32_t) (*payload);
  }
  __attribute__((aligned(8)))
  uint8_t ret_area[16];
  int32_t ptr = (int32_t) &ret_area;
  __wasm_import_imports_result_roundtrip(result, result1, ptr);
  imports_result_u64_u8_t result2;
  switch ((int32_t) (*((uint8_t*) (ptr + 0)))) {
    case 0: {
      result2.is_err = false;
      result2.val.ok = (uint64_t) (*((int64_t*) (ptr + 8)));
      break;
    }
    case 1: {
      result2.is_err = true;
      result2.val.err = (uint8_t) ((int32_t) (*((uint8_t*) (ptr + 8))));
      break;
    }
  }
  if (!result2.is_err) {
    *ret = result2.val.ok;
    return 1;
  } else {
    *err = result2.val.err;
    return 0;
  }
}

__attribute__((export_name("test-imports")))
void __wasm_export_variants_test_imports(void) {
  variants_test_imports();
}

extern void __component_type_object_force_link_variants(void);
void __component_type_object_force_link_variants_public_use_in_this_compilation_unit(void) {
  __component_type_object_force_link_variants();
}
