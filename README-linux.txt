
### SUMMARY ###

I attempted to create standalone executables for two Python scripts (hello.py and app.py)
using cxFreeze, Nuitka, and pyInstaller. The hello script is a simple Hello World program. 
The app script requires external modules such as AWS SDK (boto3).

cxFreeze: The executable would not run due to errors.
Nuitka: The executables ran without errors and appeared to be portable.
pyInstaller: The executable ran without errors, was smaller than Nuitka executable, and appeared to be portable.


### VERSION ###
uname -srvmpio
Linux 4.13.0-kali1-amd64 #1 SMP Debian 4.13.4-2kali1 (2017-10-16) x86_64 unknown unknown GNU/Linux

lsb_release -a
No LSB modules are available.
Distributor ID:	Kali
Description:	Kali GNU/Linux Rolling
Release:	kali-rolling
Codename:	kali-rolling

python3 -V
Python 3.6.3

cxfreeze --version
cxfreeze 5.0

nuitka --version
0.5.28.1

pyinstaller --version
3.3


### CXFREEZE ###
cd hello-cxfreeze/build/exe.linux-x86_64-3.6/
./hello 
Fatal Python error: Py_Initialize: Unable to get the locale encoding
ModuleNotFoundError: No module named 'encodings'

Current thread 0x00007f37256d7b40 (most recent call first):
Aborted

ls -l hello 
-rwxr-xr-x 1 root root 10520 Nov 21 20:00 hello


### NUITKA ###
cd hello-nuitka/dist.lin/hello.dist/
./hello.exe 
Hello, World!

ls -l hello.exe 
-rwxr-xr-x 1 root root 7348784 Nov 21 19:54 hello.exe

cp hello-nuitka/dist.lin/hello.dist/hello.exe .
./hello.exe 
Hello, World!


### PYINSTALLER ###
cd hello-pyinstaller/dist.lin/
./hello 
Hello, World!

ls -l hello 
-rwxr-xr-x 1 root root 5526928 Nov 21 19:48 hello

cp hello-pyinstaller/dist.lin/hello hello.exe
Jasons-MacBook:osx jrk$ ./hello.exe 
Hello, World!



### CXFREEZE ###
cd s3put-cxfreeze/build/exe.linux-x86_64-3.6/
./app 
Fatal Python error: Py_Initialize: Unable to get the locale encoding
ModuleNotFoundError: No module named 'encodings'

Current thread 0x00007f9f98e92b40 (most recent call first):
Aborted

ls -l app 
-rwxr-xr-x 1 root root 10520 Nov 21 20:00 app


### NUITKA ###
cd s3put-nuitka/dist.lin/app.dist/
./app.exe 
usage: app.exe [-h] -b BUCKET -f FILE -t TYPE
app.exe: error: the following arguments are required: -b/--Bucket, -f/--File, -t/--Type

ls -l app.exe 
-rwxr-xr-x 1 root root 24302352 Nov 22 14:13 app.exe

cp s3put-nuitka/dist.lin/app.dist/app.exe .
./app.exe 
usage: app.exe [-h] -b BUCKET -f FILE -t TYPE
app.exe: error: the following arguments are required: -b/--Bucket, -f/--File, -t/--Type


### PYINSTALLER ###
cd s3put-pyinstaller/dist.lin/
./app 
usage: app [-h] -b BUCKET -f FILE -t TYPE
app: error: the following arguments are required: -b/--Bucket, -f/--File, -t/--Type

ls -l app 
-rwxr-xr-x 1 root root 10468888 Nov 22 13:55 app

cp s3put-pyinstaller/dist.lin/app app.exe
./app.exe 
usage: app.exe [-h] -b BUCKET -f FILE -t TYPE
app.exe: error: the following arguments are required: -b/--Bucket, -f/--File, -t/--Type

