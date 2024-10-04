// C Program for
// Checking value is
// Prime or not
#include <stdio.h>

int main(void)
{
    int N = 91;
    int flag = 0;

    // Iterate from 2 to N/2
    for (int i = 2; i <= N / 2; i++)
    {
        printf("\n%d - %d-%d ", i, N / 2, N);
        if (N % i == 0)
        {
            flag = 1;
            break;
        }
    }

    if (flag == 0)
        printf("Is a Prime Number");
    else
        printf("Not a Prime Number");

    return 0;
}
