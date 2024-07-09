# #!/bin/bash
shopt -s extglob

get_dir () {
    echo "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
}

random_two () {
    echo $(jot -r 2 0 9 | tr -d '\n')
}

# Function to escape LaTeX special characters
ESC_LATEX () {
    echo "$1" | sed -e 's/\\/\\\\/g' \
                    -e 's/{/\\{/g' \
                    -e 's/}/\\}/g' \
                    -e 's/\$/\\$/g' \
                    -e 's/&/\\&/g' \
                    -e 's/#/\\#/g' \
                    -e 's/_/\\_/g' \
                    -e 's/%/\\%/g' \
                    -e 's/\^/\\^/g' \
                    -e 's/\~/\\~/g'
}

# Function to create a dropdown menu
DROP_DOWN () {
    local origin="$1"
    local query="$2"
    local ADD="++++++"
    local TST="TEST"
    local options=$(cat "$origin" 2>/dev/null)
    local state=$(echo "$ADD\n$TST\n$options" | fzf --height 10% --border --prompt "$query ")
    [[ -z "$state" || "$state" == "exit" ]] && exit
    if [ "$state" = "$ADD" ]; then
        read -p $'\e[1;33mEnter State: \e[0m' new_state
        read -n 1 -r -s -p $'Press any key to continue...\n'
        echo "$new_state" >>"$origin"
        echo "$new_state"
    elif [ "$state" = "$TST" ]; then
        echo "TEST"
    else
        # echo "$state"
        echo "$state"
    fi
}

# Function to get the Position
get_title () {
    local DATA_DIR="$(get_dir)" 
    local title_origin="$DATA_DIR/0 ATM/title_data.txt"
    local title_query="Enter Position:"
    echo "$(DROP_DOWN "$title_origin" "$title_query")"
}

# Function to get the Company Name
get_company_name () {
    local DATA_DIR="$(get_dir)" 
    local company_name_origin="$DATA_DIR/0 ATM/company_data/company_name.txt"
    local company_name_query="Enter Company Name:"
    echo "$(DROP_DOWN "$company_name_origin" "$company_name_query")"
}

# Function to get the Company Suffix
get_company_suffix () {
    local DATA_DIR="$(get_dir)" 
    local company_suffix_origin="$DATA_DIR/0 ATM/company_data/company_suffix.txt"
    local company_suffix_query="Enter Company Suffix:"
    echo "$(DROP_DOWN "$company_suffix_origin" "$company_suffix_query")"
}

get_state () {
    local DATA_DIR="$(get_dir)" 
    local province_origin="$DATA_DIR/0 ATM/location_data/Provinces.txt"
    local province_query="Enter Province name:"
    echo "$(DROP_DOWN "$province_origin" "$province_query")"
}

get_city () {
    local locationState="$1"
    local DATA_DIR="$(get_dir)" 
    [ -z "$locationState" ] && { echo "$province_query No province selected."; exit 1; }
    local city_origin="$DATA_DIR/0 ATM/location_data/${locationState// /_}.txt"
    local city_query="Enter City name:"
    local locationCity=$(DROP_DOWN "$city_origin" "$city_query")
    [ -z "$locationCity" ] && { echo "$city_query No city selected."; exit 1; } 
    echo "$locationCity"
}

# Function to get the Division
get_division () {
    local DATA_DIR="$(get_dir)" 
    local division_origin="$DATA_DIR/0 ATM/company_data/company_division.txt"
    local division_query="Enter Division:"
    echo "$(DROP_DOWN "$division_origin" "$division_query")"
}

# Function to get the Terms
get_terms () {
    local DATA_DIR="$(get_dir)" 
    local terms_origin="$DATA_DIR/0 ATM/term_data.txt"
    local terms_query="Enter Terms:"
    echo "$(DROP_DOWN "$terms_origin" "$terms_query")"
}

find_term () {
    local terms="$1"
    local term="two"

    # Determine the value of the term variable
    case "$terms" in
        *"4, 8, 12 or 16-month"*)
            local term="three"
            ;;
        *"8, 12 or a 16-month"*)
            local term="three"
            ;;
        *"12-month"*)
            local term="three"
            ;;
        *"16-month"*)
            local term="three"
            ;;
        *"8-month"*)
            local term="two"
            ;;
        *"4-month"*)
            local term="one"
            ;;
        *)
            echo "two"
            exit 1
            ;;
    esac
    echo "$term"
}

body_0 () {
    local body_0_0="I am excited to apply for the {\fontsize{11}{11.5}\selectfont \bfseries \Position} Co-op Placement at"
    local body_0_1="{\fontsize{11}{11.5}\selectfont \bfseries \CompanyName}."
    local body_0_2="I am a software engineering student at the University of Victoria in British Columbia."
    local body_0_3="I am eager to learn and grow in the field of computer and software engineering,"
    local body_0_4="and I believe that this role will help me gain valuable work experience related to my interests and"
    local body_0_5="help me acquire a practical understanding in a real-world setting."
    printf "%s %s %s %s %s %s" "$body_0_0" "$body_0_1" "$body_0_2" "$body_0_3" "$body_0_4" "$body_0_5"
}

body_1 () {
    local body_1_iOS="developing an iOS weather application in Swift Programming Language"
    local body_1_openGL="creating a 3D graphical simulation of a Rubik’s Cube in C++ and OpenGL"
    local body_1_web="developing web development projects in React, JavaScript, and TypeScript"

    local body_1_0="{\fontsize{11}{11.5}\selectfont \bfseries I have a fascination for developing web and mobile applications,"
    local body_1_1="and I am continually learning new skills through personal projects outside school.}"
    local body_1_2="I have been involved in more than 13 software development projects, including ${body_1_iOS}, ${body_1_openGL},"
    local body_1_3="and ${body_1_web}. I have been an active member of the Engineering and Computer Science Students Society and UVic Students Society,"
    local body_1_4="where I have worked as a mentor during my second year and volunteered in multiple events while engaging in software development projects throughout my time."
    printf "%s %s %s %s %s" "$body_1_0" "$body_1_1" "$body_1_2" "$body_1_3" "$body_1_4" 
}

body_2 () {
    local body_2_concepts="object-oriented programming, software architecture and development, testing and evolution, data structures and algorithms"
    local body_2_club_experience="UVic Rocketry and VikeLabs as a full-stack web developer"
    local body_2_club_languages="TypeScript and Python"
    local body_2_databases="both relational and non-relational databases such as MongoDB and PostgreSQL"
    local body_2_database_tools="Prisma, PlanetScale, and Mongoose"
    local body_2_frameworks="Selenium, Puppeteer, Cyprus, JUnit, Maven, and Gradle"
    
    local body_2_0="{\fontsize{11}{11.5}\selectfont \bfseries Throughout my academic endeavours, I have had the chance to learn"
    local body_2_1="the basic concepts of ${body_2_concepts}.} I have actively contributed to ${body_2_club_experience}, where"
    local body_2_2="I have spent much of my time collaborating and developing solutions to issues while reviewing code mostly written in ${body_2_club_languages}."
    local body_2_3="My experience includes developing schemas in ${body_2_databases}, utilizing database tools and services such as ${body_2_database_tools}."
    local body_2_4="Throughout my projects, I have used automation and testing frameworks such as ${body_2_frameworks}."
    local body_2_5="While working in teams at UVic Rocketry, I used ticketing tools such as Jira and Kanban."
    local body_2_6="I plan to specialize in visual computing and data mining, involved in projects that are closely tied to my interests."
    local body_2_7="My strength lies in my ability to work independently, collaborate, adapt to new environments,"
    local body_2_8="and gain familiarity with new tools necessary to excel in this role."
    printf "%s %s %s %s %s %s %s %s %s" "$body_2_0" "$body_2_1" "$body_2_2" "$body_2_3" "$body_2_4" "$body_2_5" "$body_2_6" "$body_2_7" "$body_2_8"
}

body_3 () {
    local term="$(find_term "$1")"
    local body_3_0="{\fontsize{11}{11.5}\selectfont \bfseries I am currently available for \Terms\ work term and"
    local body_3_1="would be open to the possibility of participating in more than ${term} consecutive terms.}"
    local body_3_2="Thank you for considering my application."
    local body_3_3="I look forward to the opportunity to further discuss my skills and experience with \CompanyName."
    printf "%s %s %s %s" "$body_3_0" "$body_3_1" "$body_3_2" "$body_3_3"
}

body_4 () {
    local a="\vspace{10pt}\text{Most Sincerely,}"
    local b="\vspace{-25pt}\begin{flushleft}"
    local c="\hspace*{-1cm}\includegraphics[width=10cm]{../../9.1 PreProcessed/signature.png}\vspace{-1cm}"
    local d="\end{flushleft}"
    local e="\vspace{-10pt}\ps{\textbf{Arfaz Hossain} (He/Him)\\\\"
    local f="Software Engineering Student,\\\\"
    local g="University of Victoria}"
    printf "%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s" "$a" "$b" "$c" "$d" "$e" "$f" "$g"
}

preamble () {
    # local a="\documentclass[a4paper, 12pt]{letter}"
    local a="\documentclass[a4paper, 12pt, oneside]{letter}"
    local b="\usepackage{graphicx}"
    local c="\usepackage{hyperref}"
    local d="\usepackage{amsmath}"
    local e="\usepackage{lmodern}"
    local f="\usepackage{xcolor}"
    local g="\usepackage{adjustbox}"
    local h="\usepackage{fancyhdr}"
    local i="\usepackage{etoolbox}"
    local j="\usepackage[left=0.75in, right=0.75in, top=0.2in, bottom=0.5in]{geometry}"
    local k="\setlength{\parindent}{0pt}"
    printf "%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n" "$a" "$b" "$c" "$d" "$e" "$f" "$g" "$h" "$i" "$j" "$k"
}

custom_ruler_setup () {    
    local a="\newcommand{\CustomRuler}{\vspace{0\baselineskip}\textcolor{black}{\rule{\linewidth}{0.5pt}}\vspace{-0.5\baselineskip}}"
    printf "%s\n" "$a"
}

link_color () {
    local a="\definecolor{linkblue}{HTML}{0000FF}"
    printf "%s\n" "$a"
}

hyper_setup () {
    local a="\hypersetup{"
    local b="colorlinks=true,"
    local_c="linkcolor=linkblue, % Color of internal links"
    local_d="urlcolor=linkblue, % Color of URLs"
    local_e="}"
    printf "%s\n\t\t\t%s\n\t\t\t%s\n\t\t\t%s\n\t\t%s\n" "$a" "$b" "$local_c" "$local_d" "$local_e"
}

footer_setup () {
    local a="\fancypagestyle{plain}{"
    local b="\fancyhf{} % Clear header and footer"
    local c="\renewcommand{\headrulewidth}{0pt}"
    local d="}"
    printf "%s\n\t\t\t%s\n\t\t\t%s\n\t\t%s\n" "$a" "$b" "$c" "$d"
}

var_define () {
    local a="\newcommand{\Position}{$position}"
    local b="\newcommand{\CompanyName}{$company_name}"
    local c="\newcommand{\CompanyNameSuffix}{$company_suffix}"
    local d="\newcommand{\Division}{$division}"
    local e="\newcommand{\LocationCity}{$locationCity}"
    local f="\newcommand{\LocationState}{$locationState}"
    local g="\newcommand{\Terms}{$terms}"
    printf "%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s\n" "$a" "$b" "$c" "$d" "$e" "$f" "$g"
}

line_break () {
    local a="\vspace{-7pt}\\\\\\\\"
    printf "%s" "$a"
}

header_settings () {
    local a="\noindent"
    local b="\begin{minipage}[t]{0.5\textwidth}"
    local c="\raggedright"
    local d="\vspace{3pt}"
    local e="{\fontsize{30}{34}\selectfont Arfaz Hossain} \\\\"
    local f="\vspace{2pt}"
    local g="{\fontsize{12}{14}\selectfont Victoria, British Columbia}"
    local h="\end{minipage}%"
    local i="\begin{minipage}[t]{0.5\textwidth}"
    local j="\raggedleft"
    local k="\vspace{1pt}"
    local l="\href{https://www.github.com/arfazhxss}{\fontsize{12}{14}\selectfont www.github.com/arfazhxss} \\\\"
    local m="\href{https://www.linkedin.com/in/arfazhussain}{\fontsize{12}{14}\selectfont www.linkedin.com/in/arfazhussain} \\\\"
    local n="\href{https://arfazhxss.ca/resume.pdf}{\fontsize{12}{14}\selectfont arfazhxss.ca/resume.pdf}"
    local o="\end{minipage}"
    printf "%s\n\t\t%s\n\t\t\t%s\n\t\t\t%s\n\t\t\t%s\n\t\t\t%s\n\t\t\t%s\n\t\t%s\n\t\t%s\n\t\t\t%s\n\t\t\t%s\n\t\t\t%s\n\t\t\t%s\n\t\t\t%s\n\t\t%s" "$a" "$b" "$c" "$d" "$e" "$f" "$g" "$h" "$i" "$j" "$k" "$l" "$m" "$n" "$o"
}

custom_ruler () {
    local a="\CustomRuler \vspace{20pt} \today \vspace{5pt}"
    printf "%s" "$a"
}

begin_document () {
    local a="\begin{document}"
    local b="\pagestyle{empty}"
    printf "%s\n\t\t%s" "$a" "$b"
}

letter_details () {
    local a="\textbf{\CompanyName}\textbf{ \CompanyNameSuffix} \\\\"
    local b="\text{Division: \Division} \\\\"
    local c="\vspace{20pt}\text{Location: \LocationCity}, \text{\LocationState} \\\\"
    local d="\vspace{10pt}\text{Dear Hiring Manager:} \\\\"
    printf "%s\n\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s" "$a" "$b" "$c" "$d"
}

# Function to generate LaTeX file
LaTeX () {
    local position="$1"
    local company_name="$2"
    local company_suffix="$3"
    local division="$4"
    local locationCity="$5"
    local locationState="$6"
    local terms="$7"
    
    local preamble="$(preamble)"
    local custom_ruler_setup="$(custom_ruler_setup)"
    local link_color="$(link_color)"
    local hyper_setup="$(hyper_setup)"
    local var_define="$(var_define)"
    local footer_setup="$(footer_setup)"
    local line_break="$(line_break)"
    local header_settings="$(header_settings)"
    local begin_document="$(begin_document)"
    local custom_ruler="$(custom_ruler)"
    local letter_details="$(letter_details)"

    local body_0="$(body_0)"
    local body_1="$(body_1)"
    local body_2="$(body_2)"
    local body_3="$(body_3 "$7")"
    local body_4="$(body_4)"

    # Generate LaTeX file content
    cat <<-EOF > tntx.tex
        % Define the preamble
        $preamble

        % Define the new ruler command
        $custom_ruler_setup

        % Define color for hyperlinks
        $link_color % Blue color

        % Set up hyperref package
        $hyper_setup

        % Redefine footer style to remove page number
        $footer_setup

        % Define variables
        $var_define

        % Begin document
        $begin_document

        % Header with name and links
        $header_settings

        % Custom ruler (or a line ------)
        $custom_ruler

        % Letter details
        $letter_details $body_0 $line_break
        $body_1 $line_break
        $body_2 $line_break
        $body_3 \\\\\\\\
        $body_4 
        \end{document}
EOF
}

generator () {
    # Escape LaTeX special characters in variables
    local position=$(ESC_LATEX "$(get_title)")
    local company_name=$( [ "$position" == "TEST" ] && echo "TEST" || ESC_LATEX "$(get_company_name)" )
    local company_suffix=$( [ "$company_name" == "TEST" ] && echo "TEST" || ESC_LATEX "$(get_company_suffix)" )
    local division=$( [ "$company_suffix" == "TEST" ] && echo "TEST" || ESC_LATEX "$(get_division)" )
    local locationState=$( [ "$division" == "TEST" ] && echo "TEST" || ESC_LATEX "$(get_state)" )
    local locationCity=$( [ "$locationState" == "TEST" ] && echo "TEST" || ESC_LATEX "$(get_city "$locationState")" )
    local terms=$( [ "$locationCity" == "TEST" ] && echo "TEST" || ESC_LATEX "$(get_terms)" )

    # Check if any of the variables are empty and exit if so
    for var in position company_name division locationCity locationState terms; do
        [[ -z ${!var} ]] && { echo "The variable '$var' is empty. Exiting."; exit 1; }
    done

    local filename="Hussain, Arfaz - Placement Application - ${position} - ${company_name} ${company_suffix} - ${division}"
    [ "$terms" == "TEST" ] && filename="TEST-$(date '+%Y-%m-%d')-$(random_two)"
    
    LaTeX "$position" "$company_name" "$company_suffix" "$division" "$locationCity" "$locationState" "$terms"
    echo "$filename"
    unset position company_name company_suffix division locationCity locationState terms filename testCHK
}

test_removal () {
    find . -type f -name '*TEST*.pdf' -delete
}

main () {
    local filename=$(generator | sed 's/[\/\\,;]//g')
    perl -pe 's/^( {8}|\t{2})//' tntx.tex > ntntx.tex && mv ntntx.tex tntx.tex
    mv tntx.tex "9.2 PostProcessed/tex-outputs/" || exit 1
    sed -i 's/ \+/ /g' "9.2 PostProcessed/tex-outputs/tntx.tex"

    # This removes all "TEST" entries in the srt.sh script
    ./0\ ATM/srt.sh

    cd "9.2 PostProcessed/tex-outputs"
    pdflatex tntx.tex && mv tntx.pdf "$filename.pdf"
    cp "$filename.pdf" ../
    cp "$filename.pdf" ../../1\ jne\ 10/
    rm -f !(*.tex)
    cd ../../ || exit

    echo "Cover letter generated and saved as $filename.pdf"
    unset filename
}

test_removal
main