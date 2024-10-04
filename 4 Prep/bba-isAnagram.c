#include <stdio.h>
#include <stdbool.h>
#include <string.h>

// Function to check if two strings are anagrams
bool isAnagram(char *s, char *t) {
    int freq[256] = {0};  // Array to store frequency of characters, assuming ASCII

    // If lengths are not the same, they can't be anagrams
    if (strlen(s) != strlen(t)) {
        return false;
    }

    // Count the frequency of characters in string s
    for (int i = 0; s[i] != '\0'; i++) {
        freq[(int)s[i]]++;
    }

    // Subtract the frequency based on string t
    for (int i = 0; t[i] != '\0'; i++) {
        freq[(int)t[i]]--;
        // If any count goes negative, t has extra characters
        if (freq[(int)t[i]] < 0) {
            return false;
        }
    }

    return true;
}

int main() {
    char s[] = "anagram";
    char t[] = "nagaram";

    if (isAnagram(s, t)) {
        printf("The strings are anagrams.\n");
    } else {
        printf("The strings are not anagrams.\n");
    }

    return 0;
}

