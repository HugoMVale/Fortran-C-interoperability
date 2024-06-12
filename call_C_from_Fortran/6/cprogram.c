// cprogram.c
#include <stdio.h>
#include "cmodule.h"

int main()
{
    // Example vector
    double input_vector[] = {1.0, 2.0, 3.0};
    int length = sizeof(input_vector) / sizeof(input_vector[0]);
    double output_vector[length];

    // Call the void function with the function pointer and vector
    call_function_with_vector(sample_function, input_vector, output_vector, length);

    // Print the output vector
    for (int i = 0; i < length; i++)
    {
        printf("%f ", output_vector[i]);
    }
    printf("\n");

    return 0;
}
