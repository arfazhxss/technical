#!/bin/bash

# Define color variables
BLUE='\033[0;34m'
NC='\033[0m' # No Color (reset)

# Remove all executable files (files without extensions) from the current folder
echo -e "${BLUE}[Removing old executable files]${NC}"
find . -maxdepth 1 -type f -not -name '*.*' -exec rm -f {} +

# Check if the filename is passed
if [ -z "$1" ]; then
    echo -e "${BLUE}Usage: ./c.sh <filename.c>${NC}"
    exit 1
fi

# Extract the filename without extension for output
filename=$(basename -- "$1")
output="${filename%.*}"

# Check if the file exists
if [ ! -f "$1" ]; then
    echo -e "${BLUE}Error: File '$1' not found.${NC}"
    exit 1
fi

# Compile the C file with optimizations and error handling
echo -e "${BLUE}[Compiling $1]${NC}"
gcc -o "$output" "$1" -O2 -Wall -Wextra -pedantic -std=c11

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo -e "${BLUE}[Compilation successful. Output: ./$output]${NC}"
    # Run the compiled program
    ./"$output"
else
    echo -e "${BLUE}Compilation failed.${NC}"
    exit 1
fi
