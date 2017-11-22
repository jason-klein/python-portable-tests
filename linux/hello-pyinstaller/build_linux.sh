#!/bin/bash

pyinstaller --onefile --distpath dist.lin hello.py

rm -r -f ./__pycache__/
rm -r -f ./build/
rm -f ./hello.spec

echo "The following standalone executable has been created:"
echo "dist.lin/hello"

