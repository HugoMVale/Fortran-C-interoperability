#include <stdio.h>
#include <stdlib.h>
#include "cmodule.h"

int main()
{

    // Calculate the Euclidean distance between two points
    double point1[3] = {1.0, 2.0, 3.0};
    double point2[3] = {4.0, 5.0, 6.0};

    double distance = euclidean_distance(point1, point2);
    printf("Euclidean Distance: %f\n", distance);

    // Add two vectors
    const int vec1[] = {1, 2, 3, 4, 5};
    const int vec2[] = {6, 7, 8, 9, 10};
    const int length = 5;
    int result[length];

    // Method 1: Call the void function (subroutine)
    add_vectors(length, vec1, vec2, result);
    printf("Result using add_vectors:\n");
    for (int i = 0; i < length; ++i)
    {
        printf("%d ", result[i]);
    }
    printf("\n");

    // Method 2: Call the function
    int *result_dynamic = add_vectors_and_return(length, vec1, vec2);
    if (result_dynamic == NULL)
    {
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