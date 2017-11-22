
### SUMMARY ###

I attempted to create standalone executables for two Python scripts (hello.py and app.py)
using cxFreeze, Nuitka, and pyInstaller. The hello script is a simple Hello World program. 
The app script requires external modules such as AWS SDK (boto3).

cxFreeze: The executable would not run due to errors.
Nuitka: The executables would run, but the complex executable was not portable due to dependency errors.
pyInstaller: The executable ran without errors, was smaller than Nuitka executable, and appeared to be portable.


### VERSION ###
ver
Microsoft Windows [Version 10.0.16299.64]

python -V
Python 3.6.3

python \Users\User\AppData\Local\Programs\Python\Python36-32\Scripts\cxfreeze --version
cxfreeze 5.0

nuitka --version
0.5.28.1

pyinstaller --version
3.3


### CXFREEZE ###
cd hello-cxfreeze\build\exe.win32-3.6\
hello.exe
Fatal Python error: Py_Initialize: unable to load the file system codec
Traceback (most recent call last):
  File "C:\Users\User\AppData\Local\Programs\Python\Python36-32\lib\encodings\__init__.py", line 31, in <module>
ModuleNotFoundError: No module named 'codecs'

Error related to this issue?
https://github.com/anthony-tuininga/cx_Freeze/issues/325

dir hello.exe
11/22/2017  12:09 AM            17,408 hello.exe


### NUITKA ###
cd hello-nuitka\hello.dist\
hello.exe
Hello, world!

dir hello.exe
11/22/2017  08:48 AM         7,515,648 hello.exe

copy hello-nuitka\hello.dist\hello.exe .
hello.exe
Hello, world!


### PYINSTALLER ###
cd hello-pyinstaller\dist\
hello.exe
Hello, world!

dir hello.exe
11/22/2017  12:27 AM         4,825,544 hello.exe

copy hello-pyinstaller\dist\hello.exe .
hello.exe
Hello, world!



### CXFREEZE ###
cd s3put-cxfreeze\build\exe.win32-3.6\
app.exe
(no output)

dir app.exe
11/22/2017  09:28 AM            19,968 app.exe

### NUITKA ###
cd s3put-nuitka\app.dist\
app.exe
usage: app.exe [-h] -b BUCKET -f FILE -t TYPE
app.exe: error: the following arguments are required: -b/--Bucket, -f/--File, -t/--Type

dir app.exe
11/22/2017  11:40 AM        20,807,680 app.exe

copy s3put-nuitka\app.dist\app.exe .
app.exe
ImportError: LoadLibraryEx 'C:\Users\User\PycharmProjects\_socket.pyd' failed


### PYINSTALLER ###
cd s3put-pyinstaller\dist\
app.exe
usage: app.exe [-h] -b BUCKET -f FILE -t TYPE
app.exe: error: the following arguments are required: -b/--Bucket, -f/--File, -t/--Type

dir app.exe
11/22/2017  10:34 AM         9,465,045 app.exe

copy s3put-pyinstaller\dist\app.exe .
app.exe
usage: app.exe [-h] -b BUCKET -f FILE -t TYPE
app.exe: error: the following arguments are required: -b/--Bucket, -f/--File, -t/--Type


