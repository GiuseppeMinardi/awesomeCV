# Usage Guide

## Basic Structure

The CV template provides several commands to create a professional-looking CV. Here's how to use them:

## Commands Reference

### Publications

```latex
% In preamble
\usepackage[backend=biber, style=numeric, sorting=ydnt]{biblatex}
\addbibresource{your-publications.bib}

% In document
\cvsection{Publications}
\cvpublications{*}  % Show all publications
% Or \cvpublications{key1,key2}  % Show specific publications
```

The publications feature provides:
- Clean integration of BibTeX/BibLaTeX entries
- Automatic formatting with:
  - Colored and linked titles
  - Italicized journal/conference names
  - Bold volume numbers
  - Clickable DOI links
  - Year-based reverse chronological sorting
- Supports multiple entry types:
  - article: For journal publications
  - inproceedings: For conference papers

Example BibTeX entry:
```bibtex
@article{key2023example,
    title={Your Paper Title},
    author={Last, First and Other, Author},
    journal={Journal Name},
    volume={42},
    number={7},
    pages={123--145},
    year={2023},
    doi={10.1234/example}
}
```

### Personal Information

```latex
\cvpersonalinfo{Name}{Content}
```

Creates the header section with your name and contact information. The content parameter typically uses a tabular environment for layout.

### Sections

```latex
\cvsection{Section Name}
```

Creates a new section with a horizontal rule.

### Items

1. Standard Item (for work experience, education, etc.)

```latex
\cvitem{Duration}{Title}{Organization}{Description}
```

- Duration: Time period (e.g., "2020-Present")
- Title: Position or role
- Organization: Company/institution name
- Description: Detailed information (can include itemize environments)

2. Simple Item (for skills, languages, etc.)

```latex
\cvsimpleitem{Category}{Content}
```

- Category: Type of skill/attribute
- Content: Description or list

3. Slim Item (for brief entries)

```latex
\cvslimitem{Duration}{Title}{Description}
```

More compact version of cvitem.

## Customization

### Colors

The template defines several colors that can be customized:

```latex
\definecolor{cvnamecolor}{HTML}{D64933}      % Name color
\definecolor{cvsectioncolor}{HTML}{1A659E}   % Section headings
\definecolor{cvtitlecolor}{HTML}{191D32}     % Title color
\definecolor{cvrulecolor}{HTML}{898980}      % Horizontal rules
\definecolor{cvdurationcolor}{HTML}{898980}  % Duration text
```

### Spacing

Adjust spacing using these length commands:

```latex
\setlength{\cvcolumngapwidth}{3mm}           % Gap between columns
\setlength{\cvleftcolumnwidth}{25mm}         % Left column width
\setlength{\cvafteritemskipamount}{2mm}      % Space after items
\setlength{\cvaftersectionskipamount}{2.5mm} % Space after sections
```

## Examples

### Basic Section

```latex
\cvsection{Work Experience}
\cvitem{2020-Present}{Software Engineer}{Tech Company}{
\begin{itemize}
\item Developed feature X that improved performance by Y%
\item Led team of Z developers on project A
\end{itemize}}
```

### Skills Section

```latex
\cvsection{Skills}
\cvsimpleitem{Programming}{Python, Java, C++}
\cvsimpleitem{Languages}{English (Native), Spanish (Fluent)}
```

### Education Section

```latex
\cvsection{Education}
\cvitem{2016-2020}{BSc Computer Science}{University Name}{
First Class Honours, Thesis: "Title"}
```

## Tips

1. Keep descriptions concise and impactful
2. Use quantifiable achievements where possible
3. Maintain consistent formatting throughout
4. Use itemize environments for detailed descriptions
5. Balance white space for readability

## Best Practices

1. **Content Organization**:
   - Put most relevant/recent information first
   - Group similar experiences together
   - Use consistent date formats

2. **Formatting**:
   - Don't overcrowd sections
   - Use bullet points for clarity
   - Keep font sizes consistent

3. **Description Writing**:
   - Start with action verbs
   - Include measurable achievements
   - Be specific but concise

For more examples, check the `examples` directory in the repository.
