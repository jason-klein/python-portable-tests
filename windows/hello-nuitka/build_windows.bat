@echo off
nuitka --recurse-all --portable --remove-output --show-progress hello.py

REM The executable only needs hello.exe and python36.dll
mkdir build.win\
move hello.dist\hello.exe build.win\
move hello.dist\python36.dll build.win\
del /q /s hello.dist
rmdir /q /s hello.dist
