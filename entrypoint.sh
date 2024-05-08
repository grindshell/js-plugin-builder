#!/bin/bash

echo "Building js $1 with interface $2 to wasm $3"

cd /work

extism-js "$1" -i "$2" -o "$3"

echo "Done"
