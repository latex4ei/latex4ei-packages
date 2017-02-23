%
% Thesis class from LaTeX4EI		
%
% Authors: Emanuel Regnath, Martin Zellner
% Contact: info@latex4ei.de
% Version: 1.0
% License: TBD
% 
% © 2011-2015, LaTeX4EI


% ToDo:
% * create \listofabbreviations \listoflistings
% * Screen_version und print_version
% * create title page
% TUM Styleguide: Liniebasis 0.3pt Linie Pfeil 0.6pt

% options: frontmatter, colors, ornaments, margin


\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{latex4ei/latex4ei_thesis}[2014/03/15]


% ======================================================================
% Options
% ======================================================================

	% forward options to latex4ei package
	\DeclareOption{color}{\PassOptionsToPackage{color}{latex4ei}}
	\DeclareOption{nocolor}{\PassOptionsToPackage{nocolor}{latex4ei}}

	% define baseclass
	\def\baseclass{scrreprt}

	% Options 
	\newif\ifmarginnumbers\marginnumbersfalse
	\DeclareOption{marginnumbers}{\marginnumberstrue}

	\newcommand{\chapterallign}{\raggedright}
	\DeclareOption{rightchapter}{%
	\let\chapterallign\raggedleft
	}

	\newif\ifoptionbiblatex\optionbiblatexfalse
	\DeclareOption{biblatex}{\optionbiblatextrue}

	\newif\ifoptionglossaries\optionglossariesfalse
	\DeclareOption{glossaries}{\optionglossariestrue}

	% set default options for base class
	\PassOptionsToClass{a4paper, 11pt}{\baseclass}

	% pass unknown options to base class 
	\DeclareOption*{%
		\PassOptionsToClass{\CurrentOption}{\baseclass}%
	}

	% process options
	\ProcessOptions\relax

	% load baseclass
	\LoadClass{\baseclass}


% ======================================================================
% Packages
% ======================================================================

	% pass options to packages
	\PassOptionsToPackage{table}{xcolor}


	% load biblatex if specified
	\ifoptionbiblatex
		\RequirePackage[style=ieee, backend=biber, datamodel=ieeestandard]{biblatex}
	\fi

%	\makeatletter
%		\@ifpackagewith{biblatex}{backend=biber}{}
%	\makeatother



	% load latex4ei packages
	\RequirePackage{latex4ei/scientific}  		% scientific macros for LaTeX4EI
	\RequirePackage{latex4ei/latex4ei}  		% base definitions for LaTeX4EI (privat)


	% packages needed
	\RequirePackage{xspace}				% For spacing behind commands
	\RequirePackage{remreset}			% For removing counters from resets

	% fix for footnotes in tables
	\RequirePackage{footnote}
	\makesavenoteenv{tabular}
	\makesavenoteenv{table} 
	%\shorthandoff{"} 					% don't convert "A to Ä!
	
	
	% font
	%\RequirePackage[osf]{mathpazo}			% old style numbering
	%\renewcommand{\rmdefault}{ppl}				% cmr, ptm, ppl, pnc, pbk
	%\renewcommand{\sfdefault}{cmss}				% cmss, phv pag


% ======================================================================
% Color Scheme
% ======================================================================


	% Set Color Scheme
	% ----------------------------------------------------------------------
	\definecolor{url}{gray}{0.6}
	\definecolor{chapnum}{gray}{0.6}
	\definecolor{ornament}{gray}{0.85}

	%\definecolor{col_chapter}{gray}{0.6}
	\colorlet{col_chapter}{tum_gray}


	\colorlet{col_section}{tum_blue_dark2}
	\colorlet{col_subsection}{tum_blue_dark2}
	\colorlet{col_subsubsection}{tum_blue_dark2}
	\colorlet{col_table}{tum_blue_dark}
	\colorlet{col_figure}{tum_blue_dark}
	
	\colorlet{col_link}{tum_blue}

	\colorlet{col_lst}{tum_blue_dark}
	\colorlet{col_lst_keyword}{tum_blue}
	\colorlet{col_lst_comment}{tum_green_leaf}
	\colorlet{col_lst_string}{tum_orange}
	\colorlet{col_lst_number}{tum_gray_dark}

% ======================================================================
% Fonts
% ======================================================================

	% Font Settings
	% ----------------------------------------------------------------------

		% Initials with lettrine
		\RequirePackage{lettrine}


		% calculate linespacing based on font size 
		% char per line: 85
		\RequirePackage{setspace}
		% \setlength{\baselineskip}{3pt}
		% \renewcommand{\baselinestretch}{1.5}
		%\linespread{1.3}\selectfont
		%\setstretch{1.3}
		\onehalfspacing


		%\usepackage{microtype}					% Verbesserung des Kernings, Achtung kompilezeit!


% ======================================================================
% Bibtex
% ======================================================================

	% Define BibTeX command
	\def\BibTeX{{\rmfamily B\kern-.05em{\sc i\kern-.025em b}\kern-.08em T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}}


	%\usepackage{natbib}
	%\bibliographystyle{natdin} 


% ======================================================================
% Title
% ======================================================================

\newcommand*{\thedoctype}{}
\newcommand*{\doctype}[1]{\gdef\thedoctype{#1}}


% hierarchy:
% university, faculty, department, institute, chair


\newcommand*{\theuniversity}{}
\newcommand*{\university}[1]{\gdef\theuniversity{#1}}

\newcommand*{\thedepartment}{}
\newcommand*{\department}[1]{\gdef\thedepartment{#1}}

\newcommand*{\thechair}{}
\newcommand*{\chair}[1]{\gdef\thechair{#1}}

\newcommand*{\theprofessor}{}
\newcommand*{\professor}[1]{\gdef\theprofessor{#1}}

\newcommand*{\theadvisor}{}
\newcommand*{\advisor}[1]{\gdef\theadvisor{#1}}

\newcommand*{\thecoadvisor}{}
\newcommand*{\coadvisor}[1]{\gdef\thecoadvisor{#1}}

\newcommand*{\thesubmitdate}{}
\newcommand*{\submitdate}[1]{\gdef\thesubmitdate{#1}}

\newcommand*{\theauthorsaddress}{}
\newcommand*{\authorsaddress}[1]{\gdef\theauthorsaddress{#1}}

\newcommand*{\thestudentnumber}{}
\newcommand*{\studentnumber}[1]{\gdef\thestudentnumber{#1}}


\newcommand*{\thelogoheader}{}
\newcommand*{\logoheader}[1]{\gdef\thelogoheader{#1}}




\def\maketitle{{%
	\sffamily
	% ------------------------------------------------------------------------
	% Deckblatt
	% ------------------------------------------------------------------------
	\pagestyle{empty}
	\let\footnotesize\small\let\footnoterule\relax
	\thelogoheader
	\vspace*{8cm}
	\begin{center}\begin{minipage}[c]{0.8\textwidth}\begin{center}
	{\huge \bfseries{\@title} \par}%
	\vskip 3em%
	{\LARGE\@author}
	\end{center}\end{minipage}\end{center}
	\par
	\vfill
	\begin{center}{\LARGE \bfseries{\thedoctype}}\end{center}\par

	\cleardoublepage
	% ------------------------------------------------------------------------
	% Das ganze etwas genauer
	% ------------------------------------------------------------------------
	\vspace*{100pt}
	\begin{center}\begin{minipage}{0.7\textwidth}\centering%
	\vfil
	{\LARGE \bfseries{\@title} \par}%
	\vfil \vskip 2.5em
	{\Large \thedoctype \par}%
	\vfil
	\end{minipage}\end{center}\par
	\vfill \large
	\begin{center}%
	{{Supervised by \theprofessor \\ \thechair \\ \thedepartment \\ \theuniversity \\ }}
	\end{center}\par
	\vskip 1.5em
	\vfill
	\begin{tabular}{@{}l@{\hspace{1cm}}l}%
	\bfseries{Advisor} & \parbox[t]{9cm}{\theadvisor}\\[1.3em]
	\bfseries{Co-Advisor} &  \parbox[t]{9cm}{{\thecoadvisor}}\\[1.3em]
	\bfseries{Author} & \parbox[t]{9cm}{{\@author\\ \theauthorsaddress}} \\
	\end{tabular}\\[2em]
	Submitted on \thesubmitdate
}}



% ======================================================================
% Additional title pages
% --------------------------------------------------------------------
\newenvironment{acknowledgment}{%
  \clearpage
  \thispagestyle{empty}
  \@makeschapterhead{Acknowledgment}
  \sffamily
}{
}

\newenvironment{authordecl}{%
  \cleardoublepage
  \thispagestyle{empty}
  \@makeschapterhead{Declaration of Authorship}
  \sffamily
}{
}


% ======================================================================
% Abstract
% ======================================================================

\def\abstract{
  \clearpage
  \thispagestyle{plain}
  \@makeschapterhead{\abstractname}
  \sffamily
}{
}
\def\endabstract{
}

% ======================================================================
% Glossaries
% ======================================================================


	\ifoptionglossaries
		% Nomenclature with glossary, nomencl, acronym, acroterm
		\RequirePackage[toc, acronym, style=long, nolist, nomain, nopostdot, nogroupskip]{glossaries}


		\newglossarystyle{acronym}{%
			\renewenvironment{theglossary}{
				\setlength\LTleft{0pt}
				\setlength\LTright{0pt}
				\setlength{\glsdescwidth}{0.7\textwidth}
				\setlength{\extrarowheight}{0em}%
				\renewcommand*{\glossaryheader}{}% have nothing after \begin{theglossary}
				\renewcommand*{\glsgroupheading}[1]{}%
				\renewcommand*{\glsgroupskip}{}% have nothing between glossary groups		
				\begin{longtable}{@{}ll@{}}}{\end{longtable}}%
			\renewcommand*{\glossaryentryfield}[5]{%
				\textbf{\glstarget{##1}{##2}}% the entry name
				##4% the symbol 
				& ##3% the description
				\space\space ##5\\}% the number list
		}

		% darker color for glossary links
		\renewcommand*{\glstextformat}[1]{\textcolor{tum_blue_dark2}{#1}}
	\fi


% ======================================================================
% Structure
% ======================================================================

	\newcommand\frontmatter{%
		\setcounter{page}{1}		% set page counter to 1
		\pagenumbering{Roman}		% roman figures
		\loadgeometry{frontmatter}	% 	
		\pagestyle{empty}			% no numbering in the frontmatter
		\makeatletter
			\let\ps@oldplain\ps@plain	% backup
			\let\ps@plain\ps@empty		% set plain pagestyle to empty 
		\makeatother
	}

	\newcommand\mainmatter{%
		\pagenumbering{arabic}
		\loadgeometry{mainmatter}
		\pagestyle{fancy}
		\makeatletter
			\fancy@setoffs			% reload dimensions
		\makeatother
	}

	\newcommand\mainmatterplain{%
		\pagenumbering{arabic}
		\loadgeometry{mainmatterplain}
		\pagestyle{fancy}
		\makeatletter
			\fancy@setoffs			% reload dimensions
		\makeatother
	}

	\newcommand\backmatter{\pagenumbering{arabic}}


% ======================================================================
% Layout
% ======================================================================

	% Page Layout
	% ----------------------------------------------------------------------

		\RequirePackage{geometry}

		\newgeometry{
			layout=a4paper,			% DIN-A4
			twoside,
			bindingoffset = 1cm,
			left=2.66cm,		% whitespace left
			right=2.66cm,	% old 2.33
			top=3cm,
			bottom=3cm,
			includeheadfoot
		} \savegeometry{frontmatter}


		\geometry{ %Gemometry with Margintext
			layout=a4paper,
			portrait,
			twoside,
			bindingoffset = 1cm,
		    % 9er Teilung
			left=2.33cm,		% whitespace left
			right=3.66cm,
			top=2.33cm,
			bottom=2cm,
			%reversemarginpar,
			marginparsep = 4mm,
			marginparwidth = 1.9cm,		% witdh for marginal notes
			includeheadfoot				% reserve space for header and footer
		} \savegeometry{mainmatter}

		\geometry{ %Gemometry without Margintext
			layout=a4paper,
			portrait,
			% twoside,
			bindingoffset = 1cm,
		    % 9er Teilung
			left=2.33cm,		% whitespace left
			right=2.33cm,
			top=2.33cm,
			bottom=3cm,
			includeheadfoot				% reserve space for header and footer
		} \savegeometry{mainmatterplain}

	% Header and Footer
	% ----------------------------------------------------------------------

		\usepackage{fancyhdr}
		\pagestyle{fancy}									% use fancyhdr pagestyle
		\fancyhf{}											% clear header and footer
		\if@twoside %% Für Doppelseitig
			\fancyhead[EL]{\textcolor{black!70}{\thepage}}	% gerade Seiten, links
			\fancyhead[ER]{\textcolor{black!70}{\leftmark}}	% gerade Seiten, rechts
			\fancyhead[OL]{\textcolor{black!70}{\itshape\rightmark}}	% ungerade Seiten, links
			\fancyhead[OR]{\textcolor{black!70}{\thepage}}	% ungerade Seiten, rechts
		\else %% Für Einseitig
			\fancyhead[OL]{\textcolor{black!70}{\leftmark --- \itshape\nouppercase{\rightmark}}}	% gerade Seiten, rechts
			\fancyhead[OR]{\textcolor{black!70}{\thepage}}	% gerade Seiten, links
		\fi 
		\renewcommand{\headrulewidth}{0pt}    				% Underline headers
		\renewcommand{\footrulewidth}{0pt}    				% no footer rule
		%\fancypagestyle{plain}{}               % No chapter+section on chapter start pages


		\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{#1}}{} }	% redefine leftmark
		\renewcommand{\sectionmark}[1]{\markright{#1}{} }	% redefine rightmark

	% Margin Notes
	% ----------------------------------------------------------------------

		\def\mparsetup{%
		    \sffamily\scriptsize %
		    \linespread{0.9}\selectfont%
		    \parindent=0pt \lineskip=0pt \lineskiplimit=0pt %
		    \tolerance=2000 \hyphenpenalty=300 \exhyphenpenalty=300%
		    \doublehyphendemerits=100000%
		    \finalhyphendemerits=\doublehyphendemerits}

		\let\oldmarginpar\marginpar			% save old command

		\renewcommand{\marginpar}[1]{\oldmarginpar[\mparsetup\raggedleft\hspace{0pt}{#1}]{\mparsetup\raggedright\hspace{0pt}{#1}}}

	% Footnotes
	% ----------------------------------------------------------------------

		\long\def\@makefntext#1{%
		  \leftskip 0pt
		  \parindent 0pt
		  \everypar{\parindent 0pt}%
		  \leavevmode\llap{\@thefnmark\hskip\marginparsep}#1}	% footnote number in margin
		\renewcommand\footnoterule{%
		  \kern-3\p@
		  \hrule\@width \columnwidth
		  \kern2.6\p@}
		\skip\@mpfootins=4pt


	% Chapters and Sections
	% ----------------------------------------------------------------------

		\RequirePackage{titlesec}
		%\titleformat{ command }[ shape ]{ format }{ label }{ sep }{ before }[ after ]
		%\titlespacing*{ command }{ left }{ beforesep }{ aftersep }[ right ]


		\newfont{\chapterNumber}{eurb10 scaled 9000}

		%\titleformat{\chapter}[display]{\relax}{\raggedleft{\fontsize{100}{10}\selectfont\color{col_chapter}\thechapter} \\}{0em}{\raggedleft\sffamily\bfseries\huge}
		\titleformat{\chapter}[display]{\relax}{\chapterallign{\chapterNumber\color{col_chapter}\thechapter} \\}{0em}{\chapterallign\sffamily\bfseries\huge}
		%\titlespacing{\chapter}{0em}{0em}{2em}

		% star chapter version
		\titleformat{name=\chapter,numberless}[display]{\relax}{\relax}{0em}{\sffamily\bfseries\huge}
		\titlespacing{name=\chapter,numberless}{0em}{0em}{2em}

		% section with numbers in the margin
		\ifmarginnumbers
			\titleformat{\section}{\sffamily\Large\color{col_section}}{\llap{{\thesection}\hskip\marginparsep}}{0em}{}
			\titleformat{\subsection}{\sffamily\large\color{col_subsection}}{\llap{{\thesubsection}\hskip\marginparsep}}{0em}{}
			\titleformat{\subsubsection}{\scshape\color{col_subsubsection}}{\llap{{\thesubsubsection}\hskip\marginparsep}}{0em}{}
		\else
			\titleformat{\section}{\scshape\LARGE\color{col_section}}{\thesection\quad}{0em}{}
			\titleformat{\subsection}{\sffamily\Large\color{col_subsection}}{\thesubsection\quad}{0em}{}
			\titleformat{\subsubsection}{\scshape\color{col_subsubsection}}{\thesubsubsection\quad}{0em}{}
			\titleformat{\paragraph}[runin]{\sffamily\color{col_paragraph}}{\theparagraph\quad}{0em}{}
		\fi

		\titlespacing{name=\paragraph,numberless}{0em}{0.5em}{1em}[5em]
		\parskip = 0pt

		\let\oldsection\section
		\let\oldsubsection\subsection
		%\renewcommand{\section}[1]{\oldsection{#1}\label{sec:#1}}
		%\renewcommand{\subsection}[1]{\oldsubsection{#1}\label{sec:#1}}


		% for problems with the TOC: \renewcommand\contentsname{\normalfont Contents}
		% This way, your Table of Content’s title will stay untouched by any \titleformat command.

	% Epigraph
	% ----------------------------------------------------------------------
		\providecommand{\epigraph}[3][6cm]{
			{\vspace*{-1cm}\hfill\parbox{#1}{\linespread{1.1}\selectfont\itshape\small{#2}\\{\phantom{.}\hfill\upshape #3}\\[1em]}} }



	% Colophon
	% ----------------------------------------------------------------------
	\newenvironment{colophon}{\newpage\color{black!70}}{\newpage}


% ======================================================================
% Lists & Equations
% ======================================================================

	%\setlength{\itemsep}{\baselineskip}
	\setlength{\itemsep}{0pt}

	\RequirePackage{enumitem}
	\setitemize{itemsep=0pt}
	\setenumerate{itemsep=0pt}

	% set own list item symbol
	\renewcommand\labelitemi{\color{col_itemize}$\blacktriangleright$}

	% change description label
	\renewcommand{\descriptionlabel}[1]{\hspace{\labelsep}\color{col_paragraph}\textsf{#1}}
	\setlist[description]{leftmargin=4em,labelindent=1.5em}

	% Equations
	% ----------------------------------------------------------------------
	\RequirePackage{remreset}
	\makeatletter
	\@removefromreset{equation}{chapter}  					% nor reset of equation numbers, requires remreset package
	\def\@eqnnum{{\normalfont \textcolor{gray}{\theequation}}}   % diffrent equation number style
	\makeatother

	\AtBeginEnvironment{displaymath}{\displaystyle}


% ======================================================================
% Float Environments
% ======================================================================

	\RequirePackage{caption}
	% Idea: short caption (for LOF) in bold, rest of caption as normal text

	% Figures
	% ----------------------------------------------------------------------

		%\RequirePackage{pdfpages}
		%\RequirePackage{media9}				% for flash and 3D Objects
		\RequirePackage[sf,SF]{subfigure}		% Subfigures, sans-serif counters

		\makeatletter
		\@removefromreset{figure}{chapter}			% continous figure numbering
		\renewcommand\p@subfigure{\thefigure}
		\renewcommand{\thefigure}{\@arabic\c@figure}	
		\renewcommand{\thesubfigure}{\alph{subfigure})}
		\makeatother


		\captionsetup[figure]{labelfont={color=col_figure,sf},textfont={sf,small}}



	% Captions
	% ----------------------------------------------------------------------

		% \makeatletter
		%\let\x@caption\caption % original \caption
		%\def\x@@caption[#1]#2{\x@caption[{#1}]{#1 #2}} % with optional arg
		%\def\x@@@caption#1{\x@caption[{#1}]{#1}} % without optional arg
		%\def\caption{\@ifnextchar[\x@@caption\x@@@caption} % new \caption
		%\makeatother


% ======================================================================
% Macros
% ======================================================================

	% Names
	\providecommand{\name}[1]{\mbox{\textsc{#1}}}
	\providecommand{\Prof}{Prof.~}
	\providecommand{\Dr}{Dr.~}
	\providecommand{\DiplIng}{Dipl.-Ing.~}
	\providecommand{\MSc}{M.~Sc.~}
	\providecommand{\habil}{habil.~}
	\providecommand{\PD}{PD~}

	% Abbreviations
	%\newcommand{\cf}{cf.\@\xspace}
	\newcommand{\ea}{\& al.\@\xspace}
	\newcommand{\eg}{e.\,g.\@\xspace}
	\newcommand{\etc}{etc.\@\xspace}
	\renewcommand{\iff}{if and only if\xspace}
	\newcommand{\ie}{i.\,e.\@\xspace}
	\newcommand{\wrt}{with respect to\xspace}
	\newcommand{\wlg}{without loss of generality\xspace}
	\newcommand{\Wlg}{Without loss of generality\xspace}


% ======================================================================
% Others
% ======================================================================

	% References and Links
	% ----------------------------------------------------------------------

		\RequirePackage{hyperref}
		\hypersetup{
		        pdfcreator={LaTeX2e},
		        pdfborder=0 0 0,
		        breaklinks=true,
		        bookmarksopen=true,
		        bookmarksnumbered=true,
		        linkcolor=col_link,
		        urlcolor=col_link,
		        citecolor=col_link,
		        colorlinks=true
		}

		% backref style
		\ifdefined\backref
			\renewcommand*{\backref}[1]{cited on p. #1}
		\fi

% Sourcecode listings
% ----------------------------------------------------------------------
	\RequirePackage{listings}
	\def\postbreak{\raisebox{0ex}[0ex][0ex]{\ensuremath{\hookrightarrow\space}}}

	\lstset{
	    basicstyle=\normalsize\ttfamily\lst@ifdisplaystyle\linespread{0.85}\footnotesize\fi,
	    tabsize=4,
	    %gobble=auto,				% skip initial tabs %not supported yet
	    numbers=left,				% switch numbers on: left
	    numberstyle=\tiny\sffamily\color{col_lst_number},
	    numbersep=1em,
	    keepspaces=true,
	    breaklines=true, 
	    breakatwhitespace=true,
	    postbreak=\postbreak,
	    keywordstyle=\bfseries\color{tum_blue_dark},
	    commentstyle=\color{col_lst_comment},
	    stringstyle=\color{col_lst_string},
	    captionpos = t,
	    frame = tb,
	    framextopmargin={\smallskipamount},
	    framexbottommargin={\smallskipamount},
	    framerule=1pt,
	    rulecolor = \color{col_lst},
	}
	\captionsetup[lstlisting]{labelfont={color=col_figure,sf},textfont={sf,small}}

	% Inline code listings
	\let\code\lstinline


\endinput
