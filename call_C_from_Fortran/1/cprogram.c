#include <stdio.h>
#include "cmodule.h"

int main()
{
    double base;
    int exponent;
    double result;

    // Test power_by_value
    base = 2.0;
    exponent = 3;
    result = power_by_value(base, exponent);
    printf("power_by_value: %.2f^%d = %.2f\n", base, exponent, result);

    // Test power_by_reference
    base = 3.0;
    exponent = 4;
    power_by_reference(&base, &exponent, &result);
    printf("power_by_reference: %.2f^%d = %.2f\n", base, exponent, result);

    return 0;
}
