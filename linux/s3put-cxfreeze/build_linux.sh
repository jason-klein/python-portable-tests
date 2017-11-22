#!/bin/bash

python3 setup.py build

VER=build/version.txt
echo > $VER

echo "LINUX" >> $VER
uname -srvmpio >> $VER
lsb_release -a >> $VER
echo >> $VER

echo "PYTHON" >> $VER
python3 -V >> $VER
echo >> $VER

echo "CXFREEZE" >> $VER
cxfreeze --version >> $VER
echo >> $VER

# Executable generates same error whether these files are 
# present or not
rm -r -f build/exe.linux-x86_64-3.6/lib*

