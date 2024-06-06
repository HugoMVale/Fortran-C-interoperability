// cmodule.c
#include <stdio.h>

// Function to add two vectors
void add_vectors(int length, const int *vec1, const int *vec2, int *result)
{
    for (int i = 0; i < length; ++i)
    {
        result[i] = vec1[i] + vec2[i];
    }
}

// Function to add two matrices
void add_matrices(int rows, int cols, int a[][cols], int b[][cols], int result[][cols])
{
    int i, j;
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < cols; j++)
        {
            result[i][j] = a[i][j] + b[i][j];
        }
    }
}
