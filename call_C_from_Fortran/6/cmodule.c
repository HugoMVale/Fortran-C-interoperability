// cmodule.c
#include "cmodule.h"

// Define the function that will be passed as an argument
double sample_function(double x)
{
    return x * x;
}

// The void function that takes a function and a vector as arguments
void call_function_with_vector(func_ptr f, double *input_vector, double *output_vector, int length)
{
    for (int i = 0; i < length; i++)
    {
        output_vector[i] = f(input_vector[i]);
    }
}
