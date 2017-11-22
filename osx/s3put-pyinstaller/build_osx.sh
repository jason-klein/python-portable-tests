#!/bin/bash

pyinstaller --onefile \
    -i python.icns \
    --distpath dist.osx \
    app.py
# NOTE: Icon does not seem to be used for console apps on OSX

VER=dist.osx/version.txt
echo > $VER

echo "OSX" >> $VER
sw_vers >> $VER
echo >> $VER

echo "PYTHON" >> $VER
python3 -V >> $VER
echo >> $VER

echo "PYINSTALLER" >> $VER
pyinstaller -v >> $VER
echo >> $VER

rm -r -f ./__pycache__/
rm -r -f ./build/
rm -f ./app.spec

echo "The following standalone executable has been created:"
echo "dist.osx/app"

