#!/bin/bash

pyinstaller --onefile --distpath dist.lin app.py

rm -r -f ./__pycache__/
rm -r -f ./build/
rm -f ./app.spec

echo "The following standalone executable has been created:"
echo "dist.lin/app"

