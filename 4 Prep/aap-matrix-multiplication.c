#include <stdio.h>

// Function to multiply two matrices
void multiplyMatrices(int firstMatrix[10][10], int secondMatrix[10][10], int result[10][10], int row1, int col1, int col2) {
    int i, j, k;
    for (i = 0; i < row1; i++) {
        for (j = 0; j < col2; j++) {
            result[i][j] = 0;  // Initialize the result matrix element
            for (k = 0; k < col1; k++) {
                result[i][j] += firstMatrix[i][k] * secondMatrix[k][j];  // Multiply and sum up
            }
        }
    }
}

// Utility function to print a matrix
void printMatrix(int matrix[10][10], int row, int col) {
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

int main() {
    int firstMatrix[10][10] = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9} };
    int secondMatrix[10][10] = { {9, 8, 7}, {6, 5, 4}, {3, 2, 1} };
    int result[10][10];  // Matrix to store result

    int row1 = 3, col1 = 3, row2 = 3, col2 = 3;

    // Ensure matrix dimensions are compatible for multiplication
    if (col1 != row2) {
        printf("Matrices cannot be multiplied.\n");
        return -1;
    }

    multiplyMatrices(firstMatrix, secondMatrix, result, row1, col1, col2);

    printf("Resultant matrix after multiplication:\n");
    printMatrix(result, row1, col2);

    return 0;
}

