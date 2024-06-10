#include <stdio.h>
#include "cmodule.h"

int main()
{
    char str[] = "Hello, World!";

    printf("Original : %s\n", str);

    to_uppercase(str);

    printf("Uppercase: %s\n", str);

    return 0;
}
