from debian:12-slim

copy entrypoint.sh /entrypoint.sh
run chmod +x /entrypoint.sh

run apt-get update && apt-get install -y curl

# Install extism-js compiler
run curl -L https://github.com/extism/js-pdk/releases/download/v1.0.0-rc9/extism-js-x86_64-linux-v1.0.0-rc9.gz \
    -o extism-js.gz && \
    gzip -d extism-js.gz && \
    chmod +x extism-js && \
    mv extism-js /bin

# Install binaryen needed for extism-js
run curl -L https://github.com/WebAssembly/binaryen/releases/download/version_117/binaryen-version_117-x86_64-linux.tar.gz \
    -o binaryen.tar.gz && \
    tar xzf binaryen.tar.gz && \
    rm binaryen.tar.gz && \
    mv binaryen-version_117/bin/wasm-opt binaryen-version_117/bin/wasm-merge /bin && \
    rm -rf binaryen-version_117

entrypoint ["/entrypoint.sh"]
