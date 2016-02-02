% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.
 
Limbo.

@x l.1
% This file is part of CWEB.
% This program by Silvio Levy and Donald E. Knuth
% is based on a program by Knuth.
% It is distributed WITHOUT ANY WARRANTY, express or implied.
% Version 3.64 --- February 2002
% (same as Version 3.5 except for minor corrections)
% (also quotes backslashes in file names of #line directives)

% Copyright (C) 1987,1990,1993,2000 Silvio Levy and Donald E. Knuth
@y
% This file is part of CWEB-NLS.
% This program by Wlodek Bzyl
% is based on a program by Levy and Knuth.
% It is distributed WITHOUT ANY WARRANTY, express or implied.
% Version 3.64k+NLS --- November 2002

% Copyright (C) 2002 Wlodek Bzyl
@z

@x l.27
\def\title{CTANGLE (Version 3.64)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CTANGLE} processor}
  \vskip 15pt
  \centerline{(Version 3.64)}
  \vfill}
\def\botofcontents{\vfill
\noindent
Copyright \copyright\ 1987, 1990, 1993, 2000 Silvio Levy and Donald E. Knuth
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\title{CTANGLE-NLS (Version 3.64k)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The CTANGLE-NLS processor}
  \vskip 15pt
  \centerline{(Version 3.64k)}
  \vfill}
\def\botofcontents{\vfill
\noindent
Copyright \copyright\ 2002 Wlodek Bzyl
@z

This change can not be applied when `tie' is  used
(TOC file can not be typeset).

%@x l.46
%\let\maybe=\iftrue
%@y
%\let\maybe=\iffalse % print only sections that change
%@z


Section 1.

@x l.49
This is the \.{CTANGLE} program by Silvio Levy and Donald E. Knuth,
based on \.{TANGLE} by Knuth.
We are thankful to
Nelson Beebe, Hans-Hermann Bode (to whom the \CPLUSPLUS/ adaptation is due),
Klaus Guntermann, Norman Ramsey, Tomas Rokicki, Joachim Schnitter,
Joachim Schrod, Lee Wittenberg, and others who have contributed improvements.

The ``banner line'' defined here should be changed whenever \.{CTANGLE}
is modified.

@d banner "This is CTANGLE (Version 3.64)\n"
@y
This is the internationalized \.{CTANGLE-NLS} program by W{\l}odek Bzyl
based on \.{CTANGLE} by Levy and Knuth.

The ``banner line'' defined here should be changed whenever \.{CTANGLE-NLS}
is modified.

@d banner _("This is CTANGLE-NLS (Version 3.64k)\n")
@z


Section 62.

@x l.888
@ @<Include...@>=
#include <ctype.h> /* definition of |isalpha|, |isdigit| and so on */
#include <stdlib.h> /* definition of |exit| */
@y
@ Each \CEE/ module having translated strings should include
|libintl.h| header file.
@^National Language Support@>

@d _(String) gettext(String) /* shorthand for marking translatable strings */

@<Include...@>=
#include <stdio.h>
#include <ctype.h> /* definition of |isalpha|, |isdigit| and so on */
#include <stdlib.h> /* definition of |exit| */
#include <locale.h> /* required by an application using NLS */
#include <libintl.h> /* definition of |gettext| */
@z
