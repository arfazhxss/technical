// C Program for
// Replacing 0 to 1
#include <math.h>
#include <stdio.h>

int main()
{
    int N = 102301;
    int A = 0, i = 0;
    while (N != 0)
    {
        if (N % 10 == 0)
        {
            A = A + 1 * pow(10, i);
        }
        else
        {
            A = A + (N % 10) * pow(10, i);
        }
        N = N / 10;
        i++;
    }
    printf("%d", A);
    return 0;
}
