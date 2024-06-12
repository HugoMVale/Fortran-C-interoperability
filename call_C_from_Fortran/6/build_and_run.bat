@echo off
setlocal enabledelayedexpansion

REM Create build directory if it does not exist
if not exist build (
    mkdir build
)

REM Compile the C module
gcc -c cmodule.c -o build\cmodule.o
if errorlevel 1 (
    echo Failed to compile cmodule.c
    exit /b 1
)

REM Compile the C program
gcc -o build\cprogram cprogram.c build\cmodule.o
if errorlevel 1 (
    echo Failed to compile cprogram.c
    exit /b 1
)

REM Compile the Fortran program and link with the C object file
gfortran -o build\fprogram fprogram.f90 build\cmodule.o
if errorlevel 1 (
    echo Failed to compile and link fprogram.f90
    exit /b 1
)

REM Run the C program
echo Running C program:
build\cprogram.exe
if errorlevel 1 (
    echo Failed to run the C program
    exit /b 1
)

REM Run the Fortran program
echo Running Fortran program:
build\fprogram.exe
if errorlevel 1 (
    echo Failed to run the Fortran program
    exit /b 1
)

endlocal
