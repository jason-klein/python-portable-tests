#!/bin/bash

python3 setup.py build

VER=build/version.txt
echo > $VER

echo "OSX" >> $VER
sw_vers >> $VER
echo >> $VER

echo "PYTHON" >> $VER
python3 -V >> $VER
echo >> $VER

echo "CXFREEZE" >> $VER
cxfreeze --version >> $VER
echo >> $VER

# Executable returns same error regardless of whether these files
# are present
rm -r -f build/exe.macosx-10.11-x86_64-3.6/lib*

