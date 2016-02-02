% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.


@x l.65
@<Include files@>@/
@h
@<Common code for \.{CWEAVE} and \.{CTANGLE}@>@/
@y
@<Include files@>@/
#include <kpathsea/kpathsea.h> /* include every \Kpathsea/ header */
@h
#include "cweb.h"
@z


@x l.75
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


@x l.123
@ The next few sections contain stuff from the file |"common.w"| that must
be included in both |"ctangle.w"| and |"cweave.w"|. It appears in
file |"common.h"|, which needs to be updated when |"common.w"| changes.

@i common.h
@y
@ The next few sections contain definitions from the file |"common.w"| that must
be included in both |"ctangle.w"| and |"cweave.w"|. It appears in
file |"config.w"|, which needs to be updated when |"common.w"| changes.

@i config.w
@z


This change removes the compiler warning: "suggest explicit braces
to avoid ambiguous `else'"

@x l.953
    else if (*loc=='>') if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt); break;
@y
    else if (*loc=='>') {if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt);} break;
@z
