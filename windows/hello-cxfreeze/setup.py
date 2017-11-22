from cx_Freeze import setup, Executable

setup(
    name = "Python Hello World",
    version = "1.0",
    description = "Compiled Python Hello World application",
    executables = [Executable("hello.py")])
