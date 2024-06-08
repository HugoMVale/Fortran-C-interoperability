#include "cmodule.h"
#include <complex.h>

int main()
{
    int i = 10;
    int ip = 20;

    float f = 3.14f;
    float fp = 6.28f;

    double d = 2.718;
    double dp = 1.618;

    _Complex double cd = 1.0 + 2.0 * I;
    _Complex double cdp = 3.0 + 4.0 * I;

    char c = 'A';
    char cp = 'Z';

    _Bool b = 1; // true

    example_function(i, &ip, f, &fp, d, &dp, cd, &cdp, c, &cp, b);

    return 0;
}
