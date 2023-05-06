# https://hub.docker.com/_/rust/tags
FROM docker.io/rust:1.69 AS build

# hadolint ignore=DL3008
RUN set -xeu; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        build-essential curl musl-dev musl-tools

# https://github.com/nerdypepper/eva
ARG EVA_VERSION=0.3.1

WORKDIR /src/eva
RUN set -xeu; \
    curl -#Lo eva.tar.xz \
        "https://github.com/nerdypepper/eva/archive/refs/tags/v$EVA_VERSION.tar.gz"; \
    tar -xvf eva.tar.xz --strip-components=1; \
    rm -f eva.tar.xz

ARG RUSTFLAGS='-C target-feature=+crt-static'
RUN set -xeu; \
    rustup target add x86_64-unknown-linux-musl; \
    cargo build --release --target x86_64-unknown-linux-musl

WORKDIR /src/eva/target/x86_64-unknown-linux-musl/release
RUN set -xeu; \
    strip -s -R .comment --strip-unneeded eva; \
    chmod -cR 755 eva; \
    chown -cR 0:0 eva; \
    ldd eva; \
    ./eva --version

# static eva image
FROM scratch
COPY --from=build /src/eva/target/x86_64-unknown-linux-musl/release/eva /bin/eva
ENTRYPOINT ["/bin/eva"]
