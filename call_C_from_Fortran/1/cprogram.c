// cprogram.c

#include <stdio.h>
#include "cmodule.h"

int main()
{
    // Test the add function for integers
    int x = 5;
    int y = 10;
    int int_result = add_ints(x, y);
    printf("The sum of %d and %d is %d\n", x, y, int_result);

    // Test the add function for doubles
    double a = 5.5;
    double b = 10.5;
    double double_result = add_doubles(a, b);
    printf("The sum of %.1f and %.1f is %.1f\n", a, b, double_result);

    return 0;
}
