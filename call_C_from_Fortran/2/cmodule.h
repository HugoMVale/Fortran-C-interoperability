#ifndef CMODULE_H
#define CMODULE_H

// Declaration of the function to add two vectors
void add_vectors(int length, const int *vec1, const int *vec2, int *result);

// Declaration of the function to add two matrices
void add_matrices(int rows, int cols, int a[][cols], int b[][cols], int result[][cols]);

#endif // CMODULE_H
