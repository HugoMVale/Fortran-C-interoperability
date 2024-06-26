#include <stdio.h>
#include <complex.h>
#include <stdbool.h>
#include "fmodule.h"

int main()
{
    int i = 42;
    float f = 3.14f;
    double d = 2.718281828459045;
    _Complex double cd = 1.0 - 1.0 * I;
    char c = 'A';
    _Bool b = 1; // true in C

    // Call the Fortran function
    int result = print_args_c(&i, f, d, &cd, c, b);
    printf("Return value: %d\n", result);

    return 0;
}
