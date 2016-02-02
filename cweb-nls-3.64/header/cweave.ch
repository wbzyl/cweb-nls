% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.

@x l.70
@c @<Include files@>@/
@h
@<Common code for \.{CWEAVE} and \.{CTANGLE}@>@/
@y
@c @<Include files@>@/
#include <kpathsea/kpathsea.h> /* include every \Kpathsea/ header */
@h
#include "cweb.h"
@z


@x l.77
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


@x l.139
@ The next few sections contain stuff from the file |"common.w"| that must
be included in both |"ctangle.w"| and |"cweave.w"|. It appears in
file |"common.h"|, which needs to be updated when |"common.w"| changes.

@i common.h
@y
@ The next few sections contain definitions from the file |"common.w"| that must
be included in both |"ctangle.w"| and |"cweave.w"|. It appears in
file |"config.w"|, which needs to be updated when |"common.w"| changes.

The definitions from the file |"common.w"| should be removed
and input from the file |"config.w"| (?).

@i config.w
@z


These changes make a C compiler happy.

@x l.779
  case '-': if (*loc=='-') {compress(minus_minus);}
    else if (*loc=='>') if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt); break;
@y
  case '-': if (*loc=='-') {compress(minus_minus);}
    else if (*loc=='>') {if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt);} break;
@z


@x l.870
    if (c=='\\') if (loc>=limit) continue;
      else if (++id_loc<=section_text_end) {
        *id_loc = '\\'; c=*loc++;
      }
@y
    if (c=='\\') {if (loc>=limit) continue;
      else if (++id_loc<=section_text_end) {
        *id_loc = '\\'; c=*loc++;
      }}
@z


@x l.1607
else if (c=='\\' && *loc!='@@')
  if (phase==2) app_tok(*(loc++)) else loc++;
@y
else if (c=='\\' && *loc!='@@')
  {if (phase==2) app_tok(*(loc++)) else loc++;}
@z


@x l.3927
    if (b=='\'' || b=='"')
      if (delim==0) delim=b;
      else if (delim==b) delim=0;
@y
    if (b=='\'' || b=='"') {
      if (delim==0) delim=b;
      else if (delim==b) delim=0;
    }
@z


@x l.4088
      if (*(out_ptr-1)=='\\')
@.\\6@>
@.\\7@>
@.\\Y@>
        if (*out_ptr=='6') out_ptr-=2;
        else if (*out_ptr=='7') *out_ptr='Y';
@y
      if (*(out_ptr-1)=='\\') {
@.\\6@>
@.\\7@>
@.\\Y@>
        if (*out_ptr=='6') out_ptr-=2;
        else if (*out_ptr=='7') *out_ptr='Y';
      }
@z
