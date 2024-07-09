#!/bin/bash
#!/bin/sh

symbol000="_"
symbol333="$"
symbol555="#"

fall="a37d7o"
spring="a94d6u"
summer="t50e9u"

# Function to check if a directory exists and is valid
check_directory() {
    if [ -z "$1" ]; then
        echo "Error: Directory parameter is missing."
        exit 1
    fi

    if [ -d "$1" ]; then
        directory="$1"
    else
        echo "Error: The specified directory '$1' does not exist or is not a valid directory."
        exit 1
    fi
}

print_file() {
    local file="$1"
    local id="$2"
    local date="$3"
    local MinSec="$4"
    local max="$5"
    local catch="$6"
    printf "[%s/%s] " "$id" "$total"
    printf "{\e[31m$directory/\e[0m\e[32m$file\e[0m}"
    printf "\n\n\e[1;34m${catch}\e[0m"
    printf "\nDate: \t\t%s\n" "$date"
    printf "MinSec: \t%s\n" "$MinSec"
    printf "Max: \t\t%s\n\n" "$max"
}

process_files() {
    local file="$1"
    local id="$2"
    local date="$3"
    local MinSec="$4"
    local max="$5"
    local CString1="$6"
    local nxss="$7"
    local directory="$8"
    local CString2="$9"
    local testC1="${10}"
    local move="${11}"
    local testC2="${12}"
    local newFile="$directory/$nxss"
    local oldFile="$directory/$file"

    if [ "$testC1" ] && [ "$testC1" -eq 1 ]; then
        print_file "$file" "$id" "$date" "$MinSec" "$max" "$CString1"
    fi

    if [ "$move" ] && [ "$move" -eq 1 ]; then
        mv "$oldFile" "$newFile"
        printf "[ \e[1;31mmoved!\e[0m ]"
    fi

    if [ "$postprocess" ] && [ "$postprocess" -eq 1 ]; then
        [ ! -d "$(dirname "$directory")/9.2 PostProcessed" ] && mkdir -p "$(dirname "$directory")/9.2 PostProcessed" 2>/dev/null
        cp -n "$newFile" "$(dirname "$directory")/9.2 PostProcessed" 2>/dev/null
    fi

    if [ "$merge" ] && [ "$merge" -eq 1 ]; then
        [ ! -d "$(dirname "$directory")/9.1 PreProcessed" ] && mkdir -p "$(dirname "$directory")/9.1 PreProcessed" 2>/dev/null
        local count=$(find "$(dirname "$directory")/9.1 PreProcessed" -maxdepth 1 -type f -name "[0-8]*.pdf" | wc -l)
        [ "$count" -ge 1 ] || { echo "Error: Directory does not contain at least one PDF file"; exit 1; }
        [ -f "$newFile" ] && gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$directory/merged.pdf" "$newFile" "$(dirname "$directory")/9.1 PreProcessed"/[0-8]*.pdf
        [ -f "$newFile" ] && mv "$directory/merged.pdf" "$newFile"
    fi

    if [ "$testC2" ] && [ "$testC2" -eq 1 ]; then
        print_file "$nxss" "$id" "$date" "$MinSec" "$max" "$CString2"
    fi
}

renaming_files() {
    for file in "${files[@]}"; do
        ((id++))
        local date=$(exiftool -s -s -s -FileCreateDate "$directory/${file}" | awk -F':' '{print $3}' | awk '{print $1}')
        local MinSec=$(exiftool -s -s -s -FileCreateDate "$directory/$file" | sed -E 's/.* ([0-9]{2}):([0-9]{2}):([0-9]{2}).*/\1\2\3/')

        # Hussain, Arfaz - Placement Application #1 - Software Engineering - ** - **.pdf
        if [[ "$file" == *"Placement Application #"* ]]; then
            
            ((max++))
            local nxs=$(sed 's/Placement Application #[0-9]* - /Placement Application - /g' <<< "$file")
            local nxss="${nxs%% -*} - Placement Application ${symbol000}${spring}${month}${symbol333}${date}${MinSec}${symbol555}${max} ${nxs#*Application }"
            process_files "$file" "$id" "$date" "$MinSec" "$max" "SHOULD HAVE A # AND A NUMBER AFTER \`PLACEMENT APPLICATION\`" "$nxss" "$directory" "Placement Application #" "$testC1" "$move" "$testC2"
            continue

        # Hussain, Arfaz - Placement Application - Software Engineering - ** - **.pdf
        elif [[ "$file" == *"Placement Application -"* && ! "$file" == *"Placement Application #"* ]]; then

            ((max++))
            local nxss="${file%% -*} - Placement Application ${symbol000}${spring}${month}${symbol333}${date}${MinSec}${symbol555}${max} ${file#*Application }"
            process_files "$file" "$id" "$date" "$MinSec" "$max" "SHOULD HAVE A - AFTER \`PLACEMENT APPLICATION\`" "$nxss" "$directory" "Placement Application -" "$testC1" "$move" "$testC2"
            continue
        
        # Hussain, Arfaz - Placement Application 3 - Software Engineering - ** - **.pdf
        elif [[ "$file" == *"Placement Application "* && ! "$file" == *"Placement Application _"* ]]; then
            
            ((max++))
            local nxs=$(sed 's/Placement Application [0-9]* - /Placement Application - /g' <<< "$file")
            local nxss="${nxs%% -*} - Placement Application ${symbol000}${spring}${month}${symbol333}${date}${MinSec}${symbol555}${max} ${nxs#*Application }"
            process_files "$file" "$id" "$date" "$MinSec" "$max" "SHOULD ONLY HAVE A NUMBER AFTER \`PLACEMENT APPLICATION\`" "$nxss" "$directory" "Application +X" "$testC1" "$move" "$testC2"
            continue

        # Hussain, Arfaz - Placement Application _XXX - Software Engineering - ** - **.pdf
        elif [[ "$file" == *"_"* ]]; then 
            
            # TOGGLE THIS WHEN NEEDED
            move=0
            postprocess=0

            ((max++))
            local nxh=$(echo "$file" | sed 's/_[^[:space:]]*//g' | sed 's/  / /g')
            local nxss="${nxh%% -*} - Placement Application ${symbol000}${spring}${month}${symbol333}${date}${MinSec}${symbol555}${max} ${nxh#*Application }"
            process_files "$file" "$id" "$date" "$MinSec" "$max" "SHOULD HAVE A _ AFTER \`PLACEMENT APPLICATION\`" "$nxss" "$directory" "PLACEMENT APPLICATION _" "$testC1" "$move" "$testC2"
            continue;
        
        else
            printf "\n\e[1;31mUNCOUGHT\e[0m\n"
            break;
        fi
    done
}

predir_settings() {
    local baseDir=${directory##*/}
    local baseDir=${baseDir#*[!0-9]}
    month=$(month=$(echo "${baseDir:0:3}" | tr '[:upper:]' '[:lower:]'); echo ${month:0:1}${month: -1})

    files=()
    while IFS= read -r line; do files+=("$line");
    done < <(find "$directory" -type f -name "* - Placement Application*" | sed 's/.*\///; s/.*\([Hh]ussain.*\.pdf\)/\1/' | sort -t'$' -k1,1n)
    total=${#files[@]}

    printf "\nSYMBOLS: %s%s%s\n\n" "$symbol000" "$symbol333" "$symbol555"

    max=$((1 + RANDOM % 1000))
    move=1
    postprocess=1
    merge=1
    testC1=0
    testC2=1
}

execute() {

    # Usage of the function with the directory parameter
    check_directory "$1"

    # pre-execution settings 
    predir_settings

    # renaming files throughout the directory
    renaming_files
    
}

execute "$1"