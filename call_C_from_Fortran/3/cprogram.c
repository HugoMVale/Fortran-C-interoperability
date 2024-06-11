#include <stdio.h>
#include "cmodule.h"

#define ROWS 2
#define COLS 3

int main()
{
    // Define the matrix
    int matrix[ROWS][COLS] = {
        {1, 2, 3},
        {4, 5, 6}};

    // Define the result array
    int result[ROWS];

    // Call the sumRows function
    sum_cols(ROWS, COLS, matrix, result);

    // Print the result
    for (int i = 0; i < 2; i++)
    {
        printf("Sum of row %d: %d\n", i, result[i]);
    }

    return 0;
}
