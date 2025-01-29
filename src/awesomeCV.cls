% awesomeCV.cls - A modern and professional CV/resume LaTeX class
% Author: Giuseppe Minardi
% Version: 2.0
% Description: This class provides a clean and customizable template for creating
% professional CVs and resumes with support for publications and modern styling.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{awesomeCV}[2020/09/22 Example LaTeX class]

% Base class
\LoadClass{article}

% Required packages
\RequirePackage{calc}        % For length calculations
\RequirePackage{graphicx}    % For image handling
\RequirePackage{fancyhdr}    % For header and footer customization
\RequirePackage[a4paper, left=10mm, right=10mm, top=10mm, bottom=10mm]{geometry}  % Page layout
\RequirePackage{microtype}   % For typography improvements

% Bibliography setup with biblatex
\RequirePackage[
    backend=biber,           % Use biber backend
    style=numeric,           % Numeric citation style
    sorting=ydnt,           % Sort by year (descending)
    maxbibnames=99,         % Show all author names
    giveninits=true,        % Use initials for first names
    uniquename=init         % Disambiguate authors by initials
]{biblatex}

% Bibliography formatting customization
\DeclareNameAlias{sortname}{family-given}          % Author names in family-given order
\DeclareFieldFormat{labelnumber}{\textcolor{cvdurationcolor}{[#1]}}  % Citation number format
\renewcommand*{\newunitpunct}{\addperiod\space}    % Punctuation between units
\renewbibmacro{in:}{}                             % Remove 'in:' prefix
\renewcommand*{\bibfont}{\small}                  % Bibliography font size

% Custom bibliography format for year display
\newbibmacro{cvitem:leftcolumn}{%
  \printfield{year}%
}

% Article bibliography driver
\DeclareBibliographyDriver{article}{%
  \begin{minipage}[t]{\cvleftcolumnwidth}
    \raggedleft\cvdurationstyle{\usebibmacro{cvitem:leftcolumn}}
  \end{minipage}%
  \hspace{\cvcolumngapwidth}%
  \begin{minipage}[t]{\cvrightcolumnwidth}
    \usebibmacro{author/translator+others}%
    \setunit{\labelnamepunct}\newblock
    \usebibmacro{title}%
    \newunit\newblock
    \usebibmacro{journal}%
    \setunit*{\addspace}%
    \printfield{volume}%
    \setunit*{\addspace}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{pages}%
    \setunit{\addperiod\space}%
    \printfield{doi}%
  \end{minipage}%
  \vspace{\cvafteritemskipamount}%
}

% Conference proceedings bibliography driver
\DeclareBibliographyDriver{inproceedings}{%
  \begin{minipage}[t]{\cvleftcolumnwidth}
    \raggedleft\cvdurationstyle{\usebibmacro{cvitem:leftcolumn}}
  \end{minipage}%
  \hspace{\cvcolumngapwidth}%
  \begin{minipage}[t]{\cvrightcolumnwidth}
    \usebibmacro{author/translator+others}%
    \setunit{\labelnamepunct}\newblock
    \usebibmacro{title}%
    \newunit\newblock
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{pages}%
    \setunit{\addperiod\space}%
    \printfield{doi}%
  \end{minipage}%
  \vspace{\cvafteritemskipamount}%
}

% Hyperref setup for links
\RequirePackage[colorlinks, linkcolor = black, citecolor = black, urlcolor = black]{hyperref}

% Color definitions
\RequirePackage{xcolor}
\definecolor{cvnamecolor}{HTML}{2B6CB0}         % Professional blue for name
\definecolor{cvsectioncolor}{HTML}{4A5568}      % Dark gray for sections
\definecolor{cvtitlecolor}{HTML}{1A365D}        % Deep navy for titles
\definecolor{cvrulecolor}{HTML}{718096}         % Medium gray for rules
\definecolor{cvdurationcolor}{HTML}{718096}     % Medium gray for dates
\definecolor{cvheadingcolor}{RGB}{0,0,0}        % Black for headings
\definecolor{cvmaincolor}{RGB}{0,0,0}           % Black for main text
\definecolor{cvpublicationcolor}{HTML}{2B6CB0}  % Professional blue for publications

% Layout dimensions
\newlength{\cvcolumngapwidth}
\setlength{\cvcolumngapwidth}{3mm}              % Gap between columns

\newlength{\cvleftcolumnwidth}
\setlength{\cvleftcolumnwidth}{25mm}            % Left column width

\newlength{\cvrightcolumnwidth}                 % Right column width (calculated)
\setlength{\cvrightcolumnwidth}{\textwidth-\cvleftcolumnwidth-\cvcolumngapwidth}

\setlength{\parindent}{0mm}                     % No paragraph indentation

% Text style definitions
\newcommand{\cvnamestyle}[1]{{\Huge\color{cvnamecolor}{#1}}}
\newcommand{\cvsectionstyle}[1]{{\large\bfseries\textcolor{cvsectioncolor}{#1}}}
\newcommand{\cvtitlestyle}[1]{{\large\bfseries\textcolor{cvtitlecolor}{#1}}}
\newcommand{\cvorganizationstyle}[1]{{\scshape #1}}
\newcommand{\cvdurationstyle}[1]{{\small\textcolor{cvdurationcolor}{#1}}}
\newcommand{\cvheadingstyle}[1]{{\normalsize\textcolor{cvheadingcolor}{#1}}}
\newcommand{\cvpublicationstyle}[1]{{\normalsize\textcolor{cvpublicationcolor}{#1}}}

% Spacing definitions
\newlength{\cvafteritemskipamount}              % Space after CV items
\setlength{\cvafteritemskipamount}{4mm plus 2mm minus 2mm}

\newlength{\cvaftersectionskipamount}           % Space after sections
\setlength{\cvaftersectionskipamount}{5mm plus 1mm minus 1mm}

\newlength{\cvbetweensectionandheadingextraskipamount}  % Extra space for sections with headings
\setlength{\cvbetweensectionandheadingextraskipamount}{1mm plus 0.25mm minus 0.25mm}

\newlength{\cvafternameskipamount}              % Space after name
\setlength{\cvafternameskipamount}{1mm plus 0.75mm minus 0.75mm}

\newlength{\cvafterpersonalinfolineskipamount}  % Space after personal info lines
\setlength{\cvafterpersonalinfolineskipamount}{1mm plus 0.5mm minus 0.5mm}

\newlength{\cvaftertitleskipamount}             % Space after titles
\setlength{\cvaftertitleskipamount}{1.5mm plus 0.25mm minus 0.25mm}

\newlength{\cvparskip}                          % Paragraph skip amount
\setlength{\cvparskip}{1mm plus 0.25mm minus 0.25mm}

% List configuration
\RequirePackage{enumitem}
\setlist{parsep=0mm, topsep=0mm, partopsep=0mm, itemsep=\cvparskip}

% CV commands
% Personal info section with name and details
\newcommand{\cvpersonalinfo}[2]{
    \begin{minipage}[t]{35mm}
        \vspace{0mm}
        \raggedleft \cvnamestyle{#1}
    \end{minipage}%
    \hspace{\cvcolumngapwidth}%
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \vspace{0mm}
        #2
    \end{minipage}
    \vspace{\cvafteritemskipamount}
}

% Title command for CV entries
\newcommand{\cvtitle}[1]{
    \cvtitlestyle{#1}
}

% Section command with horizontal rule
\newcommand{\cvsection}[1]{
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft\cvsectionstyle{#1}
    \end{minipage}%
    \hspace{\cvcolumngapwidth}%
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \textcolor{cvrulecolor}{\rule{\cvrightcolumnwidth}{0.3mm}}
    \end{minipage}
    \vspace{\cvaftersectionskipamount}
}

% Standard CV item with duration, title, organization, and description
\newcommand{\cvitem}[4]{
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft \cvdurationstyle{#1}
    \end{minipage}%
    \hspace{\cvcolumngapwidth}%
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \setlength{\parskip}{\cvparskip}
        \cvtitle{#2} --
        \cvorganizationstyle{#3}
        \small{#4}
    \end{minipage}
    \vspace{\cvafteritemskipamount}
}

% Slim CV item for shorter entries
\newcommand{\cvslimitem}[3]{
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft \cvdurationstyle{#1}
    \end{minipage}%
    \hspace{\cvcolumngapwidth}%
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \setlength{\parskip}{\cvparskip}
        \cvtitlestyle{#2}: \small{#3}
    \end{minipage}
    \vspace{\cvafteritemskipamount}
}

% Simple CV item for basic entries
\newcommand{\cvsimpleitem}[2]{
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft \cvdurationstyle{#1}
    \end{minipage}%
    \hspace{\cvcolumngapwidth}%
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \setlength{\parskip}{\cvparskip} \small{#2}
    \end{minipage}
    \vspace{\cvafteritemskipamount}
}

% Publications section command
\newcommand{\cvpublications}[1]{
    \nocite{#1}
    \setlength{\bibhang}{0pt}
    \setlength{\bibitemsep}{\cvparskip}
    \setlength{\bibnamesep}{0pt}
    \setlength{\bibinitsep}{0pt}
    \defbibenvironment{bibliography}
        {\list{}
            {\setlength{\leftmargin}{0pt}
             \setlength{\itemindent}{0pt}
             \setlength{\parsep}{\cvparskip}
             \setlength{\itemsep}{\cvparskip}}}
        {\endlist}
        {\item}
    \printbibliography[heading=none]
}

% Publication field formatting
\DeclareFieldFormat[article,inproceedings]{title}{\cvpublicationstyle{#1}}
\DeclareFieldFormat{pages}{pp. #1}
\DeclareFieldFormat{doi}{\newline\url{https://doi.org/#1}}
\DeclareFieldFormat[article]{volume}{\textbf{#1}}
\DeclareFieldFormat[article]{number}{(#1)}
\DeclareFieldFormat{booktitle}{\textit{#1}}
\DeclareFieldFormat{journal}{\textit{#1}}

% Bibliography string customization
\DefineBibliographyStrings{english}{
  in = {in},
  pages = {pp\adddot},
  page = {p\adddot}
}

% Empty page style (no headers/footers)
\pagestyle{empty}
