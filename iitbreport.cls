%%
%% This is file `iitbreport.cls',
%%
%% Time-stamp: <2015-04-15 00:00:54 sunthar> 
%% 
%% 
%% IMPORTANT NOTICE:
%% 
%% You are not allowed to change this file.  You may however copy this file
%% to a file with a different name and then change the copy.
%% 
%% You are NOT ALLOWED to distribute this file alone.  You are NOT ALLOWED
%% to take money for the distribution or use of this file (or a changed
%% version) except for a nominal charge for copying etc.
%% 
%% You are allowed to distribute this file under the condition that it is
%% distributed together with all files mentioned below.
%% 
%% If you receive only some of these files from someone, complain!
%% 
%% Error Reports in case of UNCHANGED versions to either of
%% 
%%     P Sunthar  <p.sunthar@gmail.com>
%% 
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iitbreport} [14/04/2015 IIT Bombay Report class v 1.0]

\newif\if@draft
\newif\if@seminar
\newif\if@project

\DeclareOption{twoside}{%
  \PassOptionsToClass{twoside}{report}
}

\DeclareOption{draft}{%
  \@drafttrue
  \PassOptionsToClass{draft}{report}
}


\DeclareOption{seminar}{%
  \@seminartrue
}



\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{report}}  


\ProcessOptions

\LoadClass[12pt,a4paper,openright]{report}
\RequirePackage{fancyhdr}

%%% Other packages
\usepackage[bookmarks,%
            a4paper,%
            breaklinks,%
            backref=false,%
            pdfhighlight=/I,%
            pdffitwindow=true,%
            pdfstartview=Fit,%
            pdfcenterwindow=true,%
            linkbordercolor={1 0 1},%
	    pdfusetitle]
            {hyperref}


\usepackage{amsmath}
\usepackage[varg]{txfonts}
\usepackage{graphicx}
\newcommand{\putiitblogo}{\includegraphics[width=10em]{iitb-black}}

%%%% Page layout
\marginparwidth=0pt
\marginparsep=0pt
\setlength\hoffset{-1in}
\setlength\voffset{-1in}
%%\setlength\oddsidemargin{1.4in}
%%\setlength\evensidemargin{1in}
%%\setlength\topmargin{1in}
%%\setlength\textheight{23cm}

%% Adjusted to a4 paper (29.7 x 21 cm)
\setlength\topmargin{2.6cm}
\setlength\oddsidemargin{3.4cm}
\setlength\evensidemargin{2.6cm}
\setlength\textwidth{15cm}
\setlength\textheight{22cm}
\setlength\footskip{1.3cm}
\setlength\headheight{1cm}

%% other styles for the thesis
\renewcommand{\baselinestretch}{1.3}
\renewcommand{\abstractname}{\Large Abstract}

%% notations page
\newcommand{\notationsname}{Notation}
\newcommand{\notations}{%
  \chapter*{\notationsname \@mkboth{\notationsname}{\notationsname}}
  \addcontentsline{toc}{chapter}{\notationsname}
}

%% In a thesis/report it the bibliography is called ``References'' 
\renewcommand{\bibname}{References}

%% The style file for References (Rev. Mod. Phys long
%% apsrmp4-1long.bst)
\RequirePackage{natbib}
\bibliographystyle{iitbauthyr}


% Fancy header 
\pagestyle{fancy}

% Heading marks
\renewcommand{\chaptermark}[1]{%
  \markboth{#1}{}
}
\renewcommand{\sectionmark}[1]{%
  \markright{\thesection \hspace{1em} #1}
}

% Heading format
\fancyhead{} % clear old format
\fancyhead[LE,RO]{\thepage}
\if@twoside
  \fancyhead[LO]{\em\nouppercase\rightmark}
  \fancyhead[RE]{\em\nouppercase\leftmark }
\else
  \fancyhead[L]{\em\nouppercase\rightmark}
\fi

\cfoot{}

%% redefine plain style
\fancypagestyle{plain}{%
  \fancyhf{} % clear all header and footer fields
  \fancyfoot[LE,RO]{{\small\thepage}}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}


% this is to leave a page completely blank (without headers) when the
% document is used with a openright option (ref: fancyhdr.tex)

\renewcommand{\cleardoublepage}{%
  \clearpage\if@twoside \ifodd\c@page\else
  \hbox{}
  \thispagestyle{empty}
  \newpage
  \if@twocolumn\hbox{}\newpage\fi\fi\fi
}

%%  Coverpage format
\newcommand{\Usefont}[1]{\fontfamily{#1}\selectfont}
\newcommand{\monthyear}[1]{\gdef\@monthyear{#1}}
\gdef\@monthyear{}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\gdef\@degree{}
\newcommand{\dept}[1]{\gdef\@dept{#1}}
\gdef\@dept{}



\if@seminar % 
  \newcommand{\@declaration}{%
    { \large \em \Usefont{pzc} 
      A Seminar Report \\ [.25\baselineskip] 
      submitted in partial fulfillment of the \\ [.25\baselineskip] 
      requirements for the degree of \\ [.25\baselineskip] 
      {\Usefont{ppl} \bfseries  \@degree } \\ [.25\baselineskip] 
       by \par
      } 
    }
\else % for research thesis
  \newcommand{\@declaration}{%
    { \large \em \Usefont{pzc} 
      A Thesis \\ [.25\baselineskip] 
      submitted in partial fulfillment of the \\ [.25\baselineskip] 
      requirements for the degree of \\ [.25\baselineskip] 
      {\Usefont{ppl} \bfseries  \@degree } \\ [.25\baselineskip] 
      by \par }
}
\fi


\if@project % declaration for project work
  \newcommand{\@declaration}{%
    { \large \em \Usefont{pzc} 
      A Project Report submitted \\ [.25\baselineskip] 
       by \par
      } 
    }
\fi

%\newcommand{\makecoverpage}{%
\renewcommand{\maketitle}{%
  {\renewcommand{\baselinestretch}{1}\normalsize
  \thispagestyle{empty}
  {\Usefont{ptm}
    \begin{center}
      {\Usefont{phv}\LARGE \bfseries \@title \par}
      \vspace{\stretch{1}}
      \@declaration
      \vspace{\stretch{1}}
      {\large \bfseries \@author \par}
      \vspace{\stretch{2}}
      \if@draft\else\putiitblogo \fi\par
      { \Usefont{ptm}
        {\large \@dept  \\[0.2\baselineskip]
          Indian Institute of Technology Bombay \\[0.3\baselineskip]
          Mumbai 460076  (India) }\\ [.75\baselineskip]
        {\Large \@monthyear \par}
        }
    \end{center}
    }}
} % coverpage

\def\section{\@startsection{section}{1}%
  \z@{-.7\baselineskip\@plus-\baselineskip}{.5\baselineskip}%
  {\large\normalfont\bfseries\hsize0.8\textwidth \raggedright}}

\def\subsection{\@startsection{subsection}{2}%
  \z@{.5\baselineskip\@plus.7\baselineskip}{0.5\baselineskip}%
  {\normalfont\bfseries\raggedright}}
%\def\subsubsection{\@startsection{subsubsection}{3}%
%  \z@\z@{0.5\baselineskip}%
%  {\normalfont\itshape\raggedright}}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                         {-3.25ex\@plus -1ex \@minus -.2ex}%
                         {1.5ex \@plus .2ex}%
                         {\normalfont\itshape\raggedright}}


\endinput


%% End of file `iitbreport.cls'
