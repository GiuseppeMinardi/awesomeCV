\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{awesomeCV}[2020/09/22 Example LaTeX class]

\LoadClass{article}

\RequirePackage{calc} 
\RequirePackage{graphicx} 
% for easier length calculations (infix notation)
\RequirePackage{fancyhdr}                                                       % for setting header and footer
\RequirePackage[a4paper, left=10mm, right=10mm, top=10mm, bottom=10mm]{geometry}  % for setting margins (\newgeometry)
\RequirePackage{microtype}                                                      % for microtypography stuff

%URL

\RequirePackage[colorlinks, linkcolor = black, citecolor = black, urlcolor  = black]{hyperref}


% font families
%\defaultfontfeatures{Ligatures=TeX} % reportedly a good idea, see https://tex.stackexchange.com/a/37251

% colours
\RequirePackage{xcolor}                                                         % for colours
\definecolor{cvnamecolor}{HTML}{D64933}
\definecolor{cvsectioncolor}{HTML}{1A659E}
\definecolor{cvtitlecolor}{HTML}{191D32}
\definecolor{cvrulecolor}{HTML}{898980}
\definecolor{cvdurationcolor}{HTML}{898980}
\definecolor{cvheadingcolor}{RGB}{0,0,0}
\definecolor{cvmaincolor}{RGB}{0,0,0}

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
\newcommand{\cvnamestyle}[1]{{\Large\color{cvnamecolor}{#1}}}
\newcommand{\cvsectionstyle}[1]{{\large\bfseries\textcolor{cvsectioncolor}{#1}}}
\newcommand{\cvtitlestyle}[1]{{\large\bfseries\textcolor{cvtitlecolor}{#1}}}
\newcommand{\cvorganizationstyle}[1]{{\scshape #1}}
\newcommand{\cvdurationstyle}[1]{{\small\textcolor{cvdurationcolor}{#1}}}
\newcommand{\cvheadingstyle}[1]{{\normalsize\textcolor{cvheadingcolor}{#1}}}


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
    \begin{minipage}[t]{\cvleftcolumnwidth}
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
    % title
    \cvtitlestyle{#1}
    % space after
    %\vspace{\cvaftertitleskipamount}
    % XXX need to subtract cvparskip here, because it is automatically inserted after the title "paragraph"
    %\vspace{-\cvparskip}
}

                                                                                % creates a "section" CV item with the given left column content,
                                                                                % a horizontal rule in the right column, and with
                                                                                % appropriate vertical space after
                                                                                % @param #1 left column content (should be the section name)
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

                                                                                % creates a standard, multi-purpose CV item with the given left and right column contents,
                                                                                % parskip set to cvparskip
                                                                                % in the right column, and with appropriate vertical space after
                                                                                % @param #1 left column content
                                                                                % @param #2 right column content
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
\pagestyle{empty}
