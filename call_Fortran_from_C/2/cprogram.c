#include <stdio.h>
#include "fmodule.h"

#define rows 2
#define cols 3

int main()
{
    int matrix[cols][rows] = {{1, 2}, {3, 4}, {5, 6}};
    int vector[cols] = {1, 2, 3};
    int product[rows];

    // Print the matrix
    printf("Matrix:\n");
    for (int i = 0; i < cols; ++i)
    {
        for (int j = 0; j < rows; ++j)
        {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }

    // Print the vector
    printf("Vector:\n");
    for (int i = 0; i < cols; ++i)
    {
        printf("%d ", vector[i]);
    }
    printf("\n");

    // Call the Fortran subroutine to compute the matrix-vector product
    matvec_product_c(rows, cols, (int *)matrix, vector, product);

    // Print the product
    printf("Matrix-Vector Product:\n");
    for (int i = 0; i < rows; ++i)
    {
        printf("%d\n", product[i]);
    }

    return 0;
}
