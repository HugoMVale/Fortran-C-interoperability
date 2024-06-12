// cmodule.h
#ifndef CMODULE_H
#define CMODULE_H

// Define the type for the function pointer
typedef double (*func_ptr)(double);

// Declare the sample_function
double sample_function(double x);

// Declare the call_function_with_vector function
void call_function_with_vector(func_ptr f, double *input_vector, double *output_vector, int length);

#endif // CMODULE_H
