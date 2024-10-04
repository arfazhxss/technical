#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int key;
    int value;
} HashMap;

int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
    *returnSize = 2;
    int* result = (int*)malloc(2 * sizeof(int));
    
    HashMap* map = (HashMap*)malloc(numsSize * sizeof(HashMap));  // Simple array to hold key-value pairs
    int mapSize = 0;  // Number of elements in the "hash map"
    
    for (int i = 0; i < numsSize; i++) {
        int complement = target - nums[i];
        
        // Search for the complement in the "hash map"
        for (int j = 0; j < mapSize; j++) {
            if (map[j].key == complement) {
                result[0] = map[j].value;
                result[1] = i;
                free(map);  // Free the allocated memory for the map
                return result;
            }
        }
        
        // Add the current number and its index to the "hash map"
        map[mapSize].key = nums[i];
        map[mapSize].value = i;
        mapSize++;
    }
    
    free(map);  // Free the allocated memory for the map
    return NULL;  // No solution found
}

int main() {
    int nums[] = {2, 7, 11, 15};
    int target = 9;
    int returnSize;
    int* result = twoSum(nums, 4, target, &returnSize);
    
    if (result != NULL) {
        printf("Indices: [%d, %d]\n", result[0], result[1]);
        free(result);
    } else {
        printf("No solution found.\n");
    }

    return 0;
}

