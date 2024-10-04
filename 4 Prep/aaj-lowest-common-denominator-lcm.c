#include <stdio.h>

// Function to calculate the Greatest Common Divisor (GCD)
int gcd(int a, int b)
{
    // The GCD is found using the Euclidean algorithm
    while (b != 0)
    {
        int temp = b;
        b = a % b; // Remainder of a divided by b
        a = temp;  // Swap a with b (which is now the remainder)
    }
    return a; // When b is 0, a is the GCD
}

// Function to calculate LCM using GCD
int lcm(int a, int b)
{
    // Formula for LCM: (a * b) / GCD(a, b)
    // This works because the LCM is the smallest number divisible by both a and b
    return (a * b) / gcd(a, b);
}

int main()
{
    int num1, num2;

    // Asking user for input
    printf("Enter two numbers: ");
    scanf("%d %d", &num1, &num2);

    // Displaying the LCM of the two numbers
    printf("LCM of %d and %d is %d\n", num1, num2, lcm(num1, num2));

    return 0;
}
