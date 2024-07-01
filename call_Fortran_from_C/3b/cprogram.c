#include <string.h>
#include "fmodule.h"

int main()
{
    char *filename = "hello_C.txt";

    int unit = 42;

    open_file_c(unit, filename);

    return 0;
}
