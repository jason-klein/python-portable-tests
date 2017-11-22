@echo off

REM May need to install pywin32, and pygtk.msi file on destination PC?
pyinstaller --onefile -i python.ico --distpath dist.win app.py

del /s /q __pycache__\
rmdir /s /q __pycache__\
del /s /q build\
rmdir /s /q build\
del app.spec