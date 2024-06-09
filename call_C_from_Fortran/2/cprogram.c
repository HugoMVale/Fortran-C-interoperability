#include <stdio.h>
#include <stdlib.h>
#include "cmodule.h"

int main()
{
    const int vec1[] = {1, 2, 3, 4, 5};
    const int vec2[] = {6, 7, 8, 9, 10};
    const int length = 5;
    int result[length];

    // Call the void function (subroutine)
    add_vectors(length, vec1, vec2, result);
    printf("Result using add_vectors:\n");
    for (int i = 0; i < length; ++i)
    {
        printf("%d ", result[i]);
    }
    printf("\n");

    // Call the function
    int *result_dynamic = add_vectors_and_return(length, vec1, vec2);
    if (result_dynamic == NULL)
    {
        // Handle error
        return 1;
    }
    printf("Result using add_vectors_and_return:\n");
    for (int i = 0; i < length; ++i)
    {
        printf("%d ", result_dynamic[i]);
    }
    printf("\n");

    free(result_dynamic);

    return 0;
}