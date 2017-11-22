@echo off
nuitka --recurse-all --portable --windows-icon=python.ico --remove-output --show-progress app.py 
REM nuitka --standalone --python-flag=no_site --windows-icon=python.ico --remove-output app.py

REM Both build commands shown above result in same file size and same portability issue below.
REM When .exe is moved to new folder, we receive this error:
REM ImportError: LoadLibraryEx 'C:\Users\User\PycharmProjects\_socket.pyd' failed
