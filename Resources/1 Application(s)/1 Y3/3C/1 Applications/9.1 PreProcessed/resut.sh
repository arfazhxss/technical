#!/bin/bash

ESC_LATEX() {
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

# Define the data for the entries
PersonalProject_001_NAME=$(ESC_LATEX "Rubik’s Cube (3D Simulation)")
PersonalProject_001_DATE=$(ESC_LATEX "Feb 2023 – June 2023")
PersonalProject_001_LINK=$(ESC_LATEX "www.github.com/arfazhxss/OpenGL-projects")
PersonalProject_001_LOCATION=$(ESC_LATEX "Victoria, BC")
PersonalProject_001_DESC1=$(ESC_LATEX "Developed a 3D simulation utilizing OpenGL libraries GLUT, GLFW, and GLM, incorporating graphics rendering techniques through GLSL (Shader Language) for visualizations, mathematical operations")
PersonalProject_001_DESC2=$(ESC_LATEX "Implemented intuitive keyboard and mouse controls, including precise cube rotations with keys such as L, J, I, K, and dynamic zoom functionalities with keyboard shortcuts")

CollaborativeProject_001_NAME=$(ESC_LATEX "Course Planner")
CollaborativeProject_001_DATE=$(ESC_LATEX "Feb 2024 – Present")
CollaborativeProject_001_LINK=$(ESC_LATEX "www.github.com/arfazhxss/course-planner")
CollaborativeProject_001_LOCATION=$(ESC_LATEX "Victoria, BC")
CollaborativeProject_001_DESC1=$(ESC_LATEX "Developing a course planning tool for students using Next.js and PostgreSQL, facilitating students to plan their course selection and checking degree progress by dragging and dropping courses into the database")
CollaborativeProject_001_DESC2=$(ESC_LATEX "Utilizing Puppeteer and Selenium for automated web scraping, extracting course data from degree-specific websites, and using Node.js in the backend with PostgreSQL for database management")

CollaborativeProject_002_NAME=$(ESC_LATEX "Coop-me")
CollaborativeProject_002_DATE=$(ESC_LATEX "Dec 2023 – Present")
CollaborativeProject_002_LINK=$(ESC_LATEX "www.github.com/VikeLabs/coopme")
CollaborativeProject_002_LOCATION=$(ESC_LATEX "Victoria, BC")
CollaborativeProject_002_DESC1=$(ESC_LATEX "Developing an improved co-op job search platform for University of Victoria students by scraping data from Learning In Motion (LIM) using Puppeteer and Cypress, and populating the database with job listing data")
CollaborativeProject_002_DESC2=$(ESC_LATEX "Integrating Prisma Object-Relational Mapping tool with PostgreSQL for backend database management, NextAuth.js for authentication, Next.js for server-side rendering, Tailwind CSS and Shadcn for UI/UX design")

CollaborativeProject_003_NAME=$(ESC_LATEX "Ground Support System")
CollaborativeProject_003_DATE=$(ESC_LATEX "Jul 2023 – Jan 2024")
CollaborativeProject_003_LINK=$(ESC_LATEX "www.github.com/UVicRocketry/Ground-Support")
CollaborativeProject_003_LOCATION=$(ESC_LATEX "Victoria, BC")
CollaborativeProject_003_DESC1=$(ESC_LATEX "Collaborated with a team of 13 developers in developing a full-stack telemetry visualization and post-flight analytical software for engineering students analyzing rocket performance in real-time")
CollaborativeProject_003_DESC2=$(ESC_LATEX "Developed front-end components in React using TypeScript, contributed to the project’s final Figma designs, and implemented data visualizations through Material-UI tables and charts")

Experience_001_NAME=$(ESC_LATEX "Software Team Lead")
Experience_001_DATE=$(ESC_LATEX "Feb 2024 – Present")
Experience_001_ORGANIZATION=$(ESC_LATEX "VikeLabs")
Experience_001_LOCATION=$(ESC_LATEX "Victoria, BC")
Experience_001_DESC1=$(ESC_LATEX "Collaborating with 5+ software team leads and executives to arrange workshops for 100+ computer science and software engineering students, attending weekly meetings and bi-weekly hackathons, and leading two full-stack projects")

Experience_002_NAME=$(ESC_LATEX "Graphics Coordinator")
Experience_002_DATE=$(ESC_LATEX "Jan 2023 – Present")
Experience_002_ORGANIZATION=$(ESC_LATEX "Engineering and Computer Science Student’s Society")
Experience_002_LOCATION=$(ESC_LATEX "Victoria, BC")
Experience_002_DESC1=$(ESC_LATEX "Designing posters and social media content, volunteering at events, managing office hours to ensure the availability of the student lounge, and maintaining the official website and the exam bank for all engineering and computer science students")

Experience_003_NAME=$(ESC_LATEX "Grocery Clerk")
Experience_003_DATE=$(ESC_LATEX "Apr 2022 – Sept 2022")
Experience_003_ORGANIZATION=$(ESC_LATEX "Save On Foods")
Experience_003_LOCATION=$(ESC_LATEX "Victoria, BC")
Experience_003_DESC1=$(ESC_LATEX "Oversaw store operations with a team of 10 to 12 members, addressed customer inquiries, maintained inventory through detailed stock records and rotations, helped reduce stock shortages by 7%, and stocked products into store shelves")

# Generate the LaTeX file
cat <<EOT > resume.tex
\documentclass[a4paper,10pt]{article}

% Import necessary packages
\usepackage{latexsym}
\usepackage[empty]{fullpage}
\usepackage{titlesec}
\usepackage{marvosym}
\usepackage[usenames,dvipsnames]{color}
\usepackage{enumitem}
\usepackage{hyperref}
\usepackage{fancyhdr}
\usepackage{amsmath}
\usepackage[left=0.65in, right=0.90in, top=1.10in, bottom=0.75in]{geometry}

\hypersetup{
    colorlinks=true,
    linkcolor=blue,     % Color of internal links
    urlcolor=black,     % Color of URL links
    citecolor=blue      % Color of citations
}

% Reduce vertical space in lists
\setlist{itemsep=0pt, parsep=0pt, topsep=5pt, partopsep=0pt}

% Reduce space around sections and line spacing
\titlespacing{\section}{0pt}{0pt}{5pt}
\setlength{\parskip}{0.3em}
\renewcommand{\baselinestretch}{1.0}

% Set up the page style
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\oddsidemargin}{-0.375in}
\addtolength{\evensidemargin}{-0.375in}
\addtolength{\textwidth}{1.0in}
\addtolength{\topmargin}{-0.75in}
\addtolength{\textheight}{1.5in}

% URL style
\urlstyle{same}

\renewcommand{\titlerule}{\vspace{-0.9\baselineskip}\textcolor{black}{\rule{\linewidth}{0.3pt}}\vspace{-0.5\baselineskip}}

% Section formatting
\titleformat{\section}
{\scshape\large\raggedright}
{}{0em}
{}[\titlerule]

\newcommand{\TechSkillItems}[2]
{\item \normalsize{\textbf{#1}{: #2}}}

\newcommand{\resumeItemDot}[1]
{\item \normalsize{#1}}

\newcommand{\resumeSubheading}[4]{
  \item
    \begin{tabular*}{\dimexpr\textwidth-1.2em\relax}{@{}l@{\extracolsep{\fill}}r@{}}
      \large \textbf{#1} & \fontsize{11}{12}\selectfont \text{#2} \\\\
      \textit{#3} & \textit{#4} \\\\
    \end{tabular*}\vspace{-2pt}
}

\newcommand{\resumeScholarshipSubheading}[2]{
  \item
    \begin{tabular*}{\dimexpr\textwidth-1.2em\relax}{@{}l@{\extracolsep{\fill}}r@{}}
      \textbullet \ \ \textbf{#1} & \normalsize{#2} \\\\
    \end{tabular*}\vspace{-2pt}
}

\newcommand{\resumeSubItem}[2]{\TechSkillItems{#1}{#2}}

\newenvironment{resumeSubHeadingListStart}
{\begin{itemize}[leftmargin=0.10in, label={}]}
{\end{itemize}}

\newenvironment{resumeItemListStart}
{\begin{itemize}[leftmargin=0.15in, label={$\bullet$}]}
{\end{itemize}}

\begin{document}

% Header
\begin{center}
    \textbf{\Huge Arfaz Hossain} \\\\ \vspace{2pt}
    +1 (250) 880 8402 \ $|$ \
    \href{mailto:arfazhussain@uvic.ca}
    {arfazhussain@uvic.ca} \ $|$ \ 
    \href{https://www.linkedin.com/in/arfazhussain}{linkedin.com/in/arfazhussain} \ $|$ \ 
    \href{https://github.com/arfazhxss}{github.com/arfazhxss} \vspace{2pt} \\\\
    \href{https://www.arfazhxss.ca}{\large \textbf{www.arfazhxss.ca}}
\end{center}

% Education
\section{Education}
\begin{resumeSubHeadingListStart}
\resumeSubheading
    {Bachelor of Software Engineering (BEng)}
    {Sept. 2021 – Present}
    {University of Victoria}
    {Victoria, BC}
\end{resumeSubHeadingListStart}

% Technical Skills
\section{Technical Skills}
\begin{resumeSubHeadingListStart}
\resumeSubItem{Languages}{Java, Python, TypeScript, JavaScript, Objective-C (Swift), C++, HTML/CSS, R}
\resumeSubItem{Frameworks and Libraries}{Node, Next.js, React, Express, Material, Shadcn, Tailwind CSS}
\resumeSubItem{Databases}{MySQL, PosgreSQL, SQLite, MongoDB, Redis, DynamoDB, CloudSQL}
\resumeSubItem{Developer Tools}{Visual Studio, IntelliJ, JUnit, Eclipse, Maven, Gradle, Git, Docker}
\end{resumeSubHeadingListStart}

% Selected Collaborative Projects
\section{Selected Collaborative Projects}
\begin{resumeSubHeadingListStart}
\resumeSubheading
    {$CollaborativeProject_001_NAME}
    {$CollaborativeProject_001_DATE}
    {\textcolor{blue}{$CollaborativeProject_001_LINK}}
    {$CollaborativeProject_001_LOCATION}
\begin{resumeItemListStart}
    \resumeItemDot{$CollaborativeProject_001_DESC1}
    \resumeItemDot{$CollaborativeProject_001_DESC2}
\end{resumeItemListStart}
\end{resumeSubHeadingListStart}

\begin{resumeSubHeadingListStart}
\resumeSubheading
    {$CollaborativeProject_002_NAME}
    {$CollaborativeProject_002_DATE}
    {\textcolor{blue}{$CollaborativeProject_002_LINK}}
    {$CollaborativeProject_002_LOCATION}
\begin{resumeItemListStart}
    \resumeItemDot{$CollaborativeProject_002_DESC1}
    \resumeItemDot{$CollaborativeProject_002_DESC2}
\end{resumeItemListStart}
\end{resumeSubHeadingListStart}

\begin{resumeSubHeadingListStart}
\resumeSubheading
    {$CollaborativeProject_003_NAME}
    {$CollaborativeProject_003_DATE}
    {\textcolor{blue}{$CollaborativeProject_003_LINK}}
    {$CollaborativeProject_003_LOCATION}
\begin{resumeItemListStart}
    \resumeItemDot{$CollaborativeProject_003_DESC1}
    \resumeItemDot{$CollaborativeProject_003_DESC2}
\end{resumeItemListStart}
\end{resumeSubHeadingListStart}

% Selected Personal Projects
\section{Selected Personal Projects}
\begin{resumeSubHeadingListStart}
\resumeSubheading
    {$PersonalProject_001_NAME}{$PersonalProject_001_DATE}
    {\textcolor{blue}{$PersonalProject_001_LINK}}
    {$PersonalProject_001_LOCATION}
\begin{resumeItemListStart}
    \resumeItemDot{$PersonalProject_001_DESC1}
    \resumeItemDot{$PersonalProject_001_DESC2}
\end{resumeItemListStart}
\end{resumeSubHeadingListStart}

% Relevant Experiences
\section{Relevant Experiences}
\begin{resumeSubHeadingListStart}
\resumeSubheading
    {$Experience_001_NAME}
    {$Experience_001_DATE}
    {$Experience_001_ORGANIZATION}
    {$Experience_001_LOCATION}
\begin{resumeItemListStart}
    \resumeItemDot{$Experience_001_DESC1}
\end{resumeItemListStart}
\end{resumeSubHeadingListStart}

\begin{resumeSubHeadingListStart}
\resumeSubheading
    {$Experience_002_NAME}
    {$Experience_002_DATE}
    {$Experience_002_ORGANIZATION}
    {$Experience_002_LOCATION}
\begin{resumeItemListStart}
    \resumeItemDot{$Experience_002_DESC1}
\end{resumeItemListStart}
\end{resumeSubHeadingListStart}

\begin{resumeSubHeadingListStart}
\resumeSubheading
    {$Experience_003_NAME}
    {$Experience_003_DATE}
    {$Experience_003_ORGANIZATION}
    {$Experience_003_LOCATION}
\begin{resumeItemListStart}
    \resumeItemDot{$Experience_003_DESC1}
\end{resumeItemListStart}
\end{resumeSubHeadingListStart}

% Honors and Awards
\section{Honors and Awards}
\begin{resumeSubHeadingListStart}
\resumeScholarshipSubheading{Recipient of University of Victoria’s International Entrance Scholarship}{2021 – 2022}
\end{resumeSubHeadingListStart}

\end{document}
EOT

# Compile the LaTeX file to PDF
pdflatex resume.tex

shopt -s extglob
rm -f !(*.tex|*.pdf|*.sh|*.png)
