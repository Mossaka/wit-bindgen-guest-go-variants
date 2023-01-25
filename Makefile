.PHONY: build
build:
	tinygo build -wasm-abi=generic -target=wasi -gc=leaking -no-debug -o variants.wasm main.go
	wasm-tools component new variants.wasm -o variants.wasm --adapt wasi_snapshot_preview1.wasm --wit world.wit
	python -m wasmtime.bindgen variants.wasm --out-dir host

test: build
	python host.py