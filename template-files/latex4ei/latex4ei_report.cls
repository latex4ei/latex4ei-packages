%
% Report class from LaTeX4EI		
%
% Authors: Emanuel Regnath, Martin Zellner
% Contact: info@latex4ei.de
% Version: 1.0
% License: TBD
% 
% © 2011-2015, LaTeX4EI

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{latex4ei_report}[2015/03/15]


% ======================================================================
% Options
% ======================================================================

	% forward options to latex4ei package
	\DeclareOption{color}{\PassOptionsToPackage{color}{latex4ei/latex4ei}}
	\DeclareOption{nocolor}{\PassOptionsToPackage{nocolor}{latex4ei/latex4ei}}

	% define baseclass
	\def\baseclass{scrartcl}

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

	% load latex4ei packages
	\RequirePackage{latex4ei/scientific}  		% scientific macros for LaTeX4EI
	\RequirePackage{latex4ei/latex4ei}  			% base definitions for LaTeX4EI (privat)


	\RequirePackage{abstract}
	


% ======================================================================
% Color Scheme
% ======================================================================

	% Set Color Scheme
	% ----------------------------------------------------------------------
	\definecolor{url}{gray}{0.6}


% ======================================================================
% Fonts
% ======================================================================

	% Font Settings
	% ----------------------------------------------------------------------

	% font
	%\RequirePackage[osf]{mathpazo}			% old style numbering
	\renewcommand{\rmdefault}{ppl}			% cmr, ptm, ppl, pnc, pbk
	%\renewcommand{\sfdefault}{cmss}		% cmss, phv pag


	\shorthandoff{"} 					% don't convert "A to Ä!	


	% calculate linespacing based on font size 
	% char per line: 85
	\RequirePackage{setspace}
	\linespread{1.3}\selectfont

	%\usepackage{microtype}					% Verbesserung des Kernings, Achtung kompilezeit!



% ======================================================================
% Title
% ======================================================================
	\newcommand*{\@chair}{}
	\newcommand*{\chair}[1]{\gdef\@chair{#1}}

	\newcommand*{\@university}{}
	\newcommand*{\university}[1]{\gdef\@university{#1}}

	\newcommand*{\@professor}{}
	\newcommand*{\professor}[1]{\gdef\@professor{#1}}

	\newcommand*{\@supervisors}{}
	\newcommand*{\supervisors}[1]{\gdef\@supervisors{#1}}

	\newcommand*{\@startdate}{}
	\newcommand*{\startdate}[1]{\gdef\@startdate{#1}}

	\newcommand*{\@finaldate}{}
	\newcommand*{\finaldate}[1]{\gdef\@finaldate{#1}}

	\newcommand*{\@matrikelnr}{}
	\newcommand*{\matrikelnr}[1]{\gdef\@matrikelnr{#1}}

	\newcommand*{\@studentemail}{}
	\newcommand*{\studentemail}[1]{\gdef\@studentemail{#1}}


	\def\maketitle{%
	\begin{centering}
	\vspace{1cm}
	\begin{huge}
		\textbf{\sffamily\@title}
	\end{huge}\\[2em]
	{\large \@author} \\[1em]
	Registration no. \@matrikelnr \\
	E-mail: \email{\@studentemail} \\[2em]
	\end{centering}
	\thispagestyle{empty}
	}



% ======================================================================
% Layout
% ======================================================================

	% Page Layout
	% ----------------------------------------------------------------------

		\RequirePackage{geometry}
		\geometry{hmargin=2.5cm, top=3cm, bottom=3.2cm}


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


	% Sections
	% ----------------------------------------------------------------------

		\RequirePackage{titlesec}
		%\titleformat{ command }[ shape ]{ format }{ label }{ sep }{ before }[ after ]
		%\titlespacing*{ command }{ left }{ beforesep }{ aftersep }[ right ]


		\titleformat{\section}{\sf\bfseries\LARGE\color{col_section}}{\thesection.\ }{0em}{}
		\titleformat{\subsection}{\sf\bfseries\Large\color{col_subsection}}{\thesubsection.\ }{0em}{}
		\titleformat{\subsubsection}{\scshape\large\color{col_subsubsection}}{\thesubsubsection.\ }{0em}{}




% ======================================================================
% Lists & Equations
% ======================================================================

	%\setlength{\itemsep}{\baselineskip}
	\setlength{\itemsep}{0pt}

	\RequirePackage{enumitem}
	\setitemize{itemsep=0pt}
	\setenumerate{itemsep=0pt}


% ======================================================================
% Float Environments
% ======================================================================

	\RequirePackage{caption}
	% Idea: short caption (for LOF) in bold, rest of caption as normal text

	% Figures
	% ----------------------------------------------------------------------

		\RequirePackage{graphicx}				% for different input formats
		\RequirePackage{pdfpages}
		%\RequirePackage{media9}				% for flash and 3D Objects
		\RequirePackage[sf,SF]{subfigure}		% Subfigures, sans-serif counters

		\makeatletter
		\renewcommand\p@subfigure{\thefigure}
		\renewcommand{\thefigure}{\@arabic\c@figure}	
		\renewcommand{\thesubfigure}{\alph{subfigure})}
		\makeatother


		\captionsetup[figure]{labelfont={color=col_figure,sf},textfont={sf,small}}


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
		\renewcommand*{\backref}[1]{(cited on p. #1)}

% Sourcecode listings
% ----------------------------------------------------------------------
	\RequirePackage{listings}
	\lstset{
	    basicstyle=\normalsize\tt\lst@ifdisplaystyle\small\fi,
	    tabsize=4,
	    %gobble=auto,				% skip initial tabs %not supported yet
	    numbers=none,				% switch numbers on: left
	    numberstyle=\tiny\sf\color{col_lst_number},
	    numbersep=1em,
	    keepspaces=true,
	    keywordstyle=\color{tum_blue_dark},
	    commentstyle=\color{col_lst_comment},
	    stringstyle=\color{col_lst_string},
	    captionpos = t,
	    frame = tb,
	    %framextopmargin={\smallskipamount},
	    %framexbottommargin={\smallskipamount},
	    framerule=1pt,
	    rulecolor = \color{col_lst},
	}
	\captionsetup[lstlisting]{labelfont={color=col_figure,sf},textfont={sf,small}}

	% Inline code listings
	\let\code\lstinline

\endinput
