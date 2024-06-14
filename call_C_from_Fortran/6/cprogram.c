// cprogram.c
#include <stdio.h>
#include "cmodule.h"

double square(double x);

int main()
{
    // Example vector
    const int length = 3;
    double input_vector[] = {1.0, 2.0, 3.0};
    double output_vector[length];

    // Call the void function with the function pointer and vector
    apply_function_to_vector(square, input_vector, output_vector, length);

    // Print the output vector
    for (int i = 0; i < length; i++)
    {
        printf("%f ", output_vector[i]);
    }
    printf("\n");

    return 0;
}

// Define a sample function that will be passed as an argument
double square(double x)
{
    return x * x;
}