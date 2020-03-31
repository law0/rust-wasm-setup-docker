FROM ubuntu:18.04

# setup
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential cmake python2.7 default-jre git-core \
        curl nodejs nodejs-dev node-gyp npm pkg-config libssl1.0-dev \
    && npm install npm@latest -g \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home rust-wasm
USER rust-wasm
ENV PATH /home/rust-wasm/.cargo/bin:$PATH

# Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && . $HOME/.cargo/env \
    && curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh \
    && cargo install cargo-generate
    
ENTRYPOINT /bin/bash
