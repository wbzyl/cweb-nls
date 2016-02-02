% THIS FILE BELONGS TO CWEB-NLS PACKAGE.

% Version 3.64 --- December 2003

% Copyright (C) 2003 Wlodek Bzyl

% Permission is granted to make and distribute verbatim copies of this
% document provided that the copyright notice and this permission notice
% are preserved on all copies.

% Permission is granted to copy and distribute modified versions of this
% document under the conditions for verbatim copying, provided that the
% entire resulting derived work is distributed under the terms of a
% permission notice identical to this one.

% Please send comments, suggestions, etc. to matwb@@univ.gda.pl.

% The next few sections contain stuff from the file |"common.w"| that has
% to be included in both |"ctangle.w"| and |"cweave.w"|. It appears in this
% file |"common.h"|, which needs to be updated when |"common.w"| changes.

First comes general stuff:

@d ctangle 0
@d cweave 1

@ Code related to the character set:
@^ASCII code dependencies@>

@d and_and 04 /* `\.{\&\&}'\,; corresponds to MIT's {\tentex\char'4} */
@d lt_lt 020 /* `\.{<<}'\,;  corresponds to MIT's {\tentex\char'20} */
@d gt_gt 021 /* `\.{>>}'\,;  corresponds to MIT's {\tentex\char'21} */
@d plus_plus 013 /* `\.{++}'\,;  corresponds to MIT's {\tentex\char'13} */
@d minus_minus 01 /* `\.{--}'\,;  corresponds to MIT's {\tentex\char'1} */
@d minus_gt 031 /* `\.{->}'\,;  corresponds to MIT's {\tentex\char'31} */
@d not_eq 032 /* `\.{!=}'\,;  corresponds to MIT's {\tentex\char'32} */
@d lt_eq 034 /* `\.{<=}'\,;  corresponds to MIT's {\tentex\char'34} */
@d gt_eq 035 /* `\.{>=}'\,;  corresponds to MIT's {\tentex\char'35} */
@d eq_eq 036 /* `\.{==}'\,;  corresponds to MIT's {\tentex\char'36} */
@d or_or 037 /* `\.{\v\v}'\,;  corresponds to MIT's {\tentex\char'37} */
@d dot_dot_dot 016 /* `\.{...}'\,;  corresponds to MIT's {\tentex\char'16} */
@d colon_colon 06 /* `\.{::}'\,;  corresponds to MIT's {\tentex\char'6} */
@d period_ast 026 /* `\.{.*}'\,;  corresponds to MIT's {\tentex\char'26} */
@d minus_gt_ast 027 /* `\.{->*}'\,;  corresponds to MIT's {\tentex\char'27} */

@ Code related to input routines:

@d xisalpha(c) (isalpha(c)&&((eight_bits)c<0200))
@d xisdigit(c) (isdigit(c)&&((eight_bits)c<0200))
@d xisspace(c) (isspace(c)&&((eight_bits)c<0200))
@d xislower(c) (islower(c)&&((eight_bits)c<0200))
@d xisupper(c) (isupper(c)&&((eight_bits)c<0200))
@d xisxdigit(c) (isxdigit(c)&&((eight_bits)c<0200))

@ Code related to identifier and section name storage:
@d length(c) (c+1)->byte_start-(c)->byte_start /* the length of a name */
@d print_id(c) term_write((c)->byte_start,length((c))) /* print identifier */
@d llink link /* left link in binary search tree for section names */
@d rlink dummy.Rlink /* right link in binary search tree for section names */
@d root name_dir->rlink /* the root of the binary search tree
  for section names */
@d chunk_marker 0

@ Code related to error handling:
@d spotless 0 /* |history| value for normal jobs */
@d harmless_message 1 /* |history| value when non-serious info was printed */
@d error_message 2 /* |history| value when an error was noted */
@d fatal_message 3 /* |history| value when we had to stop prematurely */
@d mark_harmless {if (history==spotless) history=harmless_message;}
@d mark_error history=error_message
@d confusion(s) fatal("! This can't happen: ",s)

@ Code related to file handling:
@f line x /* make |line| an unreserved word */
@d max_file_name_length 60
@d cur_file file[include_depth] /* current file */
@d cur_file_name file_name[include_depth] /* current file name */
@d web_file_name file_name[0] /* main source file name */
@d cur_line line[include_depth] /* number of current line in current file */

@ Code related to command line arguments:
@d show_banner flags['b'] /* should the banner line be printed? */
@d show_progress flags['p'] /* should progress reports be printed? */
@d show_happiness flags['h'] /* should lack of errors be announced? */

@ Code relating to output:
@d update_terminal fflush(stdout) /* empty the terminal output buffer */
@d new_line putchar('\n') @d putxchar putchar
@d term_write(a,b) fflush(stdout),fwrite(a,sizeof(char),b,stdout)
@d C_printf(c,a) fprintf(C_file,c,a)
@d C_putc(c) putc(c,C_file)
