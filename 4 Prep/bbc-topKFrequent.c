#include <stdio.h>
#include <stdlib.h>

// Structure to store element and its frequency
typedef struct {
    int num;   // The number
    int count; // Frequency of the number
} Element;

// Function to swap two elements
void swap(Element* a, Element* b) {
    Element temp = *a;
    *a = *b;
    *b = temp;
}

// Partition function for QuickSort (using Lomuto partition scheme)
int partition(Element* elements, int low, int high) {
    int pivot = elements[high].count;  // Pivot is the frequency of the last element
    int i = low - 1;  // Index of smaller element

    for (int j = low; j < high; j++) {
        if (elements[j].count >= pivot) {  // We want descending order, so greater or equal
            i++;
            swap(&elements[i], &elements[j]);
        }
    }
    swap(&elements[i + 1], &elements[high]);  // Place pivot in its correct position
    return (i + 1);
}

// QuickSort function to sort elements by frequency
void quickSort(Element* elements, int low, int high) {
    if (low < high) {
        int pi = partition(elements, low, high);  // pi is partition index
        quickSort(elements, low, pi - 1);  // Recursively sort the elements before partition
        quickSort(elements, pi + 1, high); // Recursively sort the elements after partition
    }
}

// Function to find the top K frequent elements
int* topKFrequent(int* nums, int numsSize, int k, int* returnSize) {
    *returnSize = k;  // Set the size of the result array
    int* result = (int*)malloc(k * sizeof(int));  // Allocate memory for result array

    // Allocate an array of Element structures to store unique elements and their frequencies
    Element* elements = (Element*)calloc(numsSize, sizeof(Element));
    int uniqueCount = 0;  // Counter for the number of unique elements
    
    // Count the frequencies of each element
    for (int i = 0; i < numsSize; i++) {
        int found = 0;
        for (int j = 0; j < uniqueCount; j++) {
            if (elements[j].num == nums[i]) {
                elements[j].count++;  // If element is already in array, increment its count
                found = 1;
                break;
            }
        }
        if (!found) {
            elements[uniqueCount].num = nums[i];  // Add new unique element
            elements[uniqueCount].count = 1;
            uniqueCount++;
        }
    }

    // Sort the elements by their frequency using the custom quickSort function
    quickSort(elements, 0, uniqueCount - 1);

    // Collect the top K frequent elements
    for (int i = 0; i < k; i++) {
        result[i] = elements[i].num;
    }

    // Free the allocated memory for the elements array
    free(elements);

    return result;
}

int main() {
    int nums[] = {1, 1, 1, 2, 2, 3};  // Example input array
    int k = 2;                        // Find the top 2 frequent elements
    int returnSize;                   // Variable to store the size of the result array

    // Call the function to find top K frequent elements
    int* result = topKFrequent(nums, 6, k, &returnSize);

    // Print the result
    printf("Top %d frequent elements: ", k);
    for (int i = 0; i < returnSize; i++) {
        printf("%d ", result[i]);
    }
    printf("\n");

    // Free the allocated memory for the result array
    free(result);

    return 0;
}

