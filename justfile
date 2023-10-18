run:
    cargo shuttle run

watch:
    cargo watch -x "shuttle run" -i Cargo.lock

deploy:
    cargo shuttle deploy

trunk:
    cargo check --workspace --all-targets
    cargo check --workspace --all-features --lib --target wasm32-unknown-unknown
    cargo fmt --all -- --check
    cargo clippy --workspace --all-targets --all-features --  -D warnings -W clippy::all
    cargo test --workspace --all-targets --all-features
    cargo test --workspace --doc
    cd nes-studio && trunk build
