% THIS FILE BELONGS TO CWEB-NLS PACKAGE.

Limbo.

@x l.1
% This file is part of CWEB.
% This program by Silvio Levy and Donald E. Knuth
% is based on a program by Knuth.
% It is distributed WITHOUT ANY WARRANTY, express or implied.
% Version 3.64 --- February 2002
% (essentially the same as version 3.6, which added
%  recently introduced features of standard C++ to version 3.4)

% Copyright (C) 1987,1990,1993,2000 Silvio Levy and Donald E. Knuth
@y
% This file is part of CWEB-NLS.
% This program by Wlodek Bzyl
% is based on a program by Levy and Knuth.
% It is distributed WITHOUT ANY WARRANTY, express or implied.
% Version 3.64k+NLS --- November 2002

% Copyright (C) 2002 Wlodek Bzyl
@z

@x l.32
\def\title{CWEAVE (Version 3.64)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CWEAVE} processor}
  \vskip 15pt
  \centerline{(Version 3.64)}
  \vfill}
\def\botofcontents{\vfill
\noindent
Copyright \copyright\ 1987, 1990, 1993, 2000 Silvio Levy and Donald E. Knuth
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\SQUARE{\vrule width 2pt depth -1pt height 3pt}
\def\sqitem{\item{\SQUARE}}

\def\title{CWEAVE-NLS (Version 3.64k)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The CWEAVE-NLS --- an internationalized CWEAVE processor}
  \vskip 15pt
  \centerline{(Version 3.64k)}
  \vfill}
\def\botofcontents{\vfill
\noindent
Copyright \copyright\ 2002 Wlodek Bzyl
@z

This change can not be applied when `tie' is  used
(TOC file can not be typeset).

%@x l.51
%\let\maybe=\iftrue
%@y
%\let\maybe=\iffalse % print only changed modules
%@z


Section 1.

@x l.57
This is the \.{CWEAVE} program by Silvio Levy and Donald E. Knuth,
based on \.{WEAVE} by Knuth.
We are thankful to Steve Avery,
Nelson Beebe, Hans-Hermann Bode (to whom the original \CPLUSPLUS/ adaptation
is due), Klaus Guntermann, Norman Ramsey, Tomas Rokicki, Joachim Schnitter,
Joachim Schrod, Lee Wittenberg, Saroj Mahapatra, Cesar Augusto Rorato
Crusius, and others who have contributed improvements.

The ``banner line'' defined here should be changed whenever \.{CWEAVE}
is modified.

@d banner "This is CWEAVE (Version 3.64)\n"
@y 
This is the \.{CWEAVE-NLS} program by W{\l}odek Bzyl,
based on \.{CWEAVE} by Levy and Knuth.

I decided to use \.{CTANGLE}, \.{CWEAVE} and \.{CWEB} 
when refering to \.{CTANGLE-NLS}, \.{CWEAVE-NLS} and \.{CWEB-NLS}. 
Otherwise this change file would be much longer. This would not been
a problem if these names had been defined as {\TeX} macros.

We should properly trigger the operation of GNU gettext which
provides support for multiple message catalogs.  The initialization of
locale data is done with more or less the same code in every program,
as demonstrated below.  The variables |PACKAGE| and |LOCALEDIR| are
initialized in \.{Makefile}.  
@^Makefile@>

The ``banner line'' defined here should be changed whenever \.{CWEAVE}
is modified.

@d banner _("This is CWEAVE-NLS (Version 3.64k)\n")
@z

Section 38.

@x
@ @<Include...@>=
#include <ctype.h> /* definition of |isalpha|, |isdigit| and so on */
#include <stdlib.h> /* definition of |exit| */
@y
@ Each \CEE/ module having strings translated should include |libintl.h|
header file.

@d _(String) gettext(String) /* shorthand for marking translatable strings */

@<Include...@>=
#include <ctype.h> /* definition of |isalpha|, |isdigit| and so on */
#include <stdlib.h> /* definition of |exit| */
#include <locale.h> /* required by an application using NLS */
#include <libintl.h> /* definition of |gettext| */
@^National Language Support@>
@^system dependencies@>
@^Makefile@>
@z


Section 102.

The original `ctangle' program used for bootstrapping
internationalized `ctangle' does not find `prod.w'.

@x
@i prod.w
@y
@z
