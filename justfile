check:
    cargo check --workspace --all-targets

check-wasm32:
    cargo check --workspace --all-features --lib --target wasm32-unknown-unknown

check-fmt:
    cargo fmt --all -- --check

clippy:
    cargo clippy --workspace --all-targets --all-features --  -D warnings -W clippy::all

test:
    cargo test --workspace --all-targets --all-features

test-docs:
    cargo test --workspace --doc

trunk-build:
    cd nes-studio-app && trunk build

trunk-watch:
    cd nes-studio-app && trunk watch

qa: check check-wasm32 check-fmt clippy test test-docs trunk-build

fmt:
    cargo fmt --all

clippy-fix:
    cargo clippy --fix --workspace --all-targets --all-features --allow-dirty

fix: fmt clippy-fix

git-push: qa
    git push

shuttle-deploy: qa
    cargo shuttle deploy --no-test

shuttle-watch:
    cargo watch -x 'shuttle run' -i 'nes-studio-app,Cargo.lock'
