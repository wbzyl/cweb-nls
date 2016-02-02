% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.


Section 3.

@x
compressed form; then it shuffles and outputs the code.
@y
compressed form; then it shuffles and outputs the code.

We should properly trigger the operation of GNU gettext which
provides support for multiple message catalogs.  The initialization of
locale data is done with more or less the same code in every program,
as demonstrated below.  The variables |PACKAGE| and |LOCALEDIR| are
initialized in \.{Makefile}.  
@^Makefile@>
@^National Language Support (NLS)@>
@.GNU gettext@>
@z

@x 
  program=ctangle;
@y
  program=ctangle;
  current_collate_locale=setlocale(LC_MESSAGES,"");
	/* select |LC_MESSAGES| locale on the run-time */
  setlocale(LC_CTYPE,current_collate_locale);
            /* this seems to be necessary with the recent
               implementation of locales; setting |LC_MESSAGES|
               only makes terminal output the question marks
               `?' instead of the Polish diacritics */
  bindtextdomain(PACKAGE,LOCALEDIR);
	/* select a new base directory for the \.{CWEB-NLS} 
	   message catalog */
  textdomain(PACKAGE);
	/* instead of the default \.{messages.po}, select a new name 
	   for message catalog */
@z

@x
@ The following parameters were sufficient in the original \.{TANGLE} to
handle \TEX/,
@y
@ @<Global variables@>=
char *current_collate_locale; /* remember the current locale */

@ The following parameters were sufficient in the original \.{TANGLE} to
handle \TEX/,
@z
