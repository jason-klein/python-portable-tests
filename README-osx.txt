
### SUMMARY ###

I attempted to create standalone executables for two Python scripts (hello.py and app.py)
using cxFreeze, Nuitka, and pyInstaller. The hello script is a simple Hello World program. 
The app script requires external modules such as AWS SDK (boto3).

cxFreeze: The executable would not run due to errors.
Nuitka: The executables would run, but the complex executable was not portable due to dependency errors.
pyInstaller: The executable ran without errors, was smaller than Nuitka executable, and appeared to be portable.


### VERSION ###
sw_vers
ProductName:	Mac OS X
ProductVersion:	10.13.1
BuildVersion:	17B48

python3 -V
Python 3.6.3

cxfreeze --version
cxfreeze 5.0

nuitka --version
0.5.28.1

pyinstaller --version
3.3


### CXFREEZE ###
cd hello-cxfreeze/build/exe.macosx-10.11-x86_64-3.6/
./hello 
Fatal Python error: Py_Initialize: unable to load the file system codec
ModuleNotFoundError: No module named 'encodings'

Current thread 0x00007fffa6dca340 (most recent call first):
Abort trap: 6

ls -l hello 
-rwxr-xr-x  1 jrk  staff  14428 Nov 21 17:12 hello


### NUITKA ###
cd hello-nuitka/dist.osx/hello.dist/
./hello.exe 
Hello, World!

ls -l hello.exe 
-rwxr-xr-x  1 jrk  staff  7340580 Nov 22 12:28 hello.exe

cp hello-nuitka/dist.osx/hello.dist/hello.exe .
./hello.exe 
dyld: Library not loaded: @executable_path/Python
  Referenced from: /Users/jrk/PycharmProjects/python-portable/osx/./hello.exe
  Reason: image not found
Abort trap: 6


### PYINSTALLER ###
cd hello-pyinstaller/dist.osx/
./hello 
Hello, World!

ls -l hello 
-rwxr-xr-x  1 jrk  staff  4634872 Nov 22 12:10 hello

cp hello-pyinstaller/dist.osx/hello hello.exe
Jasons-MacBook:osx jrk$ ./hello.exe 
Hello, World!



### CXFREEZE ###
cd s3put-cxfreeze/build/exe.macosx-10.11-x86_64-3.6/
./app 
Fatal Python error: Py_Initialize: unable to load the file system codec
ModuleNotFoundError: No module named 'encodings'

Current thread 0x00007fffa6dca340 (most recent call first):
Abort trap: 6

ls -l app 
-rwxr-xr-x  1 jrk  staff  14428 Nov 21 17:12 app


### NUITKA ###
cd s3put-nuitka/dist.osx/app.dist/
./app.exe 
usage: app.exe [-h] -b BUCKET -f FILE -t TYPE
app.exe: error: the following arguments are required: -b/--Bucket, -f/--File, -t/--Type

ls -l app.exe 
-rwxr-xr-x  1 jrk  staff  22164740 Nov 22 13:52 app.exe

cp s3put-nuitka/dist.osx/app.dist/app.exe .
./app.exe 
dyld: Library not loaded: @executable_path/Python
  Referenced from: /Users/jrk/PycharmProjects/python-portable/osx/./app.exe
  Reason: image not found
Abort trap: 6


### PYINSTALLER ###
cd s3put-pyinstaller/dist.osx/
./app 
usage: app [-h] -b BUCKET -f FILE -t TYPE
app: error: the following arguments are required: -b/--Bucket, -f/--File, -t/--Type

ls -l app 
-rwxr-xr-x  1 jrk  staff  9137693 Nov 22 13:44 app

cp s3put-pyinstaller/dist.osx/app app.exe
./app.exe 
usage: app.exe [-h] -b BUCKET -f FILE -t TYPE
app.exe: error: the following arguments are required: -b/--Bucket, -f/--File, -t/--Type

