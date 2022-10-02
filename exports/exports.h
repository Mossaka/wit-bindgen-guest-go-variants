#ifndef __BINDINGS_EXPORTS_H
#define __BINDINGS_EXPORTS_H
#ifdef __cplusplus
extern "C"
{
  #endif
  
  #include <stdint.h>
  #include <stdbool.h>
  typedef uint8_t exports_e1_t;
  #define EXPORTS_E1_A 0
  #define EXPORTS_E1_B 1
  typedef struct {
    uint8_t tag;
    union {
      int32_t a;
      int64_t b;
    } val;
  } exports_c1_t;
  #define EXPORTS_C1_A 0
  #define EXPORTS_C1_B 1
  typedef struct {
    bool is_some;
    float val;
  } exports_option_float32_t;
  typedef struct {
    bool is_err;
    union {
      uint32_t ok;
      float err;
    } val;
  } exports_result_u32_float32_t;
  typedef struct {
    bool is_err;
    union {
      double ok;
      uint8_t err;
    } val;
  } exports_result_float64_u8_t;
  void exports_test_imports(void);
  bool exports_roundtrip_option(exports_option_float32_t *a, uint8_t *ret0);
  void exports_roundtrip_result(exports_result_u32_float32_t *a, exports_result_float64_u8_t *ret0);
  exports_e1_t exports_roundtrip_enum(exports_e1_t a);
  void exports_variant_c1(exports_c1_t *a, exports_c1_t *ret0);
  #ifdef __cplusplus
}
#endif
#endif
