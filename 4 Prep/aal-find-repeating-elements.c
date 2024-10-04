#include <stdio.h>
#include <stdlib.h>

// Comparison function for qsort
int compare(const void *a, const void *b)
{
    return (*(int *)a - *(int *)b);
}

// Function to find repeating elements using two-pointer technique
void findRepeating(int arr[], int n)
{
    int Left = 0, Right = 1; // Initialize two pointers

    while (Right < n)
    {
        if (arr[Left] == arr[Right])
        {
            printf("%d ", arr[Left]); // Print the duplicate element
            while (Right < n && arr[Left] == arr[Right])
            {
                Right++; // Skip all duplicates
            }
        }
        Left = Right; // Move left pointer to the next unique element
        Right++;      // Increment right pointer
    }
}

int main()
{
    int arr[] = {1, 3, 4, 1, 2, 3, 5, 5};
    int n = sizeof(arr) / sizeof(arr[0]);

    // Sort array using qsort (faster than bubble sort)
    qsort(arr, n, sizeof(int), compare);

    // Find and print repeating elements
    findRepeating(arr, n);

    return 0;
}
