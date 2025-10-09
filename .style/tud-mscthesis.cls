% Template for MSc Thesis reports at TU Delft, 
% Modified and integrated by Carmine Varriale

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{.style/tud-mscthesis}[%
    2025-10-01 v1.0 TU Delft MSc Thesis Template by Carmine Varriale]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[10pt]{book}


%% Page size
%% ---------------------------------------------------------------
\RequirePackage{bookmark}
\RequirePackage{pdfpages}
\RequirePackage{geometry}
\geometry{
    a4paper,
    hscale=0.77,
    vscale=0.8
}



%% Parameters
%% ---------------------------------------------------------------
\renewcommand{\title}[1]{%
    \def\@title{#1}%
    \hypersetup{pdftitle=#1}}

\renewcommand*{\author}[2][]{%
    \def\@author{#2}%
    \def\@author@short{#1}%
    \hypersetup{pdfauthor=\ifdefvoid{\@author@short}{#2}{#1}}} 

\newcommand*{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand*{\addcoverimage}[1]{\def\@coverimage{#1}}



%% Fonts
%% ---------------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{csquotes}

\addto\captionsenglish{
  \renewcommand{\contentsname}%
    {Table of contents}%
}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

\RequirePackage{iftex} 
\ifPDFTeX
    \newcommand{\titlestyle}{%
        \fontfamily{RobotoSlab-TLF}\fontseries{light}\selectfont}
    \newcommand{\largetitlestyle}{%
        \fontfamily{RobotoSlab-TLF}\fontseries{thin}\selectfont}
\else
    \RequirePackage[no-math]{fontspec}
    \setmainfont{Arial}
    \setmathsf{Arial}
    \setmathtt{Arial}
    \newfontfamily\titlestyle{Roboto Slab Light}
    \newfontfamily\largetitlestyle{Roboto Slab Thin}
\fi



%% Colors
%% ---------------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{tudelft-cyan}{cmyk}{1,0,0,0}
\definecolor{tudelft-black}{cmyk}{0,0,0,1}
\definecolor{tudelft-white}{cmyk}{0,0,0,0}
\definecolor{tudelft-sea-green}{cmyk}{0.54,0,0.32,0}
\definecolor{tudelft-green}{cmyk}{1,0.15,0.4,0}
\definecolor{tudelft-dark-blue}{cmyk}{1,0.66,0,0.4}
\definecolor{tudelft-purple}{cmyk}{0.98,1,0,0.35}
\definecolor{tudelft-turquoise}{cmyk}{0.82,0,0.21,0.08}
\definecolor{tudelft-sky-blue}{cmyk}{0.45,0,0.06,0.06}
\definecolor{tudelft-lavendel}{cmyk}{0.45,0.2,0,0.07}
\definecolor{tudelft-orange}{cmyk}{0.02,0.56,0.84,0}
\definecolor{tudelft-warm-purple}{cmyk}{0.58,1,0,0.02}
\definecolor{tudelft-fuchsia}{cmyk}{0.19,1,0,0.19}
\definecolor{tudelft-bright-green}{cmyk}{0.36,0,1,0}
\definecolor{tudelft-yellow}{cmyk}{0.02,0,0.54,0}



%% Cover page
%% ---------------------------------------------------------------
\RequirePackage{tikz}
\RequirePackage{datetime}

\newcommand*{\makecover}{
    \usetikzlibrary{positioning}
    \thispagestyle{empty}
    \begin{tikzpicture}[overlay,remember picture]

        %% Add the cover image
        \node[above=0,inner sep=0] at (current page.south) {%
            \includegraphics[width=\paperwidth]{\@coverimage}};

        %% Add the logo in the bottom left
        \node[above right=10mm] at (current page.south west) {%
            \includegraphics[width=0.35\linewidth]{.style/tud-logo-white.pdf}};

        %% Banner with title, subtitle and author
        \node[
            below=2cm, 
            fill=black!85,
            minimum width={\paperwidth},
            inner ysep=25pt,
            opacity=0.6,
            text opacity=1
            ] at (current page.north) {%
            \begin{minipage}{0.9\paperwidth}

                %% Title
                \definecolor{title}{HTML}{4984d6} % Color for cover title
                \color{title}%
                \raggedright%
                \largetitlestyle%
                \fontsize{36}{36}%
                \selectfont%
                    \@title \\[0.5ex]

                %% Subtitle
                \color{white}%
                \titlestyle%
                \fontsize{22}{22}%
                \selectfont%
                    \ifdefvoid{\@subtitle}{}{\@subtitle \\[4.5ex]}%
                    \ifdefvoid{\@subject}{}{\@subject \\[0.5ex]}
                
                %% Author
                \largetitlestyle%
                \fontsize{24}{24}%
                \selectfont%
                    \ifdefvoid{\@covertable}{\@author}{\@covertable}
            \end{minipage}};
    \end{tikzpicture}
    \newpage
}



%% Pagestyle
%% ---------------------------------------------------------------
\RequirePackage[parfill]{parskip}

\RequirePackage{enumitem}
\setlist{itemsep=-2pt}  

\RequirePackage{titlesec}   
\RequirePackage{fancyhdr}   

% Part header
\titleformat{\part}[display]
    {\flushright\titlestyle}
    {\fontsize{72}{72}\bfseries Part \thepart}
    {0pt}
    {\Huge}
\titlespacing*{\part}{0pt}{0pt}{2\baselineskip}

% Chapter titles and spacing
\titleformat{\chapter}[display]
    {\flushright}
    {\fontsize{72}{72}\bfseries\selectfont\thechapter}
    {0pt}
    {\Huge\titlestyle}
\titlespacing*{\chapter}{0pt}{0pt}{2\baselineskip}

% Section titles and spacing
\titleformat{\section}
    {\Large\titlestyle\bfseries}
    {\thesection.}
    {5pt}
    {}
\titlespacing*{\section}{0pt}{\baselineskip}{0pt}

% Subsections titles and spacing
\titleformat{\subsection}
    {\large\titlestyle\bfseries}
    {\thesubsection.}
    {5pt}
    {}
\titlespacing*{\subsection}{0pt}{\baselineskip}{0pt}

% Subsubsections titles and spacing
\titleformat{\subsubsection}
    {\titlestyle\bfseries}
    {}
    {0pt}
    {}
\titlespacing*{\subsubsection}{0pt}{\bigskipamount}{0pt}

% Head rule
\renewcommand*\headrule{%
    {\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth}

% Title pages
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \fancyfoot[C]{\thepage}}

% Main matter
\if@twoside%
    \fancyhf{}
    \fancyhead[LE,RO]{\titlestyle\thepage}
    \fancyhead[RE]{\titlestyle\nouppercase{\leftmark}}
    \fancyhead[LO]{\titlestyle\nouppercase{\rightmark}}
    \RequirePackage{emptypage} % Clears empty pages
\else%
    \fancyhf{}
    \fancyhead[R]{\titlestyle\thepage}
    \fancyhead[L]{\titlestyle\nouppercase{\rightmark}}
\fi

\pagestyle{fancy} % Set it to default

%% Header and footer of 'plain' pages
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{\titlestyle\thepage}}

%% Header and footer of 'fancy' pages
\if@twoside
    \fancyhf{}
    \fancyhead[LE,RO]{\titlestyle\thepage}
    \fancyhead[RE]{\titlestyle\nouppercase{\leftmark}}
    \fancyhead[LO]{\titlestyle\nouppercase{\rightmark}}
    \RequirePackage{emptypage} % Remove header and footer on empty pages
\else
    \fancyhf{}
    \fancyhead[R]{\titlestyle\thepage}
    \fancyhead[L]{\titlestyle\nouppercase{\rightmark}}
\fi

\pagestyle{fancy} 


%% Epigraph to add a quote to the beginngin of chapters
\newcommand\epigraph[3][2\baselineskip]{%
    \begin{flushright}%
        {\rmfamily\itshape #2}%
        \vskip 0.5\baselineskip%
        #3%
    \end{flushright}%
    \vspace{#1}%
}



%% Table of contents
%% ---------------------------------------------------------------
\RequirePackage{titletoc}
\setcounter{tocdepth}{1}

\titlecontents{part}
    [0em]
    {\vspace{1.0\baselineskip}\large\bfseries}
    {\contentslabel{0em}}{\hspace*{0em}}
    {\titlerule*[0pc]{.}\contentspage}[]
\titlecontents{chapter}
    [2.5em]
    {\vspace{0.5\baselineskip}\bfseries}
    {\contentslabel{1.5em}}{\hspace*{-2.5em}}
    {\titlerule*[0pc]{.}\contentspage}[]
\titlecontents{section}
    [3.8em]
    {}
    {\contentslabel{2.3em}}{\hspace*{-2.3em}}
    {\titlerule*[8pt]{.}\contentspage}[]




%% Cross-references
%% ---------------------------------------------------------------
\RequirePackage{hyperref}
\hypersetup{
	linktoc=all,
	hidelinks
}



%% Bibliography
%% ---------------------------------------------------------------
\RequirePackage[
    backend=biber,
    style=numeric-comp,
    sorting=none,
    giveninits=true,
    minbibnames=3, 
]{biblatex}
