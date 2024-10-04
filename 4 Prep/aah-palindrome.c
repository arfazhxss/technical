#include <stdio.h>

int palindrome(int num)
{
    int N = num, A = 0, i = 0;
    while (N != 0)
    {
        A = A * 10 + (N % 10);
        N = N / 10;
        i++;
    }
    N = num;
    for (int j = 0; j <= i / 2; j++)
    {
        if ((A % 10) != (N % 10))
        {
            return 0;
        }
        A /= 10;
        N /= 10;
        printf("i:%d:\t%d-%d\n", j, A % 10, N % 10);
    }
    return 1;
}

int main()
{
    int A = 112211;
    printf("Initial:\t%d\n", A);
    int num = palindrome(A);
    printf("Palindrome?\t%d", num);
    return 0;
}