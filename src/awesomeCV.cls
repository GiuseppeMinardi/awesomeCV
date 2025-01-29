\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{awesomeCV}[2020/09/22 Example LaTeX class]

\LoadClass{article}

\RequirePackage{calc} 
\RequirePackage{graphicx} 
\RequirePackage{fancyhdr}
\RequirePackage[a4paper, left=10mm, right=10mm, top=10mm, bottom=10mm]{geometry}
\RequirePackage{microtype}
\RequirePackage[backend=biber, style=numeric, sorting=ydnt, maxbibnames=99, giveninits=true, uniquename=init]{biblatex}

% Bibliography formatting
\DeclareNameAlias{sortname}{family-given}
\DeclareFieldFormat{labelnumber}{\textcolor{cvdurationcolor}{[#1]}}
\renewcommand*{\newunitpunct}{\addperiod\space}
\renewbibmacro{in:}{}
\renewcommand*{\bibfont}{\small}

% Custom bibliography format
\newbibmacro{cvitem:leftcolumn}{%
  \printfield{year}%
}

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
\RequirePackage[colorlinks, linkcolor = black, citecolor = black, urlcolor = black]{hyperref}

% colours
\RequirePackage{xcolor}
\definecolor{cvnamecolor}{HTML}{D64933}
\definecolor{cvsectioncolor}{HTML}{1A659E}
\definecolor{cvtitlecolor}{HTML}{191D32}
\definecolor{cvrulecolor}{HTML}{898980}
\definecolor{cvdurationcolor}{HTML}{898980}
\definecolor{cvheadingcolor}{RGB}{0,0,0}
\definecolor{cvmaincolor}{RGB}{0,0,0}
\definecolor{cvpublicationcolor}{HTML}{1A659E}

% margin and column widths
\newlength{\cvcolumngapwidth}
\setlength{\cvcolumngapwidth}{3mm}

\newlength{\cvleftcolumnwidth}
\setlength{\cvleftcolumnwidth}{25mm}

\newlength{\cvrightcolumnwidth}
\setlength{\cvrightcolumnwidth}{\textwidth-\cvleftcolumnwidth-\cvcolumngapwidth}

\setlength{\parindent}{0mm}

% styles
\newcommand{\cvnamestyle}[1]{{\Large\color{cvnamecolor}{#1}}}
\newcommand{\cvsectionstyle}[1]{{\large\bfseries\textcolor{cvsectioncolor}{#1}}}
\newcommand{\cvtitlestyle}[1]{{\large\bfseries\textcolor{cvtitlecolor}{#1}}}
\newcommand{\cvorganizationstyle}[1]{{\scshape #1}}
\newcommand{\cvdurationstyle}[1]{{\small\textcolor{cvdurationcolor}{#1}}}
\newcommand{\cvheadingstyle}[1]{{\normalsize\textcolor{cvheadingcolor}{#1}}}
\newcommand{\cvpublicationstyle}[1]{{\normalsize\textcolor{cvpublicationcolor}{#1}}}

% spacing
\newlength{\cvafteritemskipamount}
\setlength{\cvafteritemskipamount}{2mm plus 1.25mm minus 1.25mm}

\newlength{\cvaftersectionskipamount}
\setlength{\cvaftersectionskipamount}{2.5mm plus 0.5mm minus 0.5mm}

\newlength{\cvbetweensectionandheadingextraskipamount}
\setlength{\cvbetweensectionandheadingextraskipamount}{1mm plus 0.25mm minus 0.25mm}

\newlength{\cvafternameskipamount}
\setlength{\cvafternameskipamount}{1mm plus 0.75mm minus 0.75mm}

\newlength{\cvafterpersonalinfolineskipamount}
\setlength{\cvafterpersonalinfolineskipamount}{1mm plus 0.5mm minus 0.5mm}

\newlength{\cvaftertitleskipamount}
\setlength{\cvaftertitleskipamount}{1.5mm plus 0.25mm minus 0.25mm}

\newlength{\cvparskip}
\setlength{\cvparskip}{0.5mm plus 0.125mm minus 0.125mm}

% list configuration
\RequirePackage{enumitem}
\setlist{parsep=0mm, topsep=0mm, partopsep=0mm, itemsep=\cvparskip}

% CV commands
\newcommand{\cvpersonalinfo}[2]{
    \begin{minipage}[t]{\cvleftcolumnwidth}
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

\newcommand{\cvtitle}[1]{
    \cvtitlestyle{#1}
}

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

\newcommand{\cvitem}[4]{
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft \cvdurationstyle{#1}
    \end{minipage}%
    \hspace{\cvcolumngapwidth}%
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \setlength{\parskip}{\cvparskip}
        \cvtitle{#2} --
        \cvorganizationstyle{#3}
        #4
    \end{minipage}
    \vspace{\cvafteritemskipamount}
}

\newcommand{\cvslimitem}[3]{
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft \cvdurationstyle{#1}
    \end{minipage}%
    \hspace{\cvcolumngapwidth}%
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \setlength{\parskip}{\cvparskip}
        \cvtitlestyle{#2}: #3
    \end{minipage}
    \vspace{\cvafteritemskipamount}
}

\newcommand{\cvsimpleitem}[2]{
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft \cvdurationstyle{#1}
    \end{minipage}%
    \hspace{\cvcolumngapwidth}%
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \setlength{\parskip}{\cvparskip} #2
    \end{minipage}
    \vspace{\cvafteritemskipamount}
}

% New publication commands
\newcommand{\cvpublications}[1]{
    \nocite{#1}
    \setlength{\bibhang}{0pt}
    \setlength{\bibitemsep}{\cvparskip}
    \defbibenvironment{bibliography}
        {\list{}
            {\setlength{\leftmargin}{0pt}
             \setlength{\itemindent}{0pt}
             \setlength{\parsep}{\cvparskip}}}
        {\endlist}
        {\item}
    \printbibliography[heading=none]
}

% Publication styling
\DeclareFieldFormat[article,inproceedings]{title}{\cvpublicationstyle{#1}}
\DeclareFieldFormat{pages}{pp. #1}
\DeclareFieldFormat{doi}{\newline\url{https://doi.org/#1}}
\DeclareFieldFormat[article]{volume}{\textbf{#1}}
\DeclareFieldFormat[article]{number}{(#1)}
\DeclareFieldFormat{booktitle}{\textit{#1}}
\DeclareFieldFormat{journal}{\textit{#1}}

% Customize bibliography string
\DefineBibliographyStrings{english}{
  in = {in},
  pages = {pp\adddot},
  page = {p\adddot}
}

\pagestyle{empty}
