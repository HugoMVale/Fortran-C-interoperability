#include <stdlib.h>
#include <math.h>
#include "cmodule.h"

// Function to calculate the Euclidean distance
double euclidean_distance(double point1[3], double point2[3])
{
    double distance;
    distance = sqrt(pow(point2[0] - point1[0], 2) +
                    pow(point2[1] - point1[1], 2) +
                    pow(point2[2] - point1[2], 2));
    return distance;
}

// Function to add two vectors
void add_vectors(int length, const int vec1[], const int vec2[], int result[])
{
    for (int i = 0; i < length; ++i)
    {
        result[i] = vec1[i] + vec2[i];
    }
}

// Function to add two vectors and return the result
int *add_vectors_and_return(int length, const int vec1[], const int vec2[])
{
    int *result = (int *)malloc(length * sizeof(int));
    if (result == NULL)
    {
        // Handle memory allocation failure if needed
        return NULL;
    }

    // Call the void function
    add_vectors(length, vec1, vec2, result);

    return result;
}
