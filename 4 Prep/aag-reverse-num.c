// C Programs to Calculate
// reverse of a number
#include <stdio.h>
#include <math.h>

// Iterative approach Main
int reverse_iteration(int N)
{
    int ans = 0;
    while (N != 0)
    {

        ans = ans * 10 + (N % 10);
        N = N / 10;
    }

    return ans;
}

// recursive approach
int reverse(int n, int ans)
{
    if (n == 0)
        return ans;

    ans = ans * 10 + n % 10;
    return reverse(n / 10, ans);
}

int main()
{
    int N = 15942;
    printf("Initial number:%d\n", N);

    N = reverse_iteration(N);
    printf("%d after reverse using iteration\n", N);
    N = reverse_iteration(N);

    N = reverse_iteration_2(N);
    printf("%d after reverse using iteration 2\n", N);
    N = reverse_iteration_2(N);

    int ans = 0;
    ans = reverse(N, ans);
    printf("%d after again reverse using recursion", ans);

    return 0;
}
