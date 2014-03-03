\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{podoc}[2014/02/28 Classe de documentation, v0.1]

% Tout ce qui est mis derrière un « % » n'est pas vu par LaTeX
% On appelle cela des « commentaires ».  Les commentaires permettent de
% commenter son document - comme ce que je suis en train de faire
% actuellement - et de cacher du code - cf. la ligne \pagestyle.

\LoadClass[11pt, oneside, a4paper]{article}

% Options possibles : 10pt, 11pt, 12pt (taille de la fonte)
%                     oneside, twoside (recto simple, recto-verso)
%                     draft, final (stade de développement)

% (1) choose a font that is available as T1
% for example:
\RequirePackage{lmodern}
% (2) specify encoding
\RequirePackage[T1]{fontenc}      % Police contenant les caractères français
\RequirePackage[francais]{babel}  % Placez ici une liste de langues, la
                              % dernière étant la langue principale
\RequirePackage[utf8x]{inputenc}   % LaTeX, comprends les accents !
% (3) load symbol definitions
\RequirePackage{textcomp}
\RequirePackage{underscore}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}

\RequirePackage{tabularx}
\makeatletter
\newcommand\cellwidth{\TX@col@width}
\makeatother
\renewcommand{\tabularxcolumn}[1]{m{#1}}
% \RequirePackage{multirow}
\renewcommand{\arraystretch}{1.5}
\newcommand{\initrowcolor}{\rowcolors{0}{WhiteSmoke}{}}
% \setlength{\tabcolsep}{1cm}
\RequirePackage{array}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

\RequirePackage[a4paper]{geometry}% Réduire les marges
% \pagestyle{headings}        % Pour mettre des entêtes avec les titres
                              % des sections en haut de page

\RequirePackage[final]{pdfpages}
\RequirePackage{etoolbox}
% \makeatletter
	% \newcommand{\initrow}{\global\rownum=\z@}
	% \def\@tempenvir{paragraph}%
	% \def\@parentenvir{}
	% \BeforeBeginEnvironment{\@tempenvir}{
	% 	\def\@parentenvir{\@currenvir}
	% }
	% \AtBeginEnvironment{tabularx}{
	% 	\ifx\@tempenvir\@currenvir
	% 		\global\rownum=0\relax
	% 	\else\fi
	% }
	% \ifenv{tabularx}{}{\global\rownum=\z@}
	% \preto\tabular{\global\rownum=\z@}
% \makeatother

\RequirePackage{listings}
\lstset{ %
  backgroundcolor=\color{white},   % choose the background color; you must add \RequirePackage{color} or \RequirePackage{xcolor}
  basicstyle=\footnotesize,        % the size of the fonts that are used for the code
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=b,                    % sets the caption-position to bottom
  commentstyle=\color{green},    % comment style
  deletekeywords={...},            % if you want to delete keywords from the given language
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  frame=single,                    % adds a frame around the code
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  keywordstyle=\color{blue},       % keyword style
  morekeywords={*,...},            % if you want to add more keywords to the set
  numbers=none,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                   % how far the line-numbers are from the code
  numberstyle=\tiny\color{gray}, % the style that is used for the line-numbers
  rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  stepnumber=2,                    % the step between two line-numbers. If it's 1, each line will be numbered
  stringstyle=\color{purple},     % string literal style
  tabsize=2,                       % sets default tabsize to 2 spaces
  % framexleftmargin=5pt,
  % title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}
% breaklines=true,frame=single}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}
\providecommand{\artAuthor}{}
\providecommand{\artLogo}{}
\providecommand{\artLogoSize}{0.30\textwidth}

\providecommand{\artProject}{}
\providecommand{\artTitle}{}
\providecommand{\artResume}{}

\providecommand{\artToc}{true}  % delete to remove Table Of Content

\providecommand{\artDate}{\today}
% \renewcommand{\artDate}{14 avril 2016}
\providecommand{\artFooterDate}{\artDate}

\title{\artTitle}   % Les paramètres du titre : titre, auteur, date
\author{\artAuthor}
\date{\artDate}

\sloppy                       % Ne pas faire déborder les lignes dans la marge
\RequirePackage{hyperref}
\hypersetup{colorlinks=true}
\RequirePackage{fullpage}
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{%
	\fancyhf{} % clear all header and footer fields
	\fancyfoot[L]{\bfseries \artTitle}
	\fancyfoot[C]{\artFooterDate}
	\fancyfoot[R]{\bfseries \thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{plain}

\AtBeginDocument{
\initrowcolor
\thispagestyle{empty}
\begin{center}

% Upper part of the page. The '~' is needed because \\
% only works if a paragraph has started.
\ifcsempty{artLogo}{}{\includegraphics[width=\artLogoSize]{\artLogo}~\\[1cm]}{~\\[7cm]}
\ifcsempty{artAuthor}{}{\textsc{\Large \artAuthor}\\[1.5cm]}
\ifcsempty{artProject}{}{\textsc{\Large \artProject}\\[0.5cm]}

\ifcsempty{artTitle}{ \\[1.5cm]}{
	% Title
	\HRule \\[0.4cm]
	{ \huge \bfseries \artTitle\\[0.4cm] }
	\HRule \\[1.5cm]
}

\ifcsempty{artResume}{}{
	\begin{abstract}
		\artResume
	\end{abstract}
}
\vfill
% Bottom of the page
{\large \artDate}
\end{center}
\newpage

\ifcsempty{artToc}{}{
    \tableofcontents              % Table des matières
}
\newpage
}