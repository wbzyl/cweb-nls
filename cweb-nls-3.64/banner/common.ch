% THIS FILE BELONGS TO CWEB-NLS PACKAGE.

Limbo.

@x l.1
% This file is part of CWEB.
% This program by Silvio Levy and Donald E. Knuth
% is based on a program by Knuth.
% It is distributed WITHOUT ANY WARRANTY, express or implied.
% Version 3.64 --- January 2002

% Copyright (C) 1987,1990,1993,2000 Silvio Levy and Donald E. Knuth
@y
% This file is part of CWEB-NLS.
% This program by Wlodek Bzyl
% is based on a program by Levy and Knuth.
% It is distributed WITHOUT ANY WARRANTY, express or implied.
% Version 3.64k+NLS --- November 2002

% Copyright (C) 2002 Wlodek Bzyl
@z

@x l.20
\def\title{Common code for CTANGLE and CWEAVE (Version 3.64)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont Common code for {\ttitlefont CTANGLE} and
    {\ttitlefont CWEAVE}}
  \vskip 15pt
  \centerline{(Version 3.64)}
  \vfill}
\def\botofcontents{\vfill
\noindent
Copyright \copyright\ 1987, 1990, 1993, 2000 Silvio Levy and Donald E. Knuth
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\title{Common code for CTANGLE-NLS and CWEAVE-NLS (Version 3.64k)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont Common code for CTANGLE-NLS and CWEAVE-NLS processors}
  \vskip 15pt
  \centerline{(Version 3.64k)}
  \vfill}
\def\botofcontents{\vfill
\noindent
Copyright \copyright\ 2002 Wlodek Bzyl
@z

This change can not be applied when `tie' is  used
(TOC file can not be typeset).

%@x l.42
%\let\maybe=\iftrue
%@y
%\let\maybe=\iffalse % print only changed modules
%@z


Section 5.

@x
@* The character set.
\.{CWEB} uses the conventions of \CEE/ programs found in the standard
\.{ctype.h} header file.
@y
@* The character set and the NLS.
\.{CWEB} uses the conventions of \CEE/ programs found in the standard
\.{ctype.h} header file and the conventions of National Language
Support (NLS) found in \.{locale.h} and \.{libintl.h} header files.
@^National Language Support (NLS)@>
@z

@x
@<Include files@>=
#include <ctype.h>
@y
@d _(String) gettext(String) /* shorthand for marking translatable strings */
@^system dependencies@>
@^Makefile@>

@<Include files@>=
#include <ctype.h>
#include <string.h> /* declarations of |strcoll| */
#include <locale.h> /* required by an application using NLS */
#include <libintl.h> /* definition of GNU |gettext| */
@z


Section 71.

@x l.1279
otherwise we add |".w"|. If this file can't be opened, we prepare an
|alt_web_file_name| by adding |"web"| after the dot.
@y
otherwise we add |".w"|.
@z

@x l.1295
  sprintf(alt_web_file_name,"%s.web",*argv);
@y
@z


Section 81. (removed)

@x l.1403
@ We predeclare several standard system functions here instead of including
their system header files, because the names of the header files are not as
standard as the names of the functions. (For example, some \CEE/ environments
have \.{<string.h>} where others have \.{<strings.h>}.)

@<Predecl...@>=
extern int strlen(); /* length of string */
extern int strcmp(); /* compare strings lexicographically */
extern char* strcpy(); /* copy one string to another */
extern int strncmp(); /* compare up to $n$ string characters */
extern char* strncpy(); /* copy up to $n$ string characters */
@y
@z
