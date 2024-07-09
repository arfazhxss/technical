#!/bin/bash

if [ $# -lt 2 ]; then                                               # Check if at least two files are provided
    echo "Please provide at least two PDF files to merge."
    exit 1
fi

for file in "$@"; do                                                # Check if all provided files exist
    if [ ! -f "$file" ]; then
        echo "File $file not found!"
        exit 1
    fi
done

out="merged.pdf"                                                    # Define the output file

gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$out" "$@"  # Run the gs command to merge the PDF files 

if [ $? -eq 0 ]; then                                               # Check if the gs command was successful
    echo "PDF files merged successfully."
    script_dir=$(dirname "$0")                                      # Get the directory of the script
    if [ -f "$script_dir/$out" ]; then                              # Check if there's a "merged.pdf" in the directory of the script
        mv "$script_dir/$out" "$1"                                  # Move and replace the existing "merged.pdf" with the first parameter file
    fi
else
    echo "An error occurred while merging the PDF files."
    exit 1
fi