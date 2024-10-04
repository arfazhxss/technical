// C Program to find
// Largest of three numbers
#include <stdio.h>

int main()
{
    int a = 1, b = 2, c = 3;
    if (a > b && a > c)
    {
        printf("Largest number is %d", a);
    }
    else if (b > a && b > c)
    {
        printf("Largest number is %d", b);
    }
    else
    {
        printf("Largest number is %d", c);
    }
    return 0;
}