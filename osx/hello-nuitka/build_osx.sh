#!/bin/bash

nuitka \
    --recurse-all \
    --portable \
    --remove-output \
    --show-progress \
    --output-dir=dist.osx \
    hello.py

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
rm -f ./hello.spec

# Executable works without these files
rm -f dist.osx/hello.dist/*.dylib
rm -f dist.osx/hello.dist/*.so

echo "The following OSX distribution package has been created:"
echo "dist.osx/hello.dist/"
# NOTE: You need the "hello.exe" and "Python" files in this .dist package.

