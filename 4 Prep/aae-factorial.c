#include <stdio.h>

// Change the return type to unsigned long long int
unsigned long long int fact(unsigned long long int N)
{
    if (N == 0)
        return 1;
    return N * fact(N - 1);
}

int main(void)
{
    unsigned long long int N = 65;

    // Use %llu to print unsigned long long int
    printf("%llu\n", fact(N));

    return 0;
}
