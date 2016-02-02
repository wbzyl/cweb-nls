% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.


Section 2. 
We use the definition from `kpathsea/types.h':

  typedef enum { false = 0, true = 1 } boolean;

This should make no difference (I hope.)
Unfortunately this change forces change in `common.h'.

@x l.73
typedef short boolean;
@y
@z


Section 4.

@x l.92
  @<Initialize pointers@>;
@y
  @<Initialize pointers@>;
  @<Set up |PROGNAME| feature and initialize the search path mechanism@>;
@z


Section 19.

@x l.393
if ((web_file=fopen(web_file_name,"r"))==NULL) {
@y
if ((found_filename=kpse_find_cweb(web_file_name))==NULL ||
    (web_file=fopen(found_filename,"r"))==NULL) {
  free(found_filename);
@z

@x
  if ((web_file=fopen(web_file_name,"r"))==NULL)
@y
  if ((found_filename=kpse_find_cweb(web_file_name))==NULL ||
      (web_file=fopen(found_filename,"r"))==NULL)
@z

@x l.401
if ((change_file=fopen(change_file_name,"r"))==NULL)
@y
if ((found_filename=kpse_find_cweb(change_file_name))==NULL ||
    (change_file=fopen(found_filename,"r"))==NULL)
@z


Section 22.

@x l.466
#include <stdlib.h> /* declaration of |getenv| and |exit| */
@y
#include <stdlib.h> /* declaration of |getenv| and |exit| */
#include <kpathsea/kpathsea.h> /* include every \Kpathsea/ header */

@ The modified \Kpathsea/ libray contains a new category, named
|kpse_cweb_format|, for files to be searched. For finding these files
I~use |kpse_find_cweb| which is in turn an abbreviation for
|kpse_find_file|.  The last function returns the complete filename if
found, otherwise |NULL|. The |name| is looked for in prebuilt filename
databases (named \.{ls-R}). If the file is not found in the prebuilt
databases, the filesystem is searched for as described above.

@d kpse_find_cweb(name) kpse_find_file(name,kpse_cweb_format,true)

@ The simple file searching is replaced by `path searching' mechanism
that \Kpathsea/ library provides.

We set |kpse_program_name| to a |"nls"|.  This means if the
variable |CWEBINPUTS.nls| is present in \.{texmf.cnf} (or |CWEBINPUTS_nls|
in the environment) its value will be used as the search path for
filenames.  This allows different flawors of \.{CWEB} to have
different search paths.

@<Set up |PROGNAME| feature and initialize the search path mechanism@>=
kpse_set_program_name(argv[0], "nls"); 
@z


Section 23.

@x
  char temp_file_name[max_file_name_length];
  char *cur_file_name_end=cur_file_name+max_file_name_length-1;
  char *k=cur_file_name, *kk;
  int l; /* length of file name */
@y
  char *cur_file_name_end=cur_file_name+max_file_name_length-1;
  char *k=cur_file_name;
@z

@x l.482
  if ((cur_file=fopen(cur_file_name,"r"))!=NULL) {
@y
  if ((found_filename=kpse_find_cweb(cur_file_name))!=NULL &&
      (cur_file=fopen(found_filename,"r"))!=NULL) {
@z

Replaced by Kpathsea `kpse_find_file'

@x l.486
  kk=getenv("CWEBINPUTS");
  if (kk!=NULL) {
    if ((l=strlen(kk))>max_file_name_length-2) too_long();
    strcpy(temp_file_name,kk);
  }
  else {
#ifdef CWEBINPUTS
    if ((l=strlen(CWEBINPUTS))>max_file_name_length-2) too_long();
    strcpy(temp_file_name,CWEBINPUTS);
#else
    l=0;
#endif /* |CWEBINPUTS| */
  }
  if (l>0) {
    if (k+l+2>=cur_file_name_end)  too_long();
@.Include file name ...@>
    for (; k>= cur_file_name; k--) *(k+l+1)=*k;
    strcpy(cur_file_name,temp_file_name);
    cur_file_name[l]='/'; /* \UNIX/ pathname separator */
    if ((cur_file=fopen(cur_file_name,"r"))!=NULL) {
      cur_line=0; print_where=1;
      goto restart; /* success */
    }
  }
@y
@z


Section 67.

@x l.1205
the names of those files. Most of the 128 flags are undefined but available
for future extensions.
@y
the names of those files. Most of the 128 flags are undefined but available
for future extensions.

We use `kpathsea' library functions to find literate sources and
NLS configuration files. When the files you expect are not
being found, the thing to do is to enable `kpathsea' runtime
debugging by assigning to |kpathsea_debug| variable a small number
via `\.{-d}' option. The meaning of number is shown below. To set
more than one debugging options sum the corresponding numbers.
$$\halign{\hskip5em\tt\hfil#&&\qquad\tt#\cr
 1&report `\.{stat}' calls\cr
 2&report lookups in all hash tables\cr
 4&report file openings and closings\cr
 8&report path information\cr
16&report directory list\cr
32&report on each file search\cr
64&report values of variables being looked up\cr}$$
Debugging output is always written to |stderr|, and begins with the string
`\.{kdebug:}'.
@z

@x l.1211
@d show_happiness flags['h'] /* should lack of errors be announced? */
@y
@d show_happiness flags['h'] /* should lack of errors be announced? */
@d show_kpathsea_debug flags['d']
  /* should results of file searching be shown? */
@z

@x l.1227
show_banner=show_happiness=show_progress=1;
@y
show_banner=show_happiness=show_progress=1;
kpathsea_debug=0;
@z


Section 70.

@x l.1340
  else flag_change=1;
@y
  else flag_change=1;
  if (*(*argv+1)=='d') {
     if (sscanf(*argv+2,"%u",&kpathsea_debug)!=1) @<Print usage error...@>;
  }
@z

Section 74.

@x
    flags[*dot_pos]=flag_change;
@y
    flags[(unsigned char)*dot_pos]=flag_change;
@z


Section 77.

@x l.1372
FILE *active_file; /* currently active file for \.{CWEAVE} output */
@y
FILE *active_file; /* currently active file for \.{CWEAVE} output */
char *found_filename; /* filename found by |kpse_find_file| */
@z
