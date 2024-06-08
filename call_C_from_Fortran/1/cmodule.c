#include "cmodule.h"
#include <stdio.h>

void example_function(int i, int *ip, float f, float *fp, double d, double *dp, _Complex double cd, _Complex double *cdp, char c, char *cp, _Bool b)
{
    printf("Integer value: %d\n", i);
    printf("Integer pointer value: %d\n", *ip);

    printf("Float value: %f\n", f);
    printf("Float pointer value: %f\n", *fp);

    printf("Double value: %lf\n", d);
    printf("Double pointer value: %lf\n", *dp);

    printf("Complex double value: %lf + %lfi\n", creal(cd), cimag(cd));
    printf("Complex double pointer value: %lf + %lfi\n", creal(*cdp), cimag(*cdp));

    printf("Char value: %c\n", c);
    printf("Char pointer value: %c\n", *cp);

    printf("Boolean value: %s\n", b ? "true" : "false");
}
