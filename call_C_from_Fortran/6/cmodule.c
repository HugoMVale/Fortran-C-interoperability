#include "cmodule.h"

void apply_function_to_vector(func_ptr f, double *input_vector, double *output_vector, int length)
{
    for (int i = 0; i < length; i++)
    {
        output_vector[i] = f(input_vector[i]);
    }
}
