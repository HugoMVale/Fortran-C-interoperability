#include <stdio.h>

void add_matrices(int rows, int cols, int a[rows][cols], int b[rows][cols], int result[rows][cols])
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

int main()
{
    int rows = 2;
    int cols = 3;

    int a[2][3] = {{1, 2, 3}, {4, 5, 6}};
    int b[2][3] = {{9, 8, 7}, {6, 5, 4}};
    int result[2][3];

    add_matrices(rows, cols, a, b, result);

    printf("Resultant Matrix:\n");
    for (int i = 0; i < rows; i++)
    {
        for (int j = 0; j < cols; j++)
        {
            printf("%d ", result[i][j]);
        }
        printf("\n");
    }

    return 0;
}
