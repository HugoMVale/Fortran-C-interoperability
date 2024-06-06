#include <stdio.h>
#include "cmodule.h"

#define VEC_SIZE 3
#define MAT_ROWS 2
#define MAT_COLS 3

int main()
{
    // Test add_vectors
    int vec1[VEC_SIZE] = {1, 2, 3};
    int vec2[VEC_SIZE] = {4, 5, 6};
    int vec_result[VEC_SIZE] = {0};

    // Call the function to add vectors
    add_vectors(VEC_SIZE, vec1, vec2, vec_result);

    // Display the result vector
    printf("Result Vector (add_vectors):\n");
    for (int i = 0; i < VEC_SIZE; ++i)
    {
        printf("%d ", vec_result[i]);
    }
    printf("\n\n");

    // Test add_matrices
    int mat1[MAT_ROWS][MAT_COLS] = {
        {1, 2, 3},
        {4, 5, 6}};
    int mat2[MAT_ROWS][MAT_COLS] = {
        {1, 2, 3},
        {4, 5, 6}};
    int mat_result[MAT_ROWS][MAT_COLS] = {0};

    // Call the function to add matrices
    add_matrices(MAT_ROWS, MAT_COLS, mat1, mat2, mat_result);

    // Display the result matrix
    printf("Result Matrix (add_matrices):\n");
    for (int i = 0; i < MAT_ROWS; ++i)
    {
        for (int j = 0; j < MAT_COLS; ++j)
        {
            printf("%d ", mat_result[i][j]);
        }
        printf("\n");
    }

    return 0;
}
