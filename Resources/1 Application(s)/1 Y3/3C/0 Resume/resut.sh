#!/bin/bash

# Define the data for the entries
PersonalProject_001_NAME="Rubik’s Cube (3D Simulation)"
PersonalProject_001_DATE="Feb 2023 – June 2023"
PersonalProject_001_LINK="www.github.com/arfazhxss/OpenGL-projects"
PersonalProject_001_LOCATION="Victoria, BC"
PersonalProject_001_DESC1="Developed a 3D simulation utilizing OpenGL libraries GLUT, GLFW, and GLM, incorporating graphics rendering techniques through GLSL (Shader Language) for visualizations, mathematical operations"
PersonalProject_001_DESC2="Implemented intuitive keyboard and mouse controls, including precise cube rotations with keys such as L, J, I, K, and dynamic zoom functionalities with keyboard shortcuts"

PersonalProject_002_NAME="Simple Weather Application (iOS)"
PersonalProject_002_DATE="Apr 2023 – Nov 2023"
PersonalProject_002_LINK="www.github.com/arfazhxss/Weather-Application"
PersonalProject_002_LOCATION="Victoria, BC"
PersonalProject_002_DESC1="Developed a simple iOS application using Swift programming language on object-oriented programming principles, ensuring a modular and maintainable codebase"
PersonalProject_002_DESC2="Implemented a user-friendly interface that seamlessly integrates with OpenWeather API, allowing users to access and navigate through accurate weather information for their current city"

CollaborativeProject_001_NAME="Study Sprints"
CollaborativeProject_001_DATE="Feb 2024 – Present"
CollaborativeProject_001_LINK="www.github.com/VikeLabs/Study-Sprints"
CollaborativeProject_001_LOCATION="Victoria, BC"
CollaborativeProject_001_DESC1="Collaborating with a team of 6 developers to create a full-stack Pomodoro application utilizing React with TypeScript, addressing users' time management requirements"
CollaborativeProject_001_DESC2="Utilizing Next.js framework for efficient routing and MongoDB for data storage and retrieval, to track and review past activities of users over the last day, month and year"

CollaborativeProject_002_NAME="Ground Support System"
CollaborativeProject_002_DATE="Jul 2023 – Jan 2024"
CollaborativeProject_002_LINK="www.github.com/UVicRocketry/Ground-Support"
CollaborativeProject_002_LOCATION="Victoria, BC"
CollaborativeProject_002_DESC1="Collaborated with a team of 13 developers in developing a full-stack telemetry visualization and post-flight analytical software for engineering students analyzing rocket performance in real-time"
CollaborativeProject_002_DESC2="Developed a total of 13 Material-UI components in React with TypeScript, ensuring type safety and fidelity to Figma designs, enhancing adaptability and usability across multiple platforms"

Experience_001_NAME="Software Team Lead"
Experience_001_DATE="Feb 2024 – Present"
Experience_001_ORGANIZATION="VikeLabs"
Experience_001_LOCATION="Victoria, BC"
Experience_001_DESC1="Simultaneously working in 3 full-stack projects courseup, coopme and study-sprints facilitating collaboration with team leads through meetings and progress tracking across teams"

Experience_002_NAME="Graphics Coordinator"
Experience_002_DATE="Jan 2023 – Present"
Experience_002_ORGANIZATION="Engineering Student’s Society"
Experience_002_LOCATION="Victoria, BC"
Experience_002_DESC1="Designed and illustrated a total 15+ posters and 20+ social media posts while managing office hours to ensure the availability of the student lounge, maintaining websites and social media accounts"

Experience_003_NAME="Grocery Clerk"
Experience_003_DATE="Apr 2022 – Sept 2022"
Experience_003_ORGANIZATION="Save On Foods"
Experience_003_LOCATION="Victoria, BC"
Experience_003_DESC1="Oversaw store operations in a 10-to-12-member team while addressing 50 inquiries each shift, maintaining inventory through detailed stock records and rotations, helping in reducing stock shortages by 7"

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
\resumeSubItem{Frameworks and Libraries}{Node, Next.js, React, Express, Material, Shadcn, Tailwind}
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

\begin{resumeSubHeadingListStart}
\resumeSubheading
    {$PersonalProject_002_NAME}
    {$PersonalProject_002_DATE}
    {\textcolor{blue}{$PersonalProject_002_LINK}}
    {$PersonalProject_002_LOCATION}
\begin{resumeItemListStart}
    \resumeItemDot{$PersonalProject_002_DESC1}
    \resumeItemDot{$PersonalProject_002_DESC2}
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

