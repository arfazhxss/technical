#!/bin/bash
#!/bin/sh

option () {
    local number="$1";
    local title="$2";
    local end="${3:-\t}";
    printf "${fgcya}**${fgyel} ${number}/${fgcya} ${title} ${normal}"
    local padding=$((33 - ${#number} - ${#title}))
    local i; 
    for ((i=0; i<padding; i++)); do 
        printf "${fgcya} ${normal}"; 
    done;
    printf "${fgcya}**${normal}${end}";
}

colorset () {
    normal=$(echo "\033[m")         # normal white
    fgcya=$(echo "\033[36m")        # light cyan
    bgred=$(echo "\033[41m")        # background red
    fgred=$(echo "\033[31m")        # foreground red
    fgyel=$(echo "\033[33m")        # foreground yellow
    und=$(echo "\033[4m")           # underline
    msgcolor=`echo "\033[01;31m"`   # bold red
}

break () {
    local char="${1:-*}"
    local count="${2:-4}"
    local end="${3:-\t}"
    local color="${4:-\033[m}"
    printf "${color}";
    local i; 
    for ((i=0; i<count; i++)); 
        do printf "${char}"; 
    done;
    printf "${normal}${end}";
}

breaknormal () {
    break "*" 41 "\n" "${fgcya}";
}

breakspace () {
    local spa="${1}"
    break " " "$spa" " ";
}

menuset() {
    local num=$#
    local i; 
    for ((i=0; i<num; i++)); do 
        option "$((i+1))" "${@:i+1:1}" "\n"; 
    done;
}

keystroke () {
    local key="${1:-10}"
    breakspace key; 
    printf "${fgred}ENTER ${normal}to skip\n"
    breakspace key; 
    printf "${fgred}X, Q, ESC ${normal}to exit\n"
    breakspace "$((key-2))" 
    printf "> ${normal}"; 
    read opt;
}

menu () {
    colorset

    breaknormal
    menuset \
        "OPTION 1" \
        "OPTION 2" \
        "OPTION 3" \
        "OPTION 4" \
        "OPTION 5" 
    breaknormal

    keystroke 8
}

format (){
    colorset
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
menu
while [ "$opt" != "" ]
    do
    if [ "$opt" = "" ]; then
        exit;
    else
      case "$opt" in
        1) clear;
            format "Option 1 Picked";
            printf "test1";
            exit;
        ;;
        2) clear;
            format "Option 2 Picked";
            printf "test2";
            exit;
        ;;
        3) clear;
            format "Option 3 Picked";
            printf "test3";
            exit;
        ;;
        4) clear;
            format "Option 4 Picked";
            # printf "test4";
            exit;
        ;;
        x|X|q|Q|[$'\x1b'])exit;;
        *)clear;
            format "Pick an option from the menu";
            menu;
        ;;
      esac
    fi
done
