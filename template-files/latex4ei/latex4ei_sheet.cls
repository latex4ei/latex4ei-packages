%
% Layout, Macros for LaTeX4EI
%
% Authors: Emanuel Regnath, Martin Zellner
% Contact: info@latex4ei.de
% Version: 1.0
% License: CC-BY-NC-SA
%
% © 2011-2015, LaTeX4EI

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{latex4ei_sheet}[2014/03/30 Cheet Sheet Template from LaTeX4EI]

% ======================================================================
% Options
% ======================================================================

% forward options to latex4ei package
% ----------------------------------------------------------------------
	\newif\ifcolor\colortrue
	\DeclareOption{color}{\colortrue\PassOptionsToPackage{color}{latex4ei}}
	\DeclareOption{nocolor}{\colorfalse\PassOptionsToPackage{nocolor}{latex4ei}}
	\DeclareOption{german}{\colorfalse\PassOptionsToPackage{german}{latex4ei}}
	\DeclareOption{english}{\colorfalse\PassOptionsToPackage{english}{latex4ei}}


% make three column design possible
% ----------------------------------------------------------------------
	\newcounter{columnnumber}
	\setcounter{columnnumber}{4}
	\DeclareOption{threecolumn}{\setcounter{columnnumber}{3}}


% mobile version
% ----------------------------------------------------------------------
	\newif\ifmobile\mobilefalse
	\DeclareOption{mobile}{\mobiletrue\setcounter{columnnumber}{0}}


% defaults
% ----------------------------------------------------------------------
	% define baseclass
	\def\baseclass{scrartcl}

	% set default options for base class
	\PassOptionsToClass{6pt, a4paper, landscape}{\baseclass}

% forward unknown options to class
% ----------------------------------------------------------------------
	\DeclareOption*{%
		\PassOptionsToClass{\CurrentOption}{\baseclass}%
	}

% process options
% ----------------------------------------------------------------------
	\ProcessOptions\relax

	% load baseclass
	\LoadClass{\baseclass}

% ======================================================================
% Packages
% ======================================================================
	% load latex4ei packages
	\RequirePackage{latex4ei/scientific}  		% scientific macros for LaTeX4EI
	\RequirePackage{latex4ei/latex4ei}  		% base definitions for LaTeX4EI
	\RequirePackage{latex4ei/latex4ei_boxes}	% section boxes


% ======================================================================
% Layout
% ======================================================================

% Geometry
% ----------------------------------------------------------------------
	\RequirePackage{geometry}
	\geometry{a4paper,landscape, left=6mm,right=6mm, top=6mm, bottom=5mm,includefoot, footskip=1.7em}


% Multicolumn
% ----------------------------------------------------------------------
	\ifmobile\else
		\RequirePackage{multicol}			% for columns

		% start multicolumn
		\AtBeginDocument{
		    \begin{multicols*}{\value{columnnumber}}
		}
		\AtEndDocument{
			\label{LastPage}
			\end{multicols*}
		}
	\fi


% Header and Footer
% ----------------------------------------------------------------------
	\RequirePackage{fancyhdr}

	\pagestyle{fancy}
	\fancyhf{}

	\AtBeginDocument{
	\fancyfoot[C]{\EngGer{from}{von} \theauthor\ -- Mail: \email{\theemail}}
	}
	\renewcommand{\headrulewidth}{0.0pt} %obere Linie ausblenden
	\renewcommand{\footrulewidth}{0.1pt} %obere Linie ausblenden

	\fancyfoot[R]{\EngGer{Last revised}{Stand}: \themydate \qquad \thepage/\pageref{LastPage}}
	\fancyfoot[L]{Homepage: \url{\thewebsite} -- \EngGer{Please report mistakes \emph{immediately}}{Fehler bitte \emph{sofort} melden}.}


% Title
% ----------------------------------------------------------------------
	\providecommand{\fstitle}[1]{
		\vspace{-20mm}{
		\parbox{2.3cm}{
			\includegraphics[height=1.4cm]{Logo.pdf}
		}
		\parbox{4cm}{
			\huge\textbf{#1}
		}}
	}

	\renewcommand{\maketitle}{\fstitle{\thetitle}}

% Chapters and Sections
% ----------------------------------------------------------------------
	\RequirePackage{titlesec}
	%\titleformat{ command }[ shape ]{ format }{ label }{ sep }{ before-code }[ after-code ]
	%\titlespacing*{ command }{ left }{ beforesep }{ aftersep }[ right ]

	\makeatletter
	\@addtoreset{section}{part}
	\makeatother

	\titleformat{\part}{\pagebreak\huge \bfseries}{}{0em}{\huge \bfseries}
	%\providecommand{\chapter}[1]{\vspace{0.5em}\noindent\textbf{\huge{#1}}\vspace{0.5em}}
	%\titleformat{\chapter}{\huge \bfseries}{\thechapter}{0em}{\huge \bfseries}
	\titleformat{\section}{\Large\bfseries\color{col_section}}{\thesection .}{0.5em}{\color{col_section}}%[\color{col_section} \hrule \hrule]
	\titleformat{\subsection}{\large\bfseries\color{col_subsection}}{\thesubsection .}{0.3em}{}
	\titleformat{\subsubsection}{\bfseries\color{col_subsubsection}}{\thesubsubsection .}{0.2em}{}
	\titleformat{\paragraph}{\bfseries\color{col_paragraph}}{\theparagraph .}{0.2em}{}

	%\titlespacing{Überschriftart}{keine Ahnung}{Abstand oberhalb}{Abstand unterhalb}
	\titlespacing{\section}{0em}{1.0em}{0.1em}
	\titlespacing{\subsection}{0em}{0.2em}{-0.2em}
	\titlespacing{\subsubsection}{0em}{0em}{-0.3em}
	\titlespacing{\paragraph}{0em}{0em}{-0.3em}

% Paragraphs
% ----------------------------------------------------------------------

	\RequirePackage{parskip} % prevents intend on new paragraph
	\setlength{\parskip}{1pt}

% Font Settings
% ----------------------------------------------------------------------

	% set sans as default font family
	\renewcommand{\familydefault}{\sfdefault}

	% stretch linespace in arrays and tables
	\renewcommand{\arraystretch}{1.2}


% ======================================================================
% Environments
% ======================================================================
	\setlength{\itemindent}{0em}
	\setlength\leftmargini{1.7em}
	\setlength\itemsep{0em}


% ======================================================================
% Other
% ======================================================================

% SI-Units Settings
% ----------------------------------------------------------------------
	\sisetup{per-mode=fraction}
	\sisetup{sticky-per=true}
	\AtBeginDocument{\sisetup{math-rm=\mathrm, text-rm=\rmfamily}}


% ======================================================================
% Color Scheme
% ======================================================================

\ifcolor
	\colorlet{col_section}{tum_blue_dark}
	\colorlet{col_subsection}{black}
	\colorlet{col_subsubsection}{black}
	\colorlet{col_sectionbox}{gray}

	\colorlet{col_emphbox}{tum_red}
	\colorlet{col_topicbox}{tum_blue_dark}
	\colorlet{col_symbolbox}{tum_orange}
	\colorlet{col_cookbox}{tum_blue_dark}

	\colorlet{col_table}{tum_blue_dark}
\else
	\colorlet{col_section}{black}
	\colorlet{col_subsection}{black}
	\colorlet{col_subsubsection}{black}

	\colorlet{col_sectionbox}{gray}
	\colorlet{col_emphbox}{black}
	\colorlet{col_topicbox}{black}
	\colorlet{col_symbolbox}{black}
	\colorlet{col_cookbox}{black}

	\colorlet{col_table}{black}
\fi

% Color for listings
\lstset{
	backgroundcolor=\color{col_lst!5},
}

% ======================================================================
% Mobile Version
% ======================================================================
\ifmobile
	\geometry{
		paperwidth=7.3cm,
		paperheight=20cm,
		portrait,
		left=1em,right=1em, top=1em, bottom=1em,
		noheadfoot, footskip=0em
	}

	% title
	\renewcommand{\maketitle}{
		\fstitle{\thetitle}
		\setcounter{tocdepth}{2}
		\tableofcontents
		\pagebreak
	}
	\pagestyle{empty}
	\newcommand{\columnbreak}{\relax}
\fi
