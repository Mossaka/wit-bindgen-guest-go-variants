#include "variants.h"


typedef struct {
  bool is_some;
  imports_option_ar_t val;
} imports_option_option_ar_t;

typedef struct {
  bool is_err;
  union {
    uint64_t ok;
    uint8_t err;
  } val;
} imports_result_u64_u8_t;

typedef struct {
  bool is_some;
  imports_result_u32_void_t val;
} imports_option_result_u32_void_t;

typedef struct {
  bool is_some;
  variants_option_u32_t val;
} variants_option_option_u32_t;

typedef struct {
  bool is_some;
  variants_ar_t val;
} variants_option_ar_t;

typedef struct {
  bool is_some;
  variants_f1_t val;
} variants_option_f1_t;

typedef struct {
  bool is_some;
  variants_result_u32_void_t val;
} variants_option_result_u32_void_t;

__attribute__((import_module("imports"), import_name("option-roundtrip1")))
void __wasm_import_imports_option_roundtrip1(int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t);

__attribute__((import_module("imports"), import_name("option-roundtrip2")))
void __wasm_import_imports_option_roundtrip2(int32_t, int32_t, int32_t, int32_t);

__attribute__((import_module("imports"), import_name("option-roundtrip3")))
void __wasm_import_imports_option_roundtrip3(int32_t, int32_t, int32_t);

__attribute__((import_module("imports"), import_name("option-roundtrip4")))
void __wasm_import_imports_option_roundtrip4(int32_t, int32_t, int32_t, int32_t, int32_t, int32_t);

__attribute__((import_module("imports"), import_name("result-roundtrip")))
void __wasm_import_imports_result_roundtrip(int32_t, int32_t, int32_t);

__attribute__((import_module("imports"), import_name("roundtrip-option-result")))
void __wasm_import_imports_roundtrip_option_result(int32_t, int32_t, int32_t, int32_t);

__attribute__((import_module("imports"), import_name("roundtrip-result-option")))
void __wasm_import_imports_roundtrip_result_option(int32_t, int32_t, int32_t, int32_t);

__attribute__((weak, export_name("cabi_realloc")))
void *cabi_realloc(void *ptr, size_t orig_size, size_t org_align, size_t new_size) {
  void *ret = realloc(ptr, new_size);
  if (!ret) abort();
  return ret;
}

// Component Adapters

__attribute__((aligned(4)))
static uint8_t RET_AREA[12];

bool imports_option_roundtrip1(imports_option_ar_t *maybe_a, imports_option_ar_t *ret) {
  imports_option_option_ar_t a;
  a.is_some = maybe_a != NULL;if (maybe_a) {
    a.val = *maybe_a;
  }
  int32_t option16;
  int32_t option17;
  int32_t option18;
  int32_t option19;
  int32_t option20;
  int32_t option21;
  if ((a).is_some) {
    const imports_option_ar_t *payload0 = &(a).val;
    int32_t option11;
    int32_t option12;
    int32_t option13;
    int32_t option14;
    int32_t option15;
    if ((*payload0).is_some) {
      const imports_ar_t *payload2 = &(*payload0).val;
      int32_t option8;
      int32_t option9;
      int32_t option10;
      if (((*payload2).a).is_some) {
        const imports_option_u32_t *payload4 = &((*payload2).a).val;
        int32_t option;
        int32_t option7;
        if ((*payload4).is_some) {
          const uint32_t *payload6 = &(*payload4).val;
          option = 1;
          option7 = (int32_t) (*payload6);
        } else {
          option = 0;
          option7 = 0;
        }
        option8 = 1;
        option9 = option;
        option10 = option7;
      } else {
        option8 = 0;
        option9 = 0;
        option10 = 0;
      }
      option11 = 1;
      option12 = option8;
      option13 = option9;
      option14 = option10;
      option15 = (int32_t) (((*payload2).b).c);
    } else {
      option11 = 0;
      option12 = 0;
      option13 = 0;
      option14 = 0;
      option15 = 0;
    }
    option16 = 1;
    option17 = option11;
    option18 = option12;
    option19 = option13;
    option20 = option14;
    option21 = option15;
  } else {
    option16 = 0;
    option17 = 0;
    option18 = 0;
    option19 = 0;
    option20 = 0;
    option21 = 0;
  }
  __attribute__((aligned(4)))
  uint8_t ret_area[24];
  int32_t ptr = (int32_t) &ret_area;
  __wasm_import_imports_option_roundtrip1(option16, option17, option18, option19, option20, option21, ptr);
  imports_option_option_ar_t option25;
  switch ((int32_t) (*((uint8_t*) (ptr + 0)))) {
    case 0: {
      option25.is_some = false;
      break;
    }
    case 1: {
      option25.is_some = true;
      imports_option_ar_t option24;
      switch ((int32_t) (*((uint8_t*) (ptr + 4)))) {
        case 0: {
          option24.is_some = false;
          break;
        }
        case 1: {
          option24.is_some = true;
          imports_option_option_u32_t option23;
          switch ((int32_t) (*((uint8_t*) (ptr + 8)))) {
            case 0: {
              option23.is_some = false;
              break;
            }
            case 1: {
              option23.is_some = true;
              imports_option_u32_t option22;
              switch ((int32_t) (*((uint8_t*) (ptr + 12)))) {
                case 0: {
                  option22.is_some = false;
                  break;
                }
                case 1: {
                  option22.is_some = true;
                  option22.val = (uint32_t) (*((int32_t*) (ptr + 16)));
                  break;
                }
              }
              
              option23.val = option22;
              break;
            }
          }
          
          option24.val = (imports_ar_t) {
            option23,
            (imports_r2_t) {
              (uint8_t) ((int32_t) (*((uint8_t*) (ptr + 20)))),
            },
          };
          break;
        }
      }
      
      option25.val = option24;
      break;
    }
  }
  *ret = option25.val;
  return option25.is_some;
}

bool imports_option_roundtrip2(imports_option_u32_t *maybe_a, imports_option_u32_t *ret) {
  imports_option_option_u32_t a;
  a.is_some = maybe_a != NULL;if (maybe_a) {
    a.val = *maybe_a;
  }
  int32_t option4;
  int32_t option5;
  int32_t option6;
  if ((a).is_some) {
    const imports_option_u32_t *payload0 = &(a).val;
    int32_t option;
    int32_t option3;
    if ((*payload0).is_some) {
      const uint32_t *payload2 = &(*payload0).val;
      option = 1;
      option3 = (int32_t) (*payload2);
    } else {
      option = 0;
      option3 = 0;
    }
    option4 = 1;
    option5 = option;
    option6 = option3;
  } else {
    option4 = 0;
    option5 = 0;
    option6 = 0;
  }
  __attribute__((aligned(4)))
  uint8_t ret_area[12];
  int32_t ptr = (int32_t) &ret_area;
  __wasm_import_imports_option_roundtrip2(option4, option5, option6, ptr);
  imports_option_option_u32_t option8;
  switch ((int32_t) (*((uint8_t*) (ptr + 0)))) {
    case 0: {
      option8.is_some = false;
      break;
    }
    case 1: {
      option8.is_some = true;
      imports_option_u32_t option7;
      switch ((int32_t) (*((uint8_t*) (ptr + 4)))) {
        case 0: {
          option7.is_some = false;
          break;
        }
        case 1: {
          option7.is_some = true;
          option7.val = (uint32_t) (*((int32_t*) (ptr + 8)));
          break;
        }
      }
      
      option8.val = option7;
      break;
    }
  }
  *ret = option8.val;
  return option8.is_some;
}

bool imports_option_roundtrip3(uint32_t *maybe_a, uint32_t *ret) {
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
  __attribute__((aligned(4)))
  uint8_t ret_area[8];
  int32_t ptr = (int32_t) &ret_area;
  __wasm_import_imports_option_roundtrip3(option, option1, ptr);
  imports_option_u32_t option2;
  switch ((int32_t) (*((uint8_t*) (ptr + 0)))) {
    case 0: {
      option2.is_some = false;
      break;
    }
    case 1: {
      option2.is_some = true;
      option2.val = (uint32_t) (*((int32_t*) (ptr + 4)));
      break;
    }
  }
  *ret = option2.val;
  return option2.is_some;
}

bool imports_option_roundtrip4(imports_ar_t *maybe_a, imports_ar_t *ret) {
  imports_option_ar_t a;
  a.is_some = maybe_a != NULL;if (maybe_a) {
    a.val = *maybe_a;
  }
  int32_t option9;
  int32_t option10;
  int32_t option11;
  int32_t option12;
  int32_t option13;
  if ((a).is_some) {
    const imports_ar_t *payload0 = &(a).val;
    int32_t option6;
    int32_t option7;
    int32_t option8;
    if (((*payload0).a).is_some) {
      const imports_option_u32_t *payload2 = &((*payload0).a).val;
      int32_t option;
      int32_t option5;
      if ((*payload2).is_some) {
        const uint32_t *payload4 = &(*payload2).val;
        option = 1;
        option5 = (int32_t) (*payload4);
      } else {
        option = 0;
        option5 = 0;
      }
      option6 = 1;
      option7 = option;
      option8 = option5;
    } else {
      option6 = 0;
      option7 = 0;
      option8 = 0;
    }
    option9 = 1;
    option10 = option6;
    option11 = option7;
    option12 = option8;
    option13 = (int32_t) (((*payload0).b).c);
  } else {
    option9 = 0;
    option10 = 0;
    option11 = 0;
    option12 = 0;
    option13 = 0;
  }
  __attribute__((aligned(4)))
  uint8_t ret_area[20];
  int32_t ptr = (int32_t) &ret_area;
  __wasm_import_imports_option_roundtrip4(option9, option10, option11, option12, option13, ptr);
  imports_option_ar_t option16;
  switch ((int32_t) (*((uint8_t*) (ptr + 0)))) {
    case 0: {
      option16.is_some = false;
      break;
    }
    case 1: {
      option16.is_some = true;
      imports_option_option_u32_t option15;
      switch ((int32_t) (*((uint8_t*) (ptr + 4)))) {
        case 0: {
          option15.is_some = false;
          break;
        }
        case 1: {
          option15.is_some = true;
          imports_option_u32_t option14;
          switch ((int32_t) (*((uint8_t*) (ptr + 8)))) {
            case 0: {
              option14.is_some = false;
              break;
            }
            case 1: {
              option14.is_some = true;
              option14.val = (uint32_t) (*((int32_t*) (ptr + 12)));
              break;
            }
          }
          
          option15.val = option14;
          break;
        }
      }
      
      option16.val = (imports_ar_t) {
        option15,
        (imports_r2_t) {
          (uint8_t) ((int32_t) (*((uint8_t*) (ptr + 16)))),
        },
      };
      break;
    }
  }
  *ret = option16.val;
  return option16.is_some;
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

bool imports_roundtrip_option_result(imports_result_u32_void_t *maybe_a, imports_result_u32_void_t *ret) {
  imports_option_result_u32_void_t a;
  a.is_some = maybe_a != NULL;if (maybe_a) {
    a.val = *maybe_a;
  }
  int32_t option;
  int32_t option4;
  int32_t option5;
  if ((a).is_some) {
    const imports_result_u32_void_t *payload0 = &(a).val;
    int32_t result;
    int32_t result3;
    if ((*payload0).is_err) {
      result = 1;
      result3 = 0;
    } else {
      const uint32_t *payload1 = &(*payload0).val.ok;result = 0;
      result3 = (int32_t) (*payload1);
    }
    option = 1;
    option4 = result;
    option5 = result3;
  } else {
    option = 0;
    option4 = 0;
    option5 = 0;
  }
  __attribute__((aligned(4)))
  uint8_t ret_area[12];
  int32_t ptr = (int32_t) &ret_area;
  __wasm_import_imports_roundtrip_option_result(option, option4, option5, ptr);
  imports_option_result_u32_void_t option7;
  switch ((int32_t) (*((uint8_t*) (ptr + 0)))) {
    case 0: {
      option7.is_some = false;
      break;
    }
    case 1: {
      option7.is_some = true;
      imports_result_u32_void_t result6;
      switch ((int32_t) (*((uint8_t*) (ptr + 4)))) {
        case 0: {
          result6.is_err = false;
          result6.val.ok = (uint32_t) (*((int32_t*) (ptr + 8)));
          break;
        }
        case 1: {
          result6.is_err = true;
          break;
        }
      }
      
      option7.val = result6;
      break;
    }
  }
  *ret = option7.val;
  return option7.is_some;
}

bool imports_roundtrip_result_option(imports_result_option_u32_void_t *a, imports_option_u32_t *ret) {
  int32_t result;
  int32_t result4;
  int32_t result5;
  if ((*a).is_err) {
    result = 1;
    result4 = 0;
    result5 = 0;
  } else {
    const imports_option_u32_t *payload = &(*a).val.ok;int32_t option;
    int32_t option2;
    if ((*payload).is_some) {
      const uint32_t *payload1 = &(*payload).val;
      option = 1;
      option2 = (int32_t) (*payload1);
    } else {
      option = 0;
      option2 = 0;
    }
    result = 0;
    result4 = option;
    result5 = option2;
  }
  __attribute__((aligned(4)))
  uint8_t ret_area[12];
  int32_t ptr = (int32_t) &ret_area;
  __wasm_import_imports_roundtrip_result_option(result, result4, result5, ptr);
  imports_result_option_u32_void_t result7;
  switch ((int32_t) (*((uint8_t*) (ptr + 0)))) {
    case 0: {
      result7.is_err = false;
      imports_option_u32_t option6;
      switch ((int32_t) (*((uint8_t*) (ptr + 4)))) {
        case 0: {
          option6.is_some = false;
          break;
        }
        case 1: {
          option6.is_some = true;
          option6.val = (uint32_t) (*((int32_t*) (ptr + 8)));
          break;
        }
      }
      
      result7.val.ok = option6;
      break;
    }
    case 1: {
      result7.is_err = true;
      break;
    }
  }
  if (!result7.is_err) {
    *ret = result7.val.ok;
    return 1;
  } else {
    return 0;
  }
}

__attribute__((export_name("test-imports")))
void __wasm_export_variants_test_imports(void) {
  variants_test_imports();
}

__attribute__((export_name("roundtrip-option1")))
int32_t __wasm_export_variants_roundtrip_option1(int32_t arg, int32_t arg0, int32_t arg1) {
  variants_option_option_u32_t option2;
  switch (arg) {
    case 0: {
      option2.is_some = false;
      break;
    }
    case 1: {
      option2.is_some = true;
      variants_option_u32_t option;
      switch (arg0) {
        case 0: {
          option.is_some = false;
          break;
        }
        case 1: {
          option.is_some = true;
          option.val = (uint32_t) (arg1);
          break;
        }
      }
      
      option2.val = option;
      break;
    }
  }
  variants_option_u32_t val;
  bool ret = variants_roundtrip_option1(option2.is_some ? &(option2.val) : NULL, &val);
  
  variants_option_option_u32_t ret3;
  ret3.is_some = ret;
  ret3.val = val;
  int32_t ptr = (int32_t) &RET_AREA;
  if ((ret3).is_some) {
    const variants_option_u32_t *payload4 = &(ret3).val;
    *((int8_t*)(ptr + 0)) = 1;
    if ((*payload4).is_some) {
      const uint32_t *payload6 = &(*payload4).val;
      *((int8_t*)(ptr + 4)) = 1;
      *((int32_t*)(ptr + 8)) = (int32_t) (*payload6);
    } else {
      *((int8_t*)(ptr + 4)) = 0;
    }
  } else {
    *((int8_t*)(ptr + 0)) = 0;
  }
  return ptr;
}

__attribute__((export_name("roundtrip-option2")))
int32_t __wasm_export_variants_roundtrip_option2(int32_t arg, int32_t arg0) {
  variants_option_ar_t option;
  switch (arg) {
    case 0: {
      option.is_some = false;
      break;
    }
    case 1: {
      option.is_some = true;
      option.val = (variants_ar_t) {
        (uint32_t) (arg0),
      };
      break;
    }
  }
  variants_ar_t val;
  bool ret = variants_roundtrip_option2(option.is_some ? &(option.val) : NULL, &val);
  
  variants_option_ar_t ret1;
  ret1.is_some = ret;
  ret1.val = val;
  int32_t ptr = (int32_t) &RET_AREA;
  if ((ret1).is_some) {
    const variants_ar_t *payload2 = &(ret1).val;
    *((int8_t*)(ptr + 0)) = 1;
    *((int32_t*)(ptr + 4)) = (int32_t) ((*payload2).a);
  } else {
    *((int8_t*)(ptr + 0)) = 0;
  }
  return ptr;
}

__attribute__((export_name("roundtrip-option3")))
int32_t __wasm_export_variants_roundtrip_option3(int32_t arg, int32_t arg0) {
  variants_option_u32_t option;
  switch (arg) {
    case 0: {
      option.is_some = false;
      break;
    }
    case 1: {
      option.is_some = true;
      option.val = (uint32_t) (arg0);
      break;
    }
  }
  uint32_t val;
  bool ret = variants_roundtrip_option3(option.is_some ? &(option.val) : NULL, &val);
  
  variants_option_u32_t ret1;
  ret1.is_some = ret;
  ret1.val = val;
  int32_t ptr = (int32_t) &RET_AREA;
  if ((ret1).is_some) {
    const uint32_t *payload2 = &(ret1).val;
    *((int8_t*)(ptr + 0)) = 1;
    *((int32_t*)(ptr + 4)) = (int32_t) (*payload2);
  } else {
    *((int8_t*)(ptr + 0)) = 0;
  }
  return ptr;
}

__attribute__((export_name("roundtrip-option4")))
int32_t __wasm_export_variants_roundtrip_option4(int32_t arg, int32_t arg0) {
  variants_option_f1_t option;
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
  }
  variants_f1_t val;
  bool ret = variants_roundtrip_option4(option.is_some ? &(option.val) : NULL, &val);
  
  variants_option_f1_t ret1;
  ret1.is_some = ret;
  ret1.val = val;
  int32_t ptr = (int32_t) &RET_AREA;
  if ((ret1).is_some) {
    const variants_f1_t *payload2 = &(ret1).val;
    *((int8_t*)(ptr + 0)) = 1;
    *((int8_t*)(ptr + 1)) = *payload2;
  } else {
    *((int8_t*)(ptr + 0)) = 0;
  }
  return ptr;
}

__attribute__((export_name("roundtrip-result")))
int32_t __wasm_export_variants_roundtrip_result(int32_t arg, int32_t arg0) {
  variants_result_ar_void_t result;
  switch (arg) {
    case 0: {
      result.is_err = false;
      result.val.ok = (variants_ar_t) {
        (uint32_t) (arg0),
      };
      break;
    }
    case 1: {
      result.is_err = true;
      break;
    }
  }
  variants_result_ar_void_t arg1 = result;
  variants_result_ar_void_t ret;
  variants_ar_t ok;
  ret.is_err = !variants_roundtrip_result(&arg1, &ok);
  if (!ret.is_err) {
    ret.val.ok = ok;
  }
  int32_t ptr = (int32_t) &RET_AREA;
  if ((ret).is_err) {
    *((int8_t*)(ptr + 0)) = 1;
  } else {
    const variants_ar_t *payload = &(ret).val.ok;*((int8_t*)(ptr + 0)) = 0;
    *((int32_t*)(ptr + 4)) = (int32_t) ((*payload).a);
  }
  return ptr;
}

__attribute__((export_name("roundtrip-option-result")))
int32_t __wasm_export_variants_roundtrip_option_result(int32_t arg, int32_t arg0, int32_t arg1) {
  variants_option_result_u32_void_t option;
  switch (arg) {
    case 0: {
      option.is_some = false;
      break;
    }
    case 1: {
      option.is_some = true;
      variants_result_u32_void_t result;
      switch (arg0) {
        case 0: {
          result.is_err = false;
          result.val.ok = (uint32_t) (arg1);
          break;
        }
        case 1: {
          result.is_err = true;
          break;
        }
      }
      
      option.val = result;
      break;
    }
  }
  variants_result_u32_void_t val;
  bool ret = variants_roundtrip_option_result(option.is_some ? &(option.val) : NULL, &val);
  
  variants_option_result_u32_void_t ret2;
  ret2.is_some = ret;
  ret2.val = val;
  int32_t ptr = (int32_t) &RET_AREA;
  if ((ret2).is_some) {
    const variants_result_u32_void_t *payload3 = &(ret2).val;
    *((int8_t*)(ptr + 0)) = 1;
    if ((*payload3).is_err) {
      *((int8_t*)(ptr + 4)) = 1;
    } else {
      const uint32_t *payload4 = &(*payload3).val.ok;*((int8_t*)(ptr + 4)) = 0;
      *((int32_t*)(ptr + 8)) = (int32_t) (*payload4);
    }
  } else {
    *((int8_t*)(ptr + 0)) = 0;
  }
  return ptr;
}

__attribute__((export_name("roundtrip-result-option")))
int32_t __wasm_export_variants_roundtrip_result_option(int32_t arg, int32_t arg0, int32_t arg1) {
  variants_result_option_u32_void_t result;
  switch (arg) {
    case 0: {
      result.is_err = false;
      variants_option_u32_t option;
      switch (arg0) {
        case 0: {
          option.is_some = false;
          break;
        }
        case 1: {
          option.is_some = true;
          option.val = (uint32_t) (arg1);
          break;
        }
      }
      
      result.val.ok = option;
      break;
    }
    case 1: {
      result.is_err = true;
      break;
    }
  }
  variants_result_option_u32_void_t arg2 = result;
  variants_result_option_u32_void_t ret;
  variants_option_u32_t ok;
  ret.is_err = !variants_roundtrip_result_option(&arg2, &ok);
  if (!ret.is_err) {
    ret.val.ok = ok;
  }
  int32_t ptr = (int32_t) &RET_AREA;
  if ((ret).is_err) {
    *((int8_t*)(ptr + 0)) = 1;
  } else {
    const variants_option_u32_t *payload = &(ret).val.ok;*((int8_t*)(ptr + 0)) = 0;
    if ((*payload).is_some) {
      const uint32_t *payload4 = &(*payload).val;
      *((int8_t*)(ptr + 4)) = 1;
      *((int32_t*)(ptr + 8)) = (int32_t) (*payload4);
    } else {
      *((int8_t*)(ptr + 4)) = 0;
    }
  }
  return ptr;
}

extern void __component_type_object_force_link_variants(void);
void __component_type_object_force_link_variants_public_use_in_this_compilation_unit(void) {
  __component_type_object_force_link_variants();
}
