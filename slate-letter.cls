\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slate-letter}[2026/04/17 Single-column document class for cover letters]

\newif\ifslate@defaultfont
\slate@defaultfonttrue
\newif\ifslate@colorlinks
\slate@colorlinkstrue

\DeclareOption{nofont}{\slate@defaultfontfalse}
\DeclareOption{nocolorlinks}{\slate@colorlinksfalse}

\PassOptionsToClass{letterpaper,12pt}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\RequirePackage{slate}

\geometry{margin=1in}

\setlength{\parskip}{10pt plus 2pt minus 2pt}
\setlength{\parindent}{0pt}

\newcommand*{\letterdate}[1]{\vspace{20pt}#1\par}

\newcommand*{\recipient}[4]{%
  \begingroup
  \setlength{\parskip}{0pt}%
  #1\par
  #2\par
  #3\par
  #4\par
  \endgroup
}

\newcommand*{\opening}[1]{#1\par}

\newcommand*{\closing}[1]{\par\vspace{8pt}#1\par\vspace{16pt}}

\newcommand*{\signature}[1]{#1}

\endinput
