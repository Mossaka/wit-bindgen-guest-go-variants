#ifndef __BINDINGS_IMPORTS_H
#define __BINDINGS_IMPORTS_H
#ifdef __cplusplus
extern "C"
{
  #endif
  
  #include <stdint.h>
  #include <stdbool.h>
  typedef uint8_t imports_e1_t;
  #define IMPORTS_E1_A 0
  #define IMPORTS_E1_B 1
  typedef struct {
    uint8_t tag;
    union {
      int32_t a;
      int64_t b;
    } val;
  } imports_c1_t;
  #define IMPORTS_C1_A 0
  #define IMPORTS_C1_B 1
  typedef struct {
    bool is_some;
    float val;
  } imports_option_float32_t;
  typedef struct {
    bool is_err;
    union {
      uint32_t ok;
      float err;
    } val;
  } imports_result_u32_float32_t;
  typedef struct {
    bool is_err;
    union {
      double ok;
      uint8_t err;
    } val;
  } imports_result_float64_u8_t;
  bool imports_roundtrip_option(imports_option_float32_t *a, uint8_t *ret0);
  void imports_roundtrip_result(imports_result_u32_float32_t *a, imports_result_float64_u8_t *ret0);
  imports_e1_t imports_roundtrip_enum(imports_e1_t a);
  void imports_variant_c1(imports_c1_t *a, imports_c1_t *ret0);
  #ifdef __cplusplus
}
#endif
#endif
