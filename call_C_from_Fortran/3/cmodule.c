#include "cmodule.h"

void sum_cols(int rows, int cols, const int matrix[rows][cols], int *result)
{
    // Initialize each element of the result vector to 0
    for (int i = 0; i < rows; i++)
    {
        result[i] = 0;
    }

    // Calculate the sum of elements along each row
    for (int i = 0; i < rows; i++)
    {
        for (int j = 0; j < cols; j++)
        {
            result[i] += matrix[i][j];
        }
    }
}
