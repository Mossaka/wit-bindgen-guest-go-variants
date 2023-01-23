(module
  (type (;0;) (func))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (param i32) (result i32)))
  (type (;6;) (func (param i32 i32 i32)))
  (type (;7;) (func (result i32)))
  (import "wasi_snapshot_preview1" "fd_write" (func $runtime.fd_write (;0;) (type 3)))
  (import "imports" "option-roundtrip" (func $__wasm_import_imports_option_roundtrip (;1;) (type 6)))
  (func $__wasm_call_ctors (;2;) (type 0)
    nop
  )
  (func $github.com/mossaka/go-wit-bindgen-variants/variants.OptionRoundtrip (;3;) (type 1) (param i32)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 1
      end
      global.get 1
      i32.const 1
      local.get 0
      local.get 0
      i32.const 1
      i32.ne
      global.get 1
      select
      select
      if ;; label = @2
        local.get 1
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @3
          i32.const 1
          call $#func4<_github.com/mossaka/go-wit-bindgen-variants/result.Option_uint32__.Unwrap_uint32_>
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
        local.get 1
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @3
          call $runtime.nilPanic
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @3
          unreachable
        end
      end
      local.get 1
      i32.const 2
      i32.eq
      i32.const 1
      global.get 1
      select
      if ;; label = @2
        i32.const 0
        i32.const 0
        call $imports_option_roundtrip
        drop
        i32.const 2
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $#func4<_github.com/mossaka/go-wit-bindgen-variants/result.Option_uint32__.Unwrap_uint32_> (@name "(github.com/mossaka/go-wit-bindgen-variants/result.Option[uint32]).Unwrap[uint32]") (;4;) (type 1) (param i32)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 1
      end
      global.get 1
      i32.const 1
      local.get 0
      i32.const 1
      i32.eq
      select
      if ;; label = @2
        local.get 1
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @3
          i32.const 65704
          call $runtime._panic
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @3
          unreachable
        end
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $runtime.nilPanic (;5;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        i32.const 65592
        i32.const 23
        call $runtime.runtimePanic
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $runtime._panic (;6;) (type 1) (param i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.sub
      i32.store
      global.get 2
      i32.load
      i32.load
      local.set 0
    end
    block (result i32) ;; label = @1
      block (result i32) ;; label = @2
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @3
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 1
        end
        local.get 1
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        i32.const 65563
        i32.const 7
        call $runtime.printstring
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 1
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if ;; label = @2
        local.get 0
        call $runtime.printitf
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 1
      i32.const 2
      i32.eq
      i32.const 1
      global.get 1
      select
      if ;; label = @2
        call $runtime.printnl
        i32.const 2
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $variants_test_imports (;7;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        call $#func8<interface:_TestImports:func:_____.TestImports$invoke>
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $#func8<interface:_TestImports:func:_____.TestImports$invoke> (@name "interface:{TestImports:func:{}{}}.TestImports$invoke") (;8;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        call $#func9<_main.VariantsImpl_.TestImports$invoke>
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $#func9<_main.VariantsImpl_.TestImports$invoke> (@name "(main.VariantsImpl).TestImports$invoke") (;9;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        call $#func27<_main.VariantsImpl_.TestImports>
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $internal/task.Pause (;10;) (type 0)
    (local i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.sub
      i32.store
      global.get 2
      i32.load
      i32.load
      local.set 0
    end
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 1
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        i32.const 65724
        i32.load
        local.tee 0
        i32.eqz
        local.set 2
      end
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            global.get 1
            i32.eqz
            if ;; label = @5
              local.get 2
              br_if 1 (;@4;)
              local.get 0
              i32.const 24
              i32.add
              local.tee 0
              i32.load
              i32.load
              i32.const -1204030091
              i32.ne
              br_if 2 (;@3;)
            end
            local.get 1
            i32.const 0
            global.get 1
            select
            i32.eqz
            if ;; label = @5
              local.get 0
              call $tinygo_unwind
              i32.const 0
              global.get 1
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              drop
            end
            global.get 1
            i32.eqz
            if ;; label = @5
              i32.const 65724
              i32.load
              local.tee 0
              br_if 3 (;@2;)
            end
          end
          local.get 1
          i32.const 1
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @4
            call $runtime.nilPanic
            i32.const 1
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @4
            unreachable
          end
        end
        local.get 1
        i32.const 2
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @3
          i32.const 65536
          i32.const 14
          call $runtime.runtimePanic
          i32.const 2
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @3
          unreachable
        end
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 0
        i32.const 24
        i32.add
        i32.load
        i32.const -1204030091
        i32.store
      end
      return
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $runtime.runtimePanic (;11;) (type 4) (param i32 i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=4
      local.set 1
    end
    block (result i32) ;; label = @1
      block (result i32) ;; label = @2
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @3
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 2
        end
        local.get 2
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        i32.const 65570
        i32.const 22
        call $runtime.printstring
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 2
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if ;; label = @2
        local.get 0
        local.get 1
        call $runtime.printstring
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 2
      i32.const 2
      i32.eq
      i32.const 1
      global.get 1
      select
      if ;; label = @2
        call $runtime.printnl
        i32.const 2
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store
  )
  (func $runtime.alloc (;12;) (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 2
      local.get 1
      i32.load offset=4
      local.set 1
    end
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 4
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        i32.const 65712
        i32.const 65712
        i32.load
        local.tee 2
        local.get 0
        i32.const 15
        i32.add
        i32.const -16
        i32.and
        local.tee 1
        i32.add
        local.tee 0
        i32.store
        i32.const 65728
        i32.load
        local.set 3
      end
      block ;; label = @2
        global.get 1
        i32.eqz
        if ;; label = @3
          loop ;; label = @4
            local.get 0
            local.get 3
            i32.lt_u
            br_if 2 (;@2;)
            memory.size
            memory.grow
            i32.const -1
            i32.ne
            if ;; label = @5
              i32.const 65728
              memory.size
              i32.const 16
              i32.shl
              local.tee 3
              i32.store
              i32.const 65712
              i32.load
              local.set 0
              br 1 (;@4;)
            end
          end
        end
        local.get 4
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @3
          i32.const 65550
          i32.const 13
          call $runtime.runtimePanic
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @3
          unreachable
        end
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 2
        i32.const 0
        local.get 1
        memory.fill
        local.get 2
        return
      end
      unreachable
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 0
    local.get 2
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store
    i32.const 0
  )
  (func $runtime.printstring (;13;) (type 4) (param i32 i32)
    (local i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=4
      local.set 1
      local.get 2
      i32.load offset=8
      local.set 2
    end
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 3
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 1
        i32.const 0
        local.get 1
        i32.const 0
        i32.gt_s
        local.tee 2
        select
        local.set 1
      end
      loop ;; label = @2
        block ;; label = @3
          global.get 1
          i32.eqz
          if ;; label = @4
            local.get 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.load8_u
            local.set 2
          end
          local.get 3
          i32.const 0
          global.get 1
          select
          i32.eqz
          if ;; label = @4
            local.get 2
            call $runtime.putchar
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @4
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 1
            i32.const 1
            i32.sub
            local.set 1
            br 2 (;@2;)
          end
        end
      end
      return
    end
    local.set 3
    global.get 2
    i32.load
    local.get 3
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 2
    i32.store offset=8
    global.get 2
    global.get 2
    i32.load
    i32.const 12
    i32.add
    i32.store
  )
  (func $runtime.printnl (;14;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        i32.const 10
        call $runtime.putchar
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $runtime.putchar (;15;) (type 1) (param i32)
    (local i32 i32 i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 2
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        i32.const 65732
        i32.load
        local.tee 3
        i32.const 119
        i32.gt_u
        local.set 1
      end
      block ;; label = @2
        global.get 1
        i32.eqz
        if ;; label = @3
          local.get 1
          br_if 1 (;@2;)
          i32.const 65732
          local.get 3
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          local.get 3
          i32.const 65736
          i32.add
          local.get 0
          i32.store8
          local.get 0
          i32.const 255
          i32.and
          i32.const 10
          i32.eq
          local.set 0
        end
        block ;; label = @3
          global.get 1
          i32.eqz
          if ;; label = @4
            local.get 0
            i32.const 1
            local.get 3
            i32.const 119
            i32.ne
            select
            i32.eqz
            br_if 1 (;@3;)
            i32.const 65720
            local.get 1
            i32.store
          end
          local.get 2
          i32.const 0
          global.get 1
          select
          i32.eqz
          if ;; label = @4
            i32.const 1
            i32.const 65716
            i32.const 1
            i32.const 65864
            call $runtime.fd_write
            drop
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @4
            i32.const 65732
            i32.const 0
            i32.store
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @3
          return
        end
      end
      local.get 2
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if ;; label = @2
        call $runtime.lookupPanic
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $runtime.lookupPanic (;16;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        i32.const 65615
        i32.const 18
        call $runtime.runtimePanic
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $malloc (;17;) (type 5) (param i32) (result i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.sub
      i32.store
      global.get 2
      i32.load
      i32.load
      local.set 0
    end
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 1
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        local.get 0
        call $runtime.alloc
        local.set 1
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.set 0
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 0
        return
      end
      unreachable
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    i32.const 0
  )
  (func $free (;18;) (type 1) (param i32)
    nop
  )
  (func $calloc (;19;) (type 2) (param i32 i32) (result i32)
    (local i32)
    block (result i32) ;; label = @1
      block (result i32) ;; label = @2
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @3
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 0
        end
        local.get 0
      end
      local.get 0
      local.get 1
      i32.mul
      global.get 1
      select
      local.set 0
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 2
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        local.get 0
        call $runtime.alloc
        local.set 1
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.set 0
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 0
        return
      end
      unreachable
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    i32.const 0
  )
  (func $realloc (;20;) (type 2) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=4
      local.set 1
      local.get 2
      i32.load offset=8
      local.set 2
    end
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 3
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        local.get 1
        call $runtime.alloc
        local.set 3
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 3
        local.set 2
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 0
        if ;; label = @3
          local.get 2
          local.get 0
          local.get 1
          memory.copy
        end
        local.get 2
        return
      end
      unreachable
    end
    local.set 3
    global.get 2
    i32.load
    local.get 3
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 2
    i32.store offset=8
    global.get 2
    global.get 2
    i32.load
    i32.const 12
    i32.add
    i32.store
    i32.const 0
  )
  (func $runtime.deadlock (;21;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      block (result i32) ;; label = @2
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @3
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 0
        end
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        call $internal/task.Pause
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 0
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if ;; label = @2
        i32.const 65648
        call $runtime._panic
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $runtime.printitf (;22;) (type 1) (param i32)
    (local i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=4
      local.set 1
    end
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 2
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 0
        i32.load
        local.set 1
        local.get 0
        i32.load offset=4
        local.set 0
      end
      local.get 2
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        local.get 1
        local.get 0
        call $runtime.printstring
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      return
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store
  )
  (func $_start (;23;) (type 0)
    (local i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=4
      local.set 1
    end
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 3
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        memory.size
        local.set 0
        i32.const 65712
        i32.const 65872
        i32.store
        i32.const 65728
        local.get 0
        i32.const 16
        i32.shl
        local.tee 0
        i32.store
      end
      local.get 3
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        i32.const 40
        call $runtime.alloc
        local.set 2
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 2
        local.set 0
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 0
        i32.const 0
        i32.store offset=20
        local.get 0
        i32.const 1
        i32.store offset=16
      end
      local.get 3
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if ;; label = @2
        i32.const 16384
        call $runtime.alloc
        local.set 2
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 2
        local.set 1
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 0
        local.get 1
        i32.store offset=24
        local.get 1
        i32.const -1204030091
        i32.store
        local.get 0
        local.get 1
        i32.const 16384
        i32.add
        i32.store offset=28
        i32.const 65860
        i32.load
        local.tee 1
        if ;; label = @3
          local.get 1
          local.get 0
          i32.store
        end
        local.get 0
        i32.const 0
        i32.store
        i32.const 65860
        local.get 0
        i32.store
        i32.const 65856
        i32.load
        local.tee 1
        i32.eqz
        if ;; label = @3
          i32.const 65856
          local.get 0
          i32.store
        end
      end
      loop ;; label = @2
        global.get 1
        i32.eqz
        if ;; label = @3
          i32.const 65868
          i32.load8_u
          local.set 0
        end
        block ;; label = @3
          global.get 1
          i32.eqz
          if ;; label = @4
            block ;; label = @5
              local.get 0
              i32.eqz
              if ;; label = @6
                i32.const 65856
                i32.load
                local.tee 0
                i32.eqz
                local.tee 1
                br_if 1 (;@5;)
                i32.const 65856
                local.get 0
                i32.load
                i32.store
                local.get 0
                i32.const 65860
                i32.load
                i32.eq
                if ;; label = @7
                  i32.const 65860
                  i32.const 0
                  i32.store
                end
                local.get 0
                i32.const 0
                i32.store
                i32.const 65724
                i32.load
                local.set 1
                i32.const 65724
                local.get 0
                i32.store
                local.get 0
                i32.const 16
                i32.add
                local.set 2
                local.get 0
                i32.const 32
                i32.add
                i32.load8_u
                if ;; label = @7
                  local.get 2
                  call $tinygo_rewind
                  br 4 (;@3;)
                end
                local.get 2
                call $tinygo_launch
                local.get 0
                i32.const 1
                i32.store8 offset=32
                br 3 (;@3;)
              end
              return
            end
          end
          local.get 3
          i32.const 2
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @4
            call $runtime.waitForEvents
            i32.const 2
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @4
            unreachable
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @3
          i32.const 65724
          local.get 1
          i32.store
          local.get 0
          i32.const 24
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.const 28
          i32.add
          i32.load
          i32.le_u
          local.tee 0
          br_if 1 (;@2;)
        end
      end
      local.get 3
      i32.const 3
      i32.eq
      i32.const 1
      global.get 1
      select
      if ;; label = @2
        i32.const 65536
        i32.const 14
        call $runtime.runtimePanic
        i32.const 3
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store
  )
  (func $runtime.run$1$gowrapper (;24;) (type 1) (param i32)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 1
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        call $runtime.run$1
      end
      local.get 1
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        call $runtime.deadlock
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $runtime.waitForEvents (;25;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        i32.const 65656
        i32.const 27
        call $runtime.runtimePanic
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $runtime.run$1 (;26;) (type 0)
    i32.const 65728
    memory.size
    i32.const 16
    i32.shl
    i32.store
    call $__wasm_call_ctors
    i32.const 65868
    i32.const 1
    i32.store8
  )
  (func $#func27<_main.VariantsImpl_.TestImports> (@name "(main.VariantsImpl).TestImports") (;27;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      block (result i32) ;; label = @2
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @3
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 0
        end
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        i32.const 1
        call $github.com/mossaka/go-wit-bindgen-variants/variants.OptionRoundtrip
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 0
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if ;; label = @2
        call $#func28<_github.com/mossaka/go-wit-bindgen-variants/result.Option_uint8__.Unwrap_uint8_>
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $#func28<_github.com/mossaka/go-wit-bindgen-variants/result.Option_uint8__.Unwrap_uint8_> (@name "(github.com/mossaka/go-wit-bindgen-variants/result.Option[uint8]).Unwrap[uint8]") (;28;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        i32.const 65704
        call $runtime._panic
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $tinygo_unwind (;29;) (type 1) (param i32)
    i32.const 65869
    i32.load8_u
    if ;; label = @1
      call $asyncify_stop_rewind
      i32.const 65869
      i32.const 0
      i32.store8
    else
      local.get 0
      global.get $__stack_pointer
      i32.store offset=4
      local.get 0
      call $asyncify_start_unwind
    end
  )
  (func $tinygo_launch (;30;) (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    local.set 1
    local.get 0
    i32.load offset=12
    global.set $__stack_pointer
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load
    call_indirect (type 1)
    call $asyncify_stop_unwind
    local.get 1
    global.set $__stack_pointer
  )
  (func $tinygo_rewind (;31;) (type 1) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    local.get 0
    i32.load offset=12
    global.set $__stack_pointer
    local.get 0
    i32.load offset=4
    local.set 2
    local.get 0
    i32.load
    local.set 3
    i32.const 65869
    i32.const 1
    i32.store8
    local.get 0
    i32.const 8
    i32.add
    call $asyncify_start_rewind
    local.get 2
    local.get 3
    call_indirect (type 1)
    call $asyncify_stop_unwind
    local.get 1
    global.set $__stack_pointer
  )
  (func $cabi_realloc (;32;) (type 3) (param i32 i32 i32 i32) (result i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=4
      local.set 3
    end
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 4
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        local.get 0
        local.get 3
        call $realloc
        local.set 1
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.set 0
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 0
        i32.eqz
        if ;; label = @3
          call $abort
          unreachable
        end
        local.get 0
        return
      end
      unreachable
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 1
    local.get 0
    i32.store
    local.get 1
    local.get 3
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store
    i32.const 0
  )
  (func $imports_option_roundtrip (;33;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 24
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=4
      local.set 1
      local.get 2
      i32.load offset=8
      local.set 4
      local.get 2
      i32.load offset=12
      local.set 5
      local.get 2
      i32.load offset=16
      local.set 6
      local.get 2
      i32.load offset=20
      local.set 2
    end
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 3
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 5
        global.set $__stack_pointer
        i32.const 0
        local.set 4
        local.get 0
        if ;; label = @3
          local.get 0
          i32.load
          local.set 4
        end
        local.get 0
        i32.const 0
        i32.ne
        local.set 6
        local.get 5
        i32.const 14
        i32.add
        local.set 2
      end
      local.get 3
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        local.get 6
        local.get 4
        local.get 2
        call $__wasm_import_imports_option_roundtrip
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if ;; label = @2
        local.get 1
        local.get 5
        i32.load8_u offset=14
        local.tee 4
        i32.const 1
        i32.eq
        if (result i32) ;; label = @3
          local.get 5
          i32.const 15
          i32.add
          i32.load8_u
        else
          local.get 0
        end
        i32.store8
        local.get 5
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 4
        i32.const 1
        i32.eq
        return
      end
      unreachable
    end
    local.set 3
    global.get 2
    i32.load
    local.get 3
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 4
    i32.store offset=8
    local.get 3
    local.get 5
    i32.store offset=12
    local.get 3
    local.get 6
    i32.store offset=16
    local.get 3
    local.get 2
    i32.store offset=20
    global.get 2
    global.get 2
    i32.load
    i32.const 24
    i32.add
    i32.store
    i32.const 0
  )
  (func $__wasm_export_variants_test_imports (;34;) (type 0)
    (local i32)
    block (result i32) ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32) ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        local.get 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if ;; label = @2
        call $variants_test_imports
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
  )
  (func $abort (;35;) (type 0)
    unreachable
  )
  (func $asyncify_start_unwind (;36;) (type 1) (param i32)
    i32.const 1
    global.set 1
    local.get 0
    global.set 2
    global.get 2
    i32.load
    global.get 2
    i32.load offset=4
    i32.gt_u
    if ;; label = @1
      unreachable
    end
  )
  (func $asyncify_stop_unwind (;37;) (type 0)
    i32.const 0
    global.set 1
    global.get 2
    i32.load
    global.get 2
    i32.load offset=4
    i32.gt_u
    if ;; label = @1
      unreachable
    end
  )
  (func $asyncify_start_rewind (;38;) (type 1) (param i32)
    i32.const 2
    global.set 1
    local.get 0
    global.set 2
    global.get 2
    i32.load
    global.get 2
    i32.load offset=4
    i32.gt_u
    if ;; label = @1
      unreachable
    end
  )
  (func $asyncify_stop_rewind (;39;) (type 0)
    i32.const 0
    global.set 1
    global.get 2
    i32.load
    global.get 2
    i32.load offset=4
    i32.gt_u
    if ;; label = @1
      unreachable
    end
  )
  (func $asyncify_get_state (;40;) (type 7) (result i32)
    global.get 1
  )
  (table (;0;) 2 2 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (;0;) (mut i32) i32.const 65536)
  (global (;1;) (mut i32) i32.const 0)
  (global (;2;) (mut i32) i32.const 0)
  (export "memory" (memory 0))
  (export "variants_test_imports" (func $variants_test_imports))
  (export "malloc" (func $malloc))
  (export "free" (func $free))
  (export "calloc" (func $calloc))
  (export "realloc" (func $realloc))
  (export "_start" (func $_start))
  (export "cabi_realloc" (func $cabi_realloc))
  (export "test-imports" (func $__wasm_export_variants_test_imports))
  (export "asyncify_start_unwind" (func $asyncify_start_unwind))
  (export "asyncify_stop_unwind" (func $asyncify_stop_unwind))
  (export "asyncify_start_rewind" (func $asyncify_start_rewind))
  (export "asyncify_stop_rewind" (func $asyncify_stop_rewind))
  (export "asyncify_get_state" (func $asyncify_get_state))
  (elem (;0;) (i32.const 1) func $runtime.run$1$gowrapper)
  (data $.rodata (;0;) (i32.const 65536) "stack overflowout of memorypanic: panic: runtime error: nil pointer dereferenceindex out of rangeunreachable\00\00\00\00a\00\01\00\0b\00\00\00deadlocked: no event sourceOption is None\00\00\00\00\00\00\00\93\00\01\00\0e\00\00\00")
  (data $.data (;1;) (i32.const 65712) "P\01\01\00\c8\00\01\00\00\00\00\00")
)