#ifndef CMODULE_H
#define CMODULE_H

typedef double (*func_ptr)(double);

void apply_function_to_vector(func_ptr f, double *input_vector, double *output_vector, int length);

#endif // CMODULE_H
