#include <stdio.h>

int main(void)
{
    int N = 5;
    for (int i = 0; i < N; i++)
    {
        int A = N - i;
        for (int j = 0; j <= N - i; j++)
        {
            printf(" ");
        }
        for (int j = 0; j <= 2 * i; j++)
        {
            printf("*");
        }
        printf("\n");
    }
}