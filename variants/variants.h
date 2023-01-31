#ifndef __BINDINGS_VARIANTS_H
#define __BINDINGS_VARIANTS_H
#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

typedef struct {
  uint8_t c;
} imports_r2_t;

typedef struct {
  bool is_some;
  uint32_t val;
} imports_option_u32_t;

typedef struct {
  bool is_some;
  imports_option_u32_t val;
} imports_option_option_u32_t;

typedef struct {
  imports_option_option_u32_t a;
  imports_r2_t b;
} imports_ar_t;

typedef struct {
  bool is_some;
  imports_ar_t val;
} imports_option_ar_t;

typedef struct {
  bool is_err;
  union {
    uint32_t ok;
    uint32_t err;
  } val;
} imports_result_u32_u32_t;

typedef struct {
  bool is_err;
  union {
    uint32_t ok;
  } val;
} imports_result_u32_void_t;

typedef struct {
  bool is_err;
  union {
    imports_option_u32_t ok;
  } val;
} imports_result_option_u32_void_t;

typedef struct {
  uint32_t a;
} variants_ar_t;

typedef uint8_t variants_f1_t;

#define VARIANTS_F1_A (1 << 0)
#define VARIANTS_F1_B (1 << 1)

typedef struct {
  bool is_some;
  uint32_t val;
} variants_option_u32_t;

typedef struct {
  bool is_err;
  union {
    variants_ar_t ok;
  } val;
} variants_result_ar_void_t;

typedef struct {
  bool is_err;
  union {
    uint32_t ok;
  } val;
} variants_result_u32_void_t;

typedef struct {
  bool is_err;
  union {
    variants_option_u32_t ok;
  } val;
} variants_result_option_u32_void_t;

// Imported Functions from `imports`
bool imports_option_roundtrip1(imports_option_ar_t *maybe_a, imports_option_ar_t *ret);
bool imports_option_roundtrip2(imports_option_u32_t *maybe_a, imports_option_u32_t *ret);
bool imports_option_roundtrip3(uint32_t *maybe_a, uint32_t *ret);
bool imports_option_roundtrip4(imports_ar_t *maybe_a, imports_ar_t *ret);
void imports_option_roundtrip5(uint32_t *maybe_a, imports_option_u32_t *ret0, uint32_t *ret1);
bool imports_result_roundtrip(imports_result_u32_u32_t *a, uint64_t *ret, uint8_t *err);
bool imports_roundtrip_option_result(imports_result_u32_void_t *maybe_a, imports_result_u32_void_t *ret);
bool imports_roundtrip_result_option(imports_result_option_u32_void_t *a, imports_option_u32_t *ret);

// Exported Functions from `variants`
void variants_test_imports(void);
bool variants_roundtrip_option1(variants_option_u32_t *maybe_a, variants_option_u32_t *ret);
bool variants_roundtrip_option2(variants_ar_t *maybe_a, variants_ar_t *ret);
bool variants_roundtrip_option3(uint32_t *maybe_a, uint32_t *ret);
bool variants_roundtrip_option4(variants_f1_t *maybe_a, variants_f1_t *ret);
bool variants_roundtrip_result(variants_result_ar_void_t *a, variants_ar_t *ret);
bool variants_roundtrip_option_result(variants_result_u32_void_t *maybe_a, variants_result_u32_void_t *ret);
bool variants_roundtrip_result_option(variants_result_option_u32_void_t *a, variants_option_u32_t *ret);

#ifdef __cplusplus
}
#endif
#endif
