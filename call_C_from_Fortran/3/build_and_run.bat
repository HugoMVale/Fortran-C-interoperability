@echo off
REM Compile the C module
gcc -c cmodule.c -o cmodule.o
if errorlevel 1 (
    echo Failed to compile cmodule.c
    exit /b 1
)

REM Compile the C program
gcc -o cprogram cprogram.c cmodule.o
if errorlevel 1 (
    echo Failed to compile cprogram.c
    exit /b 1
)

REM Compile the Fortran program and link with the C object file
gfortran -o fprogram fprogram.f90 cmodule.o
if errorlevel 1 (
    echo Failed to compile and link fprogram.f90
    exit /b 1
)

REM Run the C program
echo Running C program:
cprogram.exe
if errorlevel 1 (
    echo Failed to run the C program
    exit /b 1
)

REM Run the Fortran program
echo Running Fortran program:
fprogram.exe
if errorlevel 1 (
    echo Failed to run the Fortran program
    exit /b 1
)
