% awesomeCV.cls - A modern and professional CV/resume LaTeX class
% Author: Giuseppe Minardi
% Version: 2.0
% Description: This class provides a clean and customizable template for creating
% professional CVs and resumes with support for publications and modern styling.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{awesomeCV}[2020/09/22 Example LaTeX class]

\LoadClass{article}

% Base class
\RequirePackage{calc} 
\RequirePackage{graphicx} 
\RequirePackage{fancyhdr}
\RequirePackage[a4paper, left=10mm, right=10mm, top=10mm, bottom=10mm]{geometry}
\RequirePackage{microtype}
\RequirePackage[
    backend=biber,
    style=numeric, 
    sorting=ydnt, 
    maxbibnames=99, 
    giveninits=true, 
    uniquename=init
]{biblatex}

% Bibliography formatting
\DeclareNameAlias{sortname}{family-given}
\DeclareFieldFormat{labelnumber}{\textcolor{cvdurationcolor}{[#1]}}
\renewcommand*{\newunitpunct}{\addperiod\space}
\renewbibmacro{in:}{}
\renewcommand*{\bibfont}{\small}

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

% colours
\RequirePackage{xcolor}
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

%\color{cvmaincolor}




% margin and column widths
% ------------------------

% width of the gap between left and right column
\newlength{\cvcolumngapwidth}
\setlength{\cvcolumngapwidth}{3mm}

% left column width
\newlength{\cvleftcolumnwidth}
\setlength{\cvleftcolumnwidth}{25mm}

% right column width
\newlength{\cvrightcolumnwidth}
\setlength{\cvrightcolumnwidth}{\textwidth-\cvleftcolumnwidth-\cvcolumngapwidth}

% set paragraph indentation to 0, because it screws up the whole layout otherwise
\setlength{\parindent}{0mm}

% styles
\newcommand{\cvnamestyle}[1]{{\Huge\color{cvnamecolor}{#1}}}
\newcommand{\cvsectionstyle}[1]{{\large\bfseries\textcolor{cvsectioncolor}{#1}}}
\newcommand{\cvtitlestyle}[1]{{\large\bfseries\textcolor{cvtitlecolor}{#1}}}
\newcommand{\cvorganizationstyle}[1]{{\scshape #1}}
\newcommand{\cvdurationstyle}[1]{{\small\textcolor{cvdurationcolor}{#1}}}
\newcommand{\cvheadingstyle}[1]{{\normalsize\textcolor{cvheadingcolor}{#1}}}
\newcommand{\cvpublicationstyle}[1]{{\normalsize\textcolor{cvpublicationcolor}{#1}}}


% inter-item spacing
% ------------------

% vertical space after personal info and standard CV items
\newlength{\cvafteritemskipamount}
\setlength{\cvafteritemskipamount}{2mm plus 1.25mm minus 1.25mm}

% vertical space after sections
\newlength{\cvaftersectionskipamount}
\setlength{\cvaftersectionskipamount}{2.5mm plus 0.5mm minus 0.5mm}

% extra vertical space to be used when a section starts with an item with a heading (e.g. in the skills section),
% so that the heading does not follow the section name too closely
\newlength{\cvbetweensectionandheadingextraskipamount}
\setlength{\cvbetweensectionandheadingextraskipamount}{1mm plus 0.25mm minus 0.25mm}


% intra-item spacing
% ------------------

% vertical space after name
\newlength{\cvafternameskipamount}
\setlength{\cvafternameskipamount}{1mm plus 0.75mm minus 0.75mm}

% vertical space after personal info lines
\newlength{\cvafterpersonalinfolineskipamount}
\setlength{\cvafterpersonalinfolineskipamount}{1mm plus 0.5mm minus 0.5mm}

% vertical space after titles
\newlength{\cvaftertitleskipamount}
\setlength{\cvaftertitleskipamount}{1.5mm plus 0.25mm minus 0.25mm}

% value to be used as parskip in right column of CV items and itemsep in lists (same for both, for consistency)
\newlength{\cvparskip}
\setlength{\cvparskip}{0.5mm plus 0.125mm minus 0.125mm}

% set global list configuration (use parskip as itemsep, and no separation otherwise)
\RequirePackage{enumitem}
\setlist{parsep=0mm, topsep=0mm, partopsep=0mm, itemsep=\cvparskip}


% CV commands
% --------------------------------------------------------------------------------------------------

% creates a "personal info" CV item with the given left and right column contents, with appropriate vertical space after
\newcommand{\cvpersonalinfo}[2]{
    % left and right column
    \begin{minipage}[t]{35mm}
        \vspace{0mm}                                                            % XXX hack to align to top, see https://tex.stackexchange.com/a/11632
        \raggedleft \cvnamestyle{#1}
    \end{minipage}                                                              % XXX necessary comment to avoid unwanted space
    \hspace{\cvcolumngapwidth}                                                  % XXX necessary comment to avoid unwanted space
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \vspace{0mm}                                                            % XXX hack to align to top, see https://tex.stackexchange.com/a/11632
        #2
    \end{minipage}


    \vspace{\cvafteritemskipamount}
}

% typesets a title, with appropriate vertical space after
% @param #1 title text

\newcommand{\cvtitle}[1]{
    \cvtitlestyle{#1}
}

% Section command with horizontal rule
\newcommand{\cvsection}[1]{
    % left and right column
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft\cvsectionstyle{#1}
    \end{minipage}                                                              % XXX necessary comment to avoid unwanted space
    \hspace{\cvcolumngapwidth}% XXX necessary comment to avoid unwanted space
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \textcolor{cvrulecolor}{\rule{\cvrightcolumnwidth}{0.3mm}}
    \end{minipage}

    % space after
    \vspace{\cvaftersectionskipamount}
}

                                                                                % @param #2 right column content
% Standard CV item with duration, title, organization, and description
\newcommand{\cvitem}[4]{
    % left and right column
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft \cvdurationstyle{ #1 }


    \end{minipage}% XXX necessary comment to avoid unwanted space
    \hspace{\cvcolumngapwidth}% XXX necessary comment to avoid unwanted space
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \setlength{\parskip}{\cvparskip}

        \cvtitle{#2} --
        \cvorganizationstyle{#3}

        \small{#4}
    \end{minipage}

    % space after
    \vspace{\cvafteritemskipamount}
}

\newcommand{\cvslimitem}[3]{
    % left and right column
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft \cvdurationstyle{#1}



    \end{minipage}% XXX necessary comment to avoid unwanted space
    \hspace{\cvcolumngapwidth}% XXX necessary comment to avoid unwanted space
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \setlength{\parskip}{\cvparskip}

        \cvtitlestyle{#2}: \small{#3}
    \end{minipage}

    % space after
    \vspace{\cvafteritemskipamount}
}

\newcommand{\cvsimpleitem}[2]{
    % left and right column
    \begin{minipage}[t]{\cvleftcolumnwidth}
        \raggedleft \cvdurationstyle{ #1 }

    \end{minipage}% XXX necessary comment to avoid unwanted space
    \hspace{\cvcolumngapwidth}% XXX necessary comment to avoid unwanted space
    \begin{minipage}[t]{\cvrightcolumnwidth}
        \setlength{\parskip}{\cvparskip} \small{#2}
    \end{minipage}

    % space after
    \vspace{\cvafteritemskipamount}
}

% New publication commands
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
