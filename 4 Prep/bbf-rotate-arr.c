#include <stdio.h>

// Function to reverse a part of the array
void Reverse(int arr[], int start, int end) {
    while (start < end) {
        int temp = arr[start];
        arr[start] = arr[end];
        arr[end] = temp;
        start++;
        end--;
    }
}

// Function to rotate the array by k positions
void Rotate(int arr[], int k, int N) {
    // Handle cases where k is larger than N
    k = k % N;

    // Reverse the entire array
    Reverse(arr, 0, N - 1);
    // Reverse the first part (first k elements)
    Reverse(arr, 0, k - 1);
    // Reverse the second part (remaining elements)
    Reverse(arr, k, N - 1);
}

int main() {
    int N, k;
    
    // Sample array
    int arr[] = {1, 2, 3, 4, 5, 6, 7};
    
    // Size of the array
    N = sizeof(arr) / sizeof(arr[0]);
    
    // Rotate the array by k positions
    printf("Enter the number of positions to rotate: ");
    scanf("%d", &k);
    
    // Call the rotate function
    Rotate(arr, k, N);

    // Print the rotated array
    printf("Rotated array: ");
    for (int i = 0; i < N; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}

