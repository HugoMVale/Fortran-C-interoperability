#include <stdlib.h>
#include <ctype.h>
#include "cmodule.h"

void to_uppercase(char *str)
{
    if (str == NULL)
        return;

    while (*str)
    {
        *str = toupper((unsigned char)*str);
        str++;
    }
}
