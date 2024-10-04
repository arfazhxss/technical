#include <stdio.h>

int main(void)
{
    int B = 11011;
    int A = 0, a = 2;

    while (B != 0)
    {
        A = A + a * (B % 10);
        a *= 2;
        B = B / 10;
    }
    return A;
}