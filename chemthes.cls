%%
%% This is file `chemeng.cls',
%%
%% Time-stamp: <17:11 25 Dec 1997> 
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
%%     P Sunthar
%% 
%%     L Srinivasa Mohan
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chemthes} [25/12/1997 chemeng thesis class v 1.0]

\newif\if@phd
\newif\if@msc
\newif\if@me
\newif\if@draft

\DeclareOption{twoside}{%
  \PassOptionsToClass{twoside}{report}
}

\DeclareOption{draft}{%
  \@drafttrue
  \PassOptionsToClass{draft}{report}
}

\DeclareOption{phd}{%
  \@phdtrue
}

\DeclareOption{msc}{%
  \@msctrue
}

\DeclareOption{me}{%
  \@metrue
}


\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{report}}  


\ProcessOptions

\LoadClass[12pt,a4paper,openright]{report}
\RequirePackage{fancyhdr}
\RequirePackage{iisclogo}

% Page layout
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
%\setlength\textwidth{15cm}
\setlength\textwidth{14cm}
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

%% The style file for References (close to Chem. Engng. Sci)
\bibliographystyle{chemthes}


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


\if@me % declaration for ME thesis
  \newcommand{\@degree}{Master of Engineering}
  \newcommand{\@declaration}{%
    { \large \em \Usefont{pzc} 
      A Project Report \\ [.25\baselineskip] 
      submitted in partial fulfillment of the \\ [.25\baselineskip] 
      requirements for the degree of \\ [.25\baselineskip] 
      {\Usefont{ppl} \bfseries  \@degree } \\ [.25\baselineskip] 
      in the Faculty of Engineering \par by \par
      } 
    }
\else % for research thesis
   \if@phd\newcommand{\@degree}{Doctor of Philosophy}\fi
   \if@msc\newcommand{\@degree}{Master of Science (Engg.)}\fi
  \newcommand{\@declaration}{%
    { \large \em \Usefont{pzc} 
      A Thesis submitted \par
      for the degree of \\ [.25\baselineskip] 
      {\Usefont{ppl} \bfseries  \@degree } \\ [.25\baselineskip] 
      in the Faculty of Engineering \par by \par }
}
\fi

\newcommand{\makecoverpage}{%
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
      \if@draft\else\iisclogo{800}\fi\par
      { \Usefont{ptm}
        {\large   Department of  Chemical Engineering \\[0.2\baselineskip]
          Indian Institute of Science \\[0.3\baselineskip]
          Bangalore 560 012  (India) }\\ [.75\baselineskip]
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


%% End of file `chemthes.cls'
