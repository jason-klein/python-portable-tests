#!/bin/bash

nuitka \
    --recurse-all \
    --portable \
    --remove-output \
    --show-progress \
    --output-dir=dist.lin \
    hello.py

VER=dist.lin/version.txt
echo > $VER

echo "LINUX" >> $VER
uname -srvmpio >> $VER
lsb_release -a >> $VER
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

# The executable does not appear to need these files
rm -r -f dist.lin/hello.dist/*.so*

echo "The following OSX distribution package has been created:"
echo "dist.lin/hello.dist/"
# NOTE: You need the "hello.exe" and "Python" files in this .dist package.

