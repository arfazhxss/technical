#!/bin/bash

# Function to remove duplicates from a file
remove_duplicates() {
    local file="$1"
    if [[ -f "$file" ]]; then
        sort "$file" | uniq > "${file}.tmp" && mv "${file}.tmp" "$file"
        echo "Processed $file"
    fi
}

# Function to remove entries that are exactly "TEST"
remove_test_entries () {
    local file="$1"
    if [[ -f "$file" ]]; then
        # Use grep to filter out lines that are exactly "TEST"
        grep -v -e '^TEST$' -e '^test$' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
        grep -v -e '^Test/Test/test$' -e '^TEST-TEST-TEST$' -e '^TEST/Test/test$' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
        echo "Removed single TEST entries from $file"
    fi
}

# Function to remove entries that match specific patterns
# remove_specific_test_entries() {
#     local file="$1"
#     if [[ -f "$file" ]]; then
#         # Use grep to filter out lines that match specific patterns
#         grep -v -e '^Test/Test/test$' -e '^TEST-TEST-TEST$' -e '^TEST/Test/test$' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
#         echo "Removed specific TEST entries from $file"
#     fi
# }


# Export the function so it can be used by find -exec
export -f remove_duplicates
export -f remove_test_entries
# export -f remove_specific_test_entries

# Find all .txt files recursively and remove duplicates
# find . -type f -name "*.txt" -exec bash -c 'remove_duplicates "$0"' {} \;
find . -type f -name "*.txt" -exec bash -c 'remove_duplicates "$0"; remove_test_entries "$0"' {} \;
# find . -type f -name "*.txt" -exec bash -c 'remove_duplicates "$0"; remove_test_entries "$0"; remove_specific_test_entries "$0"' {} \;
