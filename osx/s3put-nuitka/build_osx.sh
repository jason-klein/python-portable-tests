#!/bin/bash

nuitka \
    --recurse-all \
    --portable \
    --remove-output \
    --show-progress \
    --output-dir=dist.osx \
    app.py

VER=dist.osx/version.txt
echo > $VER

echo "OSX" >> $VER
sw_vers >> $VER
echo >> $VER

echo "PYTHON" >> $VER
python3 -V >> $VER
echo >> $VER

echo "NUITKA" >> $VER
nuitka --version >> $VER
echo >> $VER

rm -r -f ./__pycache__/
rm -r -f ./build/
rm -f ./app.spec

echo "The following OSX distribution package has been created:"
echo "dist.osx/app.dist/"
# NOTE: You need the "app.exe" and "Python" files in this .dist package.

