#include <stdio.h>
#include <string.h>

// Function to reverse a string
void reverseString(char* str) {
    int len = strlen(str);  // Get the length of the string
    int i;
    char temp;

    // Swap characters from the start and end moving towards the middle
    for (i = 0; i < len / 2; i++) {
        temp = str[i];
        str[i] = str[len - i - 1];
        str[len - i - 1] = temp;
    }
}

int main() {
    char str[] = "Hello, World!";
    printf("Original string: %s\n", str);
    reverseString(str);
    printf("Reversed string: %s\n", str);
    return 0;
}

