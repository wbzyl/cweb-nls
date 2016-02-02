% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.

Section 1.

@x l.71
@<Predeclaration of procedures@>
@y
@<Predeclaration of procedures@>

@ The \.{ctangle} and \.{cweave} programs from the original \.{CWEB}
package use the compile-time default directory or the value of the
environment variable \.{CWEBINPUTS} as an alternative place to be
searched for files, if they could not be found in the current
directory.

The \.{ct} and \.{cw} programs from the \.{CWEB-NLS} use 
a slightly modified \Kpathsea/ library for searching files. 
The directories to be searched for come from three sources:

 (a)~a user-set environment variable \.{CWEBINPUTS}
    (overriden by \.{CWEBINPUTS\_nls});\par
 (b)~a line in \Kpathsea/ configuration file \.{texmf.cnf},\hfil\break
    e.g. \.{CWEBINPUTS=.:\$TEXMF/texmf/cweb//}
    or \.{CWEBINPUTS.nls=.:\$TEXMF/texmf/cweb//};\hangindent=2\parindent\par
 (c)~compile-time default directories \.{.:\$TEXMF/texmf/cweb//}
    (specified in \.{texmf.in}).

Being able to specify directories to be searched for files on the
run-time should help to unclutter the working directory. Only the
files we are working on are kept in the current directory --- any other
files could be placed anywhere on the filesystem.

@ To ease typeseting an appropriate command line for \.{tex} is 
constructed and written as the first line of the file produced
by \.{cw}, e.g. whenever the current language is Polish the line reads
 \medskip
 \.{\%\&mex -translate-file=iso2-pl}
 \medskip
 \noindent Now it suffices to execute 
 \medskip
 \.{tex }$\langle$name of the file produced by \.{cw}$\rangle$
 \medskip
 \noindent and the file will be typeset correctly, i.e.  the required
format file will be used and the file will be recoded, in the case of
the Polish language, from the ISO 8859-2 encoding to the \.{PL} encoding
which is the encoding of the font used for typeseting.
This uses the TCX mechanism of translating \.{tex} input/output.

The format name and the command line options are read from the NLS
configuration file \.{cweb.nls}.  The format of \.{cweb.nls} is straightforward:

(a) comments start with `\.{\%}' and continue to the end of line,\par
(b) blank lines are ignored,\par
(c) non blank line is broken up into serires of non-whitespace
    characters; the first word is the ISO~639 five letter language symbol;
    the second word is the format name; following words are options
    to be passed to \.{tex}.\hangindent=2\parindent\par
@^system dependencies@>
@^I/O translation@>
@^TCX files@>
@^CWEB configuration file@>

@d CWEB_NLS_FILENAME "cweb.nls"
@d SPACE_DELIM " \t" /* used to broke lines from \.{cweb.nls} into {\it words} */
@z

@x l.207
@<Global...@>=
boolean change_exists; /* has any section changed? */
@y
@<Global...@>=
boolean change_exists; /* has any section changed? */
extern char *found_filename; /* filename found by |kpse_find_file| */
FILE *nls_file; /* NLS configuration file */
@z
