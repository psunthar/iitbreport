%%
%% This is file `iitbreport.cls',
%%
%% Time-stamp:<2016-04-18 01:32:05, v1.3 sunthar>
%%
%% Indian Institue of Technology Bombay, Thesis Document Class for LaTeX2e
%**********************************************************************
%%
% IMPORTANT NOTICE:
%% 
%**********************************************************************
%% You are not allowed to change this file.  You may however copy this file
%% to a file with a different name and then change the copy.
%% 
%% You are NOT ALLOWED to distribute this file alone.  You are NOT ALLOWED
%% to take money for the distribution or use of this file (or a changed
%% version) except for a nominal charge for copying etc.
%% 
%% You are allowed to distribute this file under the condition that it is
%% distributed together with all files mentioned below.
%%  - iitbauthyr.bst
%%  - iitb-black.pdf 
%%  - README.txt

%% Updated versions of this file and related files is available from
%%   https://github.com/psunthar/iitbreport
%% 
%% If you receive only some of these files from someone, complain!
%% 
%% Report errors in case of UNCHANGED versions to 
%%
%%    https://github.com/psunthar/iitbreport/issues/new (preferred)
%%          or 
%%      P Sunthar  <p.sunthar@gmail.com> 
%%           or 
%%      Chandra Has <chandrahashbti@gmail.com>
%% 
%%
%%====================================================================

%********************* New class: iitbreport.cls**********************
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iitbreport} [23/10/2015 IIT Bombay Report class v 1.2]
\typeout{Document Class 'iitbreport' v1.2beta <10 Feb 16>}

%******************************************************************** 
% We need command to switch between dissertation, annual progress 
% seminar report, and thesis, and between different types of  
% reports. 
%*******************************************************************
\newif\if@draft
\newif\if@seminar
\newif\if@degree

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


%*****************************************************************
% Process given options
% Defaults
%****************************************************************** 
\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{report}}  

\ProcessOptions
\LoadClass[12pt,a4paper,openright]{report}


%***************Some important packages ****************************
% ams: for maths
% hyperref: for linking various labels
% graphicx: to add graphics
% fontenc, txfonts: important for character encoding, common font
% fancyhdr: fancy headr and footer
% nomencl: list of symbols
% natbib: to create references
%********************************************************************
\RequirePackage[T1]{fontenc}
\RequirePackage{amsmath, amsfonts, amssymb}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}

\RequirePackage[bookmarks,%
            breaklinks,%
            backref=false,%
            pdfhighlight=/I,%
            pdffitwindow=true,%
            pdfstartview=Fit,%
            pdfcenterwindow=true,%
            linkbordercolor={1 0 1},%
	        pdfusetitle]
            {hyperref}

\RequirePackage[varg]{txfonts}
\RequirePackage{graphicx}
\newcommand{\putiitblogo}{\includegraphics[width=10em]{iitb-black}}


%******************page margins ******************************
%% Adjusted to a4 paper (29.7 x 21 cm)
\marginparwidth=0pt
\marginparsep=0pt
\setlength\hoffset{-1in}
\setlength\voffset{-1in}

\setlength{\topmargin}{14mm}
\setlength{\textheight}{245mm}
%\setlength\footskip{13mm}
\setlength{\headheight}{10mm}
\setlength{\headsep}{6mm}
% bottom margin is 22mm, total height: 14+245+10+6+22=29.7 mm

\setlength{\textwidth}{150mm}
\if@twoside
\setlength{\oddsidemargin}{34mm} 
\setlength{\evensidemargin}{26mm}
\else
\setlength{\oddsidemargin}{30mm}  
\setlength{\evensidemargin}{30mm} 
\fi
% total width for two side: 160+30+20=210 mm

%******************notations with nomecl***************************
\RequirePackage{ifthen}
\RequirePackage[intoc,refpage]{nomencl}\makenomenclature
\renewcommand*{\pagedeclaration}[1]{~\dotfill\hyperpage{#1}}
\renewcommand*{\nompreamble}{\@mkboth{\nomname}{\nomname}}

\renewcommand*{\nomgroup}[1]{%
\ifthenelse{\equal{#1}{A}}{\item[\large \textbf{Roman Symbols}]}{%               
 \ifthenelse{\equal{#1}{B}}{\vskip5mm\item[\large\textbf{Greek Symbols}]}{%          
 \ifthenelse{\equal{#1}{C}}{\vskip5mm\item[\large\textbf{Superscripts}]}{%
 \ifthenelse{\equal{#1}{D}}{\vskip5mm\item[\large\textbf{Subscripts}]}{%	     
 \ifthenelse{\equal{#1}{E}}{\vskip5mm\item[\large\textbf{Acronyms}]}{% 
 \ifthenelse{\equal{#1}{X}}{\vskip5mm\item[\large\textbf{\@OtherSym}]}{%           
  }}}}}}
}

\newcommand*{\nmR}[3][]{\nomenclature[A#1]{#2}{#3}}
\newcommand*{\nmG}[3][]{\nomenclature[B#1]{#2}{#3}}
\newcommand*{\nmS}[3][]{\nomenclature[C#1]{#2}{#3}}
\newcommand*{\nms}[3][]{\nomenclature[D#1]{#2}{#3}}
\newcommand*{\nmA}[3][]{\nomenclature[E#1]{#2}{#3}}

\def\OtherSym#1{\gdef\@OtherSym{#1}}
\def\@OtherSym{Other Symbols}
\newcommand*{\nmX}[3][]{\nomenclature[X#1]{#2}{#3}}

\newcommand*{\nm}[2]{\nomenclature{#1}{#2}} % for simple list
	
\newcommand*{\notations}[2][4cm]{%
	\cleardoublepage\phantomsection
	\pagestyle{fancy}
	\renewcommand*{\nomname}{#2}%		
	\printnomenclature[#1]
	}
	
%\newcommand*{\Unit}[1]{%
%	\renewcommand{\nomentryend}{%
%		\hspace*{\hfill}[#1]\nolinebreak\hspace*{4cm}\mbox{}}%
	
%\newcommand*{\nomheaders}{%
%	\item[\bfseries Symbol]%
%	\textbf{Description}\hfill\textbf{Page}\ignorespaces
%	}			
			

%******************reference and citation styles********************  
%% In a thesis/report it the bibliography is called ``References'' 
%% The style file for References (Rev. Mod. Phys long
%% apsrmp4-1long.bst)
%%****************************************************************
\RequirePackage{natbib}
\renewcommand{\bibname}{References}
\let\mybibliography\bibliography
\renewcommand{\bibliography}[1]{\makeheadtoc{References}\mybibliography{#1}}

\bibliographystyle{iitbauthyr}

%******************header-footer from fancyhdr.sty******************
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
  \cfoot{{\small\thepage}}
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

%**********************Title page*************************************
% \author, \title, and \date are already defined in report
% Some new commands are defined here
% New commands: department, degree, supervisor, cosupervisors, rollnum
% Comments are welcomed
%**********************************************************************
\newcommand{\Usefont}[1]{\fontfamily{#1}\selectfont}
\newcommand{\monthyear}[1]{%
 \ClassWarning{iitbreport}{%
 \protect\monthyear\space command has been deprecated from Version 1.1 \space \MessageBreak
 use \protect\date\space instead.
 }
}

%% Indian date format DD Month YYYY
\renewcommand{\today}{%
\number\day\space%
\ifcase \month \or January\or February\or March\or April\or May%
\or June\or July\or August\or September\or October\or November\or December\fi%
\space\number\year
}
\gdef\@date{\today}

\nonstopmode   % Do not stop if the font is not available
\newcommand{\reporttype}[1]{\gdef\@reptype{#1}}
\gdef\@reptype{A Project Report}
\newcommand{\degree}[1]{\gdef\@degree{#1}\@degreetrue}
\gdef\@degree{}
\newcommand{\dept}[1]{\gdef\@dept{#1}}
\def\rollnum#1{\gdef\@rollnum{#1}}

\global\let\@supervisor\@empty
\def\supervisor#1{\gdef\@supervisor{#1}}

\global\let\@cosupervisor\@empty
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}

\global\let\@excosupervisor\@empty
\def\excosupervisor#1{\gdef\@excosupervisor{#1}}

\global\let\@dept\@empty
\def\dept#1{\gdef\@dept{#1}}

\gdef\@rollnum{}

\newcommand{\@declaration}{%
    {\large \em \Usefont{pzc} 
      \@reptype \par
      %\vspace{\stretch{0.3}}       
      \if@degree{
        Submitted in partial fulfillment of  \\ [.25\baselineskip] 
        the requirements for the degree of \par
        {\Usefont{ppl}   \bfseries  \@degree }
      }
       \\ [.25\baselineskip]      
      \fi
       by} \par
        \vspace{\stretch{0.3}}
      } 


\if@seminar % 
  \ClassWarning{iitbreport}{%
  \MessageBreak
  seminar option deprecated.\MessageBreak
  Use \protect\reporttype\space instead.
  \MessageBreak
  }
\fi

%\newcommand{\makecoverpage}{%
\renewcommand{\maketitle}{%
\begin{titlepage}
  {%
  	\renewcommand{\baselinestretch}{1}\normalsize
%  \pdfbookmark[0]{Title}{Title}  
  \thispagestyle{empty}
  {\begin{center}
   {\Usefont{ptm}
      {\Usefont{phv} \LARGE \bfseries \@title \par}
      \vspace{\stretch{0.3}}
       \@declaration
        \vspace{.25\baselineskip} 
      {\large \bfseries \@author \par}
      \vspace{.25\baselineskip}  
      {\large (\@rollnum)}\vspace{\stretch{0.3}}           
          
         
         \ifx\@supervisor\@empty
         \ifx\@excosupervisor\@empty
           \ifx\@cosupervisor\@empty  
           \par        
          \fi \fi
          
          \else  
          \ifx\@excosupervisor\@empty
             \ifx\@cosupervisor\@empty
        {\large Supervisor:\par} \vspace{.25\baselineskip}  
        {\large \bfseries \@supervisor \par}       
                  
         \else                    
               {\large Supervisors:\par} \vspace{.25\baselineskip}  
              {\large \bfseries \@supervisor \par} \vspace{.25\baselineskip}    
              and \par \vspace{.25\baselineskip}      
              {\large\bfseries\@cosupervisor \par}
              \fi      
                   
       \else              
       {\large Supervisors:\par} \vspace{.25\baselineskip}  
              {\large \bfseries \@supervisor \par}  \vspace{.25\baselineskip}      
              {\large\bfseries\@cosupervisor \par}
              \vspace{.25\baselineskip} 
               and \par \vspace{.25\baselineskip}  
              {\large\bfseries\@excosupervisor \par}           
                           
        \fi \fi       
                
      \vspace{\stretch{0.3}}
      \if@draft
      \else\putiitblogo
       \fi\par      
      
      {\Usefont{ptm}
       \ifx\@dept\@empty
       \vspace{\stretch{0.25}}
      {\large Indian Institute of Technology Bombay \\[0.25\baselineskip]
        Mumbai 400076  (India)}        
        \else
      \vspace{\stretch{0.25}}
              {\large \@dept  \\[0.25\baselineskip]
                Indian Institute of Technology Bombay \\[0.25\baselineskip]
                Mumbai 400076  (India) }
        \fi  
          
        \vspace{.25\baselineskip}
        {\Large \@date \par}
        }
       } 
    \end{center}
   }
    }
    \end{titlepage}
} % coverpage


%**************************Certificate page*************************
\newcommand*{\GuideSign}{%
	\begin{center}	
		\begin{tabular}{p{0.6\linewidth}c}
		           	  & \rule{4cm}{1pt}\\	
			Date: \@date    &  \@supervisor\\         
		\end{tabular}	
	\end{center}
}
\newcommand*{\makecertificate}[2][Acceptance Certificate]{%
\cleardoublepage\phantomsection 	
	\thispagestyle{empty} 	
	\begin{center}	
		{\LARGE \textbf{#1} \par}\vspace{2\baselineskip} 
		{\large\textbf{\@dept}\par}\vspace{0.25\baselineskip} 
		{\large\textbf{Indian Institute of Technology, Bombay}}
	\end{center}
\vspace{1.5\baselineskip} 
The #2  entitled ``\@title'' submitted by \@author{} (\@rollnum{}) may be accepted for being evaluated.\par
\vspace{4\baselineskip} 
\noindent
\GuideSign 	
	}


%**************************Copyright page******************************
\newcommand*{\mycopyright}{%
	\cleardoublepage\phantomsection 	
	\thispagestyle{empty}
	\setlength{\parindent}{0pt}	 
	 \vspace*{19cm} 
	{\itshape\copyright\,\footnotesize \@date, by \@author\\	
		All rights reserved}	
}


%**************************Dedication ********************************
\newcommand*{\dedication}[1][]{%
	\cleardoublepage\phantomsection
	\thispagestyle{empty} 
	{\centering\large\itshape\null\vfill #1\vfill\null}
}


%**************************Approval sheet*****************************
\newcommand*{\makeapproval}[2][Approval Sheet]{%
	\cleardoublepage\phantomsection	
	\thispagestyle{empty}
		\begin{center}
			{\LARGE \bfseries #1}\\[2\baselineskip]			
		\end{center}
This #2 entitled ``\@title'' by \@author\ is approved for the degree of \@degree.
		\begin{center}
			\vspace{2\baselineskip}  
		    \renewcommand{\arraystretch}{2}
			\begin{tabular}{p{0.45\linewidth}c}
				& \rule{6.5cm}{1pt}\\
				& \rule{6.5cm}{1pt} \\
				& \rule{6.5cm}{1pt} \\[-8mm] 
				& {Examiners} \\ [7mm] 				
				
				& \rule{6.5cm}{1pt} \\
				& \rule{6.5cm}{1pt} \\
				& \rule{6.5cm}{1pt} \\ [-8mm] 				
				& Supervisor (s) \\ [7mm] 
				
				& \rule{6.5cm}{1pt}\\ [-8mm]				
				& Chairman \\ [7mm]  				
				
				Date: \rule{3cm}{1pt} & \\
				Place: \rule{3cm}{1pt} &\\			
			\end{tabular}	
		\end{center}\cleardoublepage	
}	  


%**************************Declaration********************************
\newcommand*{\DecSign}[1][\today]{% 
	\vspace{3cm}  
	\begin{center}	
		\begin{tabular}{p{0.6\linewidth}c}
		           	  & \rule{4cm}{1pt}\\	
			          &  \@author\\
	   Date: #1       & (\@rollnum) \\
		\end{tabular}	
	\end{center}
}
\newenvironment{Declaration}[1][Declaration]{%
	\cleardoublepage\phantomsection		
		\chapter*{#1}
	}{}


%*************************Abstract*************************************
\newenvironment{Abstract}[1][Abstract]{%	
\makeheadtoc{#1}\chapter*{#1}}{%	
}
%\renewcommand{\abstractname}{\Large Abstract}

%*************************Makecontents*********************************
% Change contents name
% Adding lof and lot into toc
% Adding toc into pdf bookmark
%**********************************************************************
\renewcommand*{\contentsname}{Table of Contents}

\newif\iffigurespage
\newif\iftablespage 
\figurespagetrue % default 
\tablespagetrue  % default
\def\makecontents{%
	\cleardoublepage
	\pdfbookmark[0]{\contentsname}{\contentsname}	
	\tableofcontents 
	\@mkboth{\contentsname}{\contentsname}	
	
	\iffigurespage \makeheadtoc{\listfigurename}
	\listoffigures
	\fi 
	
	\iftablespage \makeheadtoc{\listtablename}
	\listoftables
	\fi
	\cleardoublepage	 
}

\newcommand*{\addintoc}[2][chapter]{%
	\addcontentsline{toc}{#1}{#2}\cleardoublepage\phantomsection
	}
\newcommand{\makeheadtoc}[1]{%
  \cleardoublepage\phantomsection
    \markboth{#1}{#1}
      \addcontentsline{toc}{chapter}{#1}
}

%% The macros for the  Acknowledgements, List of publications  
\newcommand*{\acknowledgments}[1][Acknowledgements]{%	
	\makeheadtoc{#1}
	\chapter*{#1}
}

\newcommand*{\listofpublications}[1][List of Publications]{%	
	\makeheadtoc{#1} 	
	\chapter*{#1}
}

% Adding signature
\newcommand*{\signature}[2][IIT Bombay]{%
	\vspace{1.5cm}
	\begin{flushright}
		\emph{\bfseries \@author}\\
		#1 \\ #2
	\end{flushright}
}


%*******************colophon********************************
\newcommand{\colophon}{%
\cleardoublepage
\pagestyle{empty}\hfill\vfill
\pdfbookmark[0]{Colophon}{colophon}
\section*{\scshape Colophon}
This document has been typeset using the {\color{blue}\texttt{iitbreport.cls}} typesetting
system developed by {\color{blue}P. Sunthar} and {\color{blue}Chandra Has}. The body text is set at 12pt and a similar to times new roman font is accessed using {\color{red}\texttt{txfonts}} package; default line spacing is set at 1.5. Other important packages such as {\color{red}\texttt{amsmath, amssymb, amsfonts, fancyhdr, hyperref, natbib}}, and {\color{red}\texttt{graphicx}} are installed to use this style file.
\vskip5mm 
For any suggestion/query:\par
\hfil {\color{blue}p.sunthar@gmail.com}\hfil\par 
\hfil or\hfil\par
\hfil {\color{blue}chandrahashbti@gmail.com}\hfil 
}


%**************************Chapter style*****************************
\def\@makechapterhead#1{%
	\vspace*{50\p@}%
	{\parindent \z@ \raggedright \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\huge\bfseries \@chapapp\space \thechapter
		\par\nobreak
		\vskip 20\p@
		\fi
		\interlinepenalty\@M
		\Huge \bfseries #1\par\nobreak
		\vskip 40\p@
	}}
	
	\def\@makeschapterhead#1{%
		\vspace*{50\p@}%
		{\parindent \z@ \raggedright
			\normalfont
			\interlinepenalty\@M
			\Huge \bfseries  #1\par\nobreak
			\vskip 40\p@
		}}


%**********************Section/subsection styles********************
\def\section{\@startsection{section}{1}%
  \z@{-.7\baselineskip\@plus-\baselineskip}{.5\baselineskip}%
  {\Large\normalfont\bfseries\hsize1\textwidth \raggedright}}

\def\subsection{\@startsection{subsection}{2}%
  \z@{.5\baselineskip\@plus.7\baselineskip}{0.5\baselineskip}%
  {\large\normalfont\bfseries\raggedright}}
%\def\subsubsection{\@startsection{subsubsection}{3}%
%  \z@\z@{0.5\baselineskip}%
%  {\normalfont\itshape\raggedright}}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                         {-3.25ex\@plus -1ex \@minus -.2ex}%
                         {1.5ex \@plus .2ex}%
                         {\normalfont\itshape\raggedright}}


%********************* Paragraph, line spacing********************
% Indentation 5 characters approx
% Paragraph spacing
% Line spacing (onehalfspacing is equal to baselinestretch 1.33)
%*****************************************************************
\parindent 5ex
%\setlength{\parskip}{1\baselineskip} 
\renewcommand{\baselinestretch}{1.33}


%**************************Widow and orphan************************
% Widow and orphan settings
% Requirements for the thesis format
% Orphan (removes single line at bottom of page)
% Widow (removes single line at top of page)
%*****************************************************************
\clubpenalty=10000  
\widowpenalty=10000	 

%**************************Other settings************************
\sloppy
\raggedbottom



\endinput

%======================================================================
% END FILE: `iitbreport.cls'
%======================================================================














