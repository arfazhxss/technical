#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Function to check if a string is a palindrome
int isPalindrome(char str[]) {
    int start = 0;
    int end = strlen(str) - 1;

    while (start < end) {
        // Skip non-alphanumeric characters
        while (start < end && !isalnum(str[start])) start++;
        while (start < end && !isalnum(str[end])) end--;

        // Compare characters in lowercase
        if (tolower(str[start]) != tolower(str[end]))
            return 0;  // Not a palindrome

        start++;
        end--;
    }
    return 1;  // It's a palindrome
}

int main() {
    char str[] = "A man, a plan, a canal, Panama!";
    if (isPalindrome(str))
        printf("\"%s\" is a palindrome.\n", str);
    else
        printf("\"%s\" is not a palindrome.\n", str);
    return 0;
}

