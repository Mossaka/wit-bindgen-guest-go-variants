#ifndef __BINDINGS_VARIANTS_H
#define __BINDINGS_VARIANTS_H
#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

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
    uint32_t err;
  } val;
} variants_result_u32_u32_t;

// Imported Functions from `imports`
bool imports_option_roundtrip(uint32_t *maybe_a, uint8_t *ret);
bool imports_result_roundtrip(imports_result_u32_u32_t *a, uint64_t *ret, uint8_t *err);

// Exported Functions from `variants`
void variants_test_imports(void);
bool variants_roundtrip_option(uint32_t *maybe_a, uint32_t *ret);
bool variants_roundtrip_result(variants_result_u32_u32_t *a, uint64_t *ret, uint8_t *err);

#ifdef __cplusplus
}
#endif
#endif
