#include "cmodule.h"

// Function to compute power with parameters passed by value
double power_by_value(double base, int exponent)
{
    double result = 1.0;
    for (int i = 0; i < exponent; ++i)
    {
        result *= base;
    }
    return result;
}

// Function to compute power with parameters passed by reference
void power_by_reference(double *base, int *exponent, double *result)
{
    *result = 1.0;
    for (int i = 0; i < *exponent; ++i)
    {
        *result *= *base;
    }
}
