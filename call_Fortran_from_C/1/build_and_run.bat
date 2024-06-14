@echo off
setlocal enabledelayedexpansion

REM Create build directory if it does not exist
if not exist build (
    mkdir build
)

REM Compile the Fortran module
gfortran -c fmodule.f90 -o build\fmodule.o
if errorlevel 1 (
    echo Failed to compile fmodule.c
    exit /b 1
)

REM Compile the Fortran program
gfortran -o build\fprogram fprogram.f90 build\fmodule.o
if errorlevel 1 (
    echo Failed to compile fprogram.f90
    exit /b 1
)

REM Compile the C program and link with the Fortran object file
gcc -o build\cprogram cprogram.c build\fmodule.o -lgfortran
if errorlevel 1 (
    echo Failed to compile and link cprogram.c
    exit /b 1
)

REM Run the Fortran program
echo Running Fortran program:
build\fprogram.exe
if errorlevel 1 (
    echo Failed to run the Fortran program
    exit /b 1
)

REM Run the C program
echo Running C program:
build\cprogram.exe
if errorlevel 1 (
    echo Failed to run the C program
    exit /b 1
)

endlocal
