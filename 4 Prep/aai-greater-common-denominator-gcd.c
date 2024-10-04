#include <stdio.h>

int gcd(int a, int b)
{
    int result = ((a < b) ? a : b);
    while (result >= 0)
    {
        if (a % result == 0 && b % result == 0)
        {
            break;
        }
        else
        {
            result--;
        }
    }
    return result;
}
int main(void)
{
    int A = 98, B = 56;
    printf("GCD of %d and %d is %d", A, B, gcd(A, B));
}