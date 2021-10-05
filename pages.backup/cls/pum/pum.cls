\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pum}[2020/03/21 Custom lesson class]

\DeclareOption{algebra}{
    \newcommand{\subject}{--- А Л Г Е Б Р А ---}
    \newcommand{\darkcolortheme}{0,0,0.7}
    \newcommand{\lightcolortheme}{0.75,0.75,1}
    \newcommand{\taskname}{У П Р А Ж Н Е Н И Я}
}
\DeclareOption{geometry}{
    \newcommand{\subject}{--- Г Е О М Е Т Р И Я ---}
    \newcommand{\darkcolortheme}{0,0.5,0}
    \newcommand{\lightcolortheme}{0.5,1,0.5}
    \newcommand{\taskname}{З А Д А Ч И}
}
\DeclareOption{physics}{
    \newcommand{\subject}{--- Ф И З И К А ---}
    \newcommand{\darkcolortheme}{0.4,0,0}
    \newcommand{\lightcolortheme}{1,0.7,0.5}
    \newcommand{\taskname}{З А Д А Ч И}
}
\DeclareOption{a5paper}{
    \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{a4paper}{
    \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{twocolumn}{
    \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption*{
  \ClassWarning{pum}{Unknown option '\CurrentOption'}
}
\ExecuteOptions{a4paper}
\ProcessOptions\relax

\LoadClass{article}

\RequirePackage[T2A]{fontenc}
\RequirePackage[russian]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath,amssymb}

\renewcommand\le\leqslant
\renewcommand\ge\geqslant

\RequirePackage{multicol}
\RequirePackage{tikz}
\RequirePackage{icomma}

\RequirePackage{xcolor}
\definecolor{darkcolortheme}{rgb}{\darkcolortheme}
\definecolor{lightcolortheme}{rgb}{\lightcolortheme}

\RequirePackage[most]{tcolorbox}
\tcbset{colback=lightcolortheme,colframe=darkcolortheme}
\newenvironment{pumbox}[1]{%
\tcolorbox[
fonttitle=\bfseries,
title=#1]}%
{\endtcolorbox}
\newenvironment{pumbox2}[1]{%
\tcolorbox[
sidebyside,
fonttitle=\bfseries,
title=#1]}%
{\endtcolorbox}
%\newtcolorbox{pumbox}[1]{%
%blanker, breakable, oversize,
%borderline west={5pt}{-10pt}{lightcolortheme},
%before upper=\indent, parbox=false
%}%

\RequirePackage{enumitem}
\setlist[itemize]{nosep,label=\textcolor{lightcolortheme}{\textbullet}}
\setlist[enumerate]{nosep,label=\arabic*)}
\makeatletter
\AddEnumerateCounter{\asbuk}{\russian@alph}{щ}
\makeatother

\RequirePackage{pgfplots}
\pgfplotsset{compat=1.16}
\pgfplotsset{school/.append style={ytick distance=1, xtick distance=1, axis lines=middle, xlabel={$x$}, ylabel={$y$}, axis equal, grid=both, width=10cm, xmin=-10, xmax=10, ymin=-10, ymax=10, xlabel style={at={(ticklabel* cs:1)}, anchor=north west}, ylabel style={at={(ticklabel* cs:1)}, anchor=north west}},graphic/.style={mark=none,thick=8pt,samples=100}}

\setlength{\columnsep}{1cm}
\pagestyle{empty}

\RequirePackage{exsheets}
\DeclareInstance{exsheets-heading}{PUM}{default}{
  runin = true,
  attach = {
    main[l,vc]number[r,vc](-.333em,0pt) ;
    main[r,vc]points[l,vc](\linewidth+\marginparsep,0pt)
  },
  number-format = \color{lightcolortheme}
}
\SetupExSheets{
  headings = PUM,
  counter-format = se.qu.,
  counter-within = section,
  no-skip-below = true,
}

\RequirePackage{hyperref}
\hypersetup{
colorlinks=true,
urlcolor=darkcolortheme
}
\newcommand{\link}[2]{\textit{\href{#1}{#2}}}
\urlstyle{same}

\RequirePackage{titlesec}
\titleformat*{\subsubsection}{\centering\normalfont\bfseries}

\RequirePackage{indentfirst}
\RequirePackage[left=1cm, right=1cm, bottom=1cm, top=1cm]{geometry}
\everymath{\displaystyle}

\input{pstricks2pgf.tex}
\makeatletter
\renewcommand{\@oddhead}{
\begin{tikzpicture}[remember picture, overlay]
  \draw[darkcolortheme,thick,double,fill=lightcolortheme] (current page.north west) circle (1.4cm);
  \node[text=darkcolortheme,anchor=north west,font=\bf] (list) at (current page.north west) {\Huge\thesection};
  \node[text=darkcolortheme,anchor=north,font=\bf] at (current page.north) {\Huge\subject};
  \draw[fill=darkcolortheme] (current page.north east) -- ++(-2.5cm,0cm) -- ++(1cm,-0.9cm) -- ++(1.5cm,0cm) -- cycle;
%  \node[text=white,anchor=north east,text width=2cm,align=right,font=\bf] at (current page.north east) {\lessontime \makeatletter\@date\makeatother};
  \node[text=white,anchor=north east,text width=2cm,align=right,font=\bf] at (current page.north east) {\lessontime};
  \node[text=white,anchor=north east,text width=2cm,align=right,font=\bf] at ([yshift=-0.35cm]current page.north east) {\makeatletter\@date\makeatother};
  \node[text=darkcolortheme,anchor=north east,font=\bf] at ([yshift=-1cm]current page.north east) {\classtitle};
%  \node[anchor=south west, rotate=90] at (current page.south east) {\includegraphics[width=0.25\textwidth]{logo.png}};
  \node[anchor=south west, rotate=90] at (current page.south east) {\input{logo.tex}};
\end{tikzpicture}
}
\renewcommand{\@evenhead}{
\begin{tikzpicture}[remember picture, overlay]
  \draw[darkcolortheme,thick,double,fill=lightcolortheme] (current page.north west) circle (1.4cm);
  \node[text=darkcolortheme,anchor=north west,font=\bf] (list) at (current page.north west) {\Huge\thesection};
  \node[text=darkcolortheme,anchor=north,font=\bf] at (current page.north) {\Huge\subject};
  \draw[fill=darkcolortheme] (current page.north east) -- ++(-2.5cm,0cm) -- ++(1cm,-0.9cm) -- ++(1.5cm,0cm) -- cycle;
  \node[text=white,anchor=north east,text width=2cm,align=right,font=\bf] at (current page.north east) {\lessontime};
  \node[text=white,anchor=north east,text width=2cm,align=right,font=\bf] at ([yshift=-0.35cm]current page.north east) {\makeatletter\@date\makeatother};
  \node[text=darkcolortheme,anchor=north east,font=\bf] at ([yshift=-1cm]current page.north east) {\classtitle};
%  \node[anchor=south west, rotate=90] at (current page.south east) {\includegraphics[width=0.25\textwidth]{logo.png}};
  \node[anchor=south west, rotate=90] at (current page.south east) {\input{logo.tex}};
\end{tikzpicture}
}
\makeatother

\newcommand{\listnumber}[1]{\setcounter{section}{#1}}
\newcommand{\classname}[1]{\def \classtitle {#1}}
\newcommand{\lesson}[1]{\def \lessontime {#1}}
\newenvironment{exercises}[1]{%
\bigskip{\bf\color{darkcolortheme}\taskname}

#1
}

\newenvironment{repeating}[1]{%
\bigskip{\bf\color{darkcolortheme}П О В Т О Р Е Н И Е}

#1
}

\endinput
