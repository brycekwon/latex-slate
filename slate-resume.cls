\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slate-resume}[2026/04/17 Single-column document class for resumes and CVs]

\newif\ifslate@defaultfont
\slate@defaultfonttrue
\newif\ifslate@colorlinks
\slate@colorlinkstrue

\DeclareOption{nofont}{\slate@defaultfontfalse}
\DeclareOption{nocolorlinks}{\slate@colorlinksfalse}

\PassOptionsToClass{letterpaper,11pt}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\RequirePackage{slate}

\titleformat{\section}%
  {\Large\bfseries\scshape\color{slateheading}}%
  {}{0pt}{}%
  [\vspace{-15pt}{\color{slaterule}\rule{\textwidth}{0.75pt}}]
\titlespacing*{\section}{0pt}{5pt}{5pt}

\let\slate@oldsection\section
\renewcommand{\section}[1]{%
  \needspace{6\baselineskip}\slate@oldsection{#1}%
}

\setlist[itemize]{leftmargin=13pt, itemsep=0pt, parsep=0pt, topsep=0pt}

\newcommand*{\entrygap}{\vspace*{5pt}}

\newenvironment{entryblock}%
  {\needspace{3\baselineskip}\begin{minipage}[t]{\textwidth}}%
  {\end{minipage}\par}

\newcommand*{\educationentry}[3]{\textbf{#1}\hfill{#2}\par\textit{#3}\par}
\newcommand*{\experienceentry}[4]{\textbf{#1}\sep{#2}\sep{#3}\hfill{#4}}
\newcommand*{\projectentry}[3]{\textbf{#1}\sep{#2}\hfill\textit{#3}}
\newcommand*{\publicationentry}[3]{%
  \par\hangindent=13pt\hangafter=1 #1. \textbf{#2.} \textit{#3.}\par%
}
\newcommand*{\skillentry}[2]{\textbf{#1:} #2\par}

\endinput
