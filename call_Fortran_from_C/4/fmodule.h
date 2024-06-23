#ifndef FMODULE_H
#define FMODULE_H

// Typedef for the function pointer
typedef float (*func_ptr)(float *);

// Function prototype for the Fortran wrapper subroutine
extern void integrate_c(func_ptr f, float *a, float *b, int *n, float *result);

#endif // FMODULE_H
