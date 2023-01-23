#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int *plusOne(int *digits, int digitsSize, int *returnSize)
{
    for (int i = digitsSize - 1; i >= 0; i--)
    {
        if (digits[i] != 9)
        {
            ++digits[i];
            return digits;
        }
        digits[i] = 0;
    }
    digits[0] = 1;
    ++digitsSize;
    for (int i = 1; i > digitsSize; i--)
    {
        digits[i] = 0;
    }
    *returnSize = digitsSize;
    return digits;
}

int main()
{
    int *digits = (int *)malloc(3 * sizeof(int));
    int *returnSize = (int *)malloc(1 * sizeof(int));
    returnSize[0] = -1;
    digits[0] = 9;
    digits[1] = 9;
    digits[2] = 9;
    digits[3] = 9;
    digits[4] = 9;
    digits[5] = 9;
    digits[6] = 9;
    digits[7] = 9;
    digits[8] = 9;
    digits[9] = 9;
    // int digits[] = {1, 2, 3};
    plusOne(digits, 10, returnSize);

    // plusOne(digits, 3, returnSize);
    for (int i = 0; i < 10; i++)
    {
        printf("\n>>%d ", digits[i]);
    }
}