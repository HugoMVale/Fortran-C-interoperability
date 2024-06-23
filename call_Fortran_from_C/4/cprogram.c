#include <stdio.h>
#include <math.h>
#include "fmodule.h"

// Function to be integrated
float my_function(float *x)
{
    return sinf(*x);
}

int main()
{
    float a = 0.0f;
    float b = 3.1415927f; // Approximate value of pi
    int n = 1000;
    float result;

    // Call the Fortran wrapper subroutine
    integrate_c(my_function, &a, &b, &n, &result);

    // Print the result
    printf("The integral of sin(x) from 0 to pi is approximately: %f\n", result);

    return 0;
}
