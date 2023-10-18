run:
    cargo shuttle run

watch:
    cargo watch -x "shuttle run" -i Cargo.lock

deploy:
    cargo shuttle deploy

wasm-pack:
    wasm-pack build --target web --release ./nes-studio
