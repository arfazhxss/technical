#include <stdio.h>
#include <stdlib.h>

int main() {
    // Write to a file
    FILE *filePointer = fopen("example.txt", "w");  // Open file in write mode
    if (filePointer == NULL) {
        printf("File could not be opened for writing.\n");
        return 1;
    }

    fprintf(filePointer, "This is an example text file.\n");
    fprintf(filePointer, "Another line of text.\n");
    fclose(filePointer);  // Close the file after writing

    // Read from the file
    filePointer = fopen("example.txt", "r");  // Open file in read mode
    if (filePointer == NULL) {
        printf("File could not be opened for reading.\n");
        return 1;
    }

    char buffer[100];
    while (fgets(buffer, 100, filePointer) != NULL) {
        printf("%s", buffer);  // Print file content line by line
    }
    fclose(filePointer);  // Close the file after reading

    return 0;
}

