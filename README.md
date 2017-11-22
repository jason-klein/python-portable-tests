# Python Portable Tests

I demonstrated creating portable Python executables on Linux, OSX, and Windows using cxFreeze, Nuitka, and pyInstaller at a recent Python User Group meeting. By portable, I mean converting Python code to an executable file (or set of files) that can be distributed and run on computers that do not already have Python installed. This is a summary of my findings. 

I attempted to compile a simple "Hello World" app as well as a simple app that uploads a file to AWS S3.

cxFreeze: Build was successful on each platform and completed in less than a minute. Executable would NOT run due to errors. Unsure if problem is due to configuration error or incompatibility between cxFreeze 5.0 and Python 3.6.3.

Nuitka: Build was successful on each platform and completed in 20-30 minutes. Executable would run on each platform. Executable only appeared to be portable on Linux.

pyInstaller: Build was successful on each platform and completed in less than a minute. Executable would run on each platform. Executable appeared to be portable on each platform.

Results were fairly consistent across platforms. Review the README files for each platform for detailed information.

Based on these tests, pyInstaller was easiest to use, fastest, and created the smallest standalone executable files that did appear to be portable.


## Getting Started

You can reproduce my findings by downloading this repository to your local computer and running the build scripts for your OS. You will also need the software listed in prerequisites below.

### Prerequisites

Python 3 on Linux (Debian, Ubuntu, Kali)

```
apt-get install python3
```

Python 3 on OSX

```
brew install python3
```

Python 3 on Windows
[Download](https://www.python.org/downloads/windows/)

cxFreeze

```
pip install cx_Freeze
```

Nuitka

```
pip install nuitka
```

pyInstaller

```
pip install pyinstaller
```

Development Tools on Linux
```
apt-get install g++ gcc
```

Development Tools on OSX
```
xcode-select --install
```

Development Tools on Windows
[Download][https://developer.microsoft.com/en-us/windows/downloads/virtual-machines]


## Built With

* [Python](https://www.python.org/)
* [cx_Freeze](https://anthony-tuininga.github.io/cx_Freeze/)
* [Nuitka](http://nuitka.net/)
* [pyInstaller](http://www.pyinstaller.org/)

## Authors

* **Jason Klein** - [jason-klein](https://github.com/jason-klein/)

See also the list of [contributors](https://github.com/jason-klein/python-portable-tests/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thank you to all of the developers who contribute their time to FOSS projects including Python, cxFreeze, Nuitka, and pyInstaller.
* Thank you to [Preston Rohner](https://www.accadius.com/author/prohner/) for publishing [How to post a file to an AWS S3 from a Windows Python 3 program](https://www.accadius.com/post-file-aws-s3-windows-python-3-program/). The "s3put" Python app was based on his code.
* Thank you to [Logic Forte](https://logicforte.com/) for sponsoring this research.
* Thank you to Chad Boschert and the [Springfield Python Developers](https://www.meetup.com/Springfield-Python-Developers/) for allowing me to share my findings with the Python group on 11/21/2017.
