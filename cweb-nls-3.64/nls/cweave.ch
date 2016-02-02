% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.


Section 3.

@x l.88
file, finally it sorts and outputs the index.
@y
file, finally it sorts and outputs the index.

To trigger the national language support (NLS) we use the function
|setlocale()| (defined in the \.{locale.h} system library). 
The data read off |LC_COLLATE|, |LC_CTYPE| and |LC_MESSAGES| locales
is used by \.{CW}.
@z

@x l.104
  make_xrefs=force_lines=make_pb=1; /* controlled by command-line options */
@y
  setlocale(LC_MESSAGES,"");
	/* select |LC_MESSAGES| locale on the run-time */
  current_collate_locale=setlocale(LC_COLLATE,""); 
	/* fetch the value of the |LC_COLLATE| environment variable */
  setlocale(LC_CTYPE,current_collate_locale); 
	/* force |LC_CTYPE==LC_COLLATE| */

  bindtextdomain(PACKAGE,LOCALEDIR);
	/* select a new base directory for the \.{CWEB-NLS} 
	   message catalog */
  textdomain(PACKAGE);
	/* instead of the default \.{messages.po}, select a new name 
	   for message catalog */

  make_xrefs=force_lines=make_pb=1; /* controlled by command-line options */
@z

@x
  return wrap_up(); /* and exit gracefully */
@y
  @<Dump the current locale, |xchr| and |xord| arrays@>@;
  return wrap_up(); /* and exit gracefully */
@z


Section 15. New sections

@x
@* Data structures exclusive to {\tt CWEAVE}.
@y
@ The |xchr| and |xord| arrays are declared in \.{common.w}.

@<Predeclaration of procedures@>=
extern eight_bits xchr[255][2]; 
  /* collating order as specified by locale and $\S235$ of \.{CWEAVE} */
extern unsigned int xord[255];  
  /* specifies national character order */

@ Users can write \.{@@3} to dump on |stdout| the name of used locale,
collation tables used for sorting identifiers and section names.

@<Dump the current locale, |xchr| and |xord| arrays@>=
if (tracing==3)
{ 
  int i;

  printf("\nUsed locale: %s\n", current_collate_locale);
  printf("COLLATE array\n");
  for (i=0; i<=255; i++) { 
    if (isalnum(collate[i]) && !isspace(collate[i])) 
      fprintf(stdout,"%d:%c ",i,collate[i]);
    else 
      fprintf(stdout,"%d:%d ",i,collate[i]);
  if ((i+1)%10==0) printf("\n");
  }
  printf("\n");
  printf("XORD array:\n");
  for (i=0; i<=255; i++) { 
    if (isalnum(i) && !isspace(i)) fprintf(stdout,"%c:%d ",i,xord[i]);
    else fprintf(stdout,"%d:%d ",i,xord[i]);
  if ((i+1)%10==0) printf("\n");
  }
  printf("\n");
}

@ @<Global variables@>=
char *current_collate_locale; /* remember the current locale */

@* Data structures exclusive to {\tt CWEAVE}.
@z


Section 33.

@x
\.{@@2}, \.{@@1}, and \.{@@0} to turn tracing fully on, partly on,
and off, respectively.

@<Special control codes...@>=
ccode['0']=ccode['1']=ccode['2']=trace;
@y
\.{@@2}, \.{@@1}, \.{@@0}, and  \.{@@3} to turn tracing fully on, partly on,
and off, or dumping on |stderr| |xchr|/|xord| tables, respectively.
@^peeping mode@>
@^tracing the grammar rules@>

@<Special control codes...@>=
ccode['0']=ccode['1']=ccode['2']=ccode['3']=trace;
@z


Section 79.

@x l.1321
    flush_buffer(out_buf,0,0);
  }
}
@y
    flush_buffer(out_buf,0,0);
  }
}

@ If the file \.{cweb.nls} could not be found, do not look too hard.
Data provided by this file enables \.{cw} to instruct \.{tex} what format
and what encoding should be used for typesetting the file written by
\.{cw}. But you may know already this.
@.cweb.nls@>

@<Set init...@>= 
active_file=tex_file; /* must set here; not in the next section */
tex_putc('%'); /* always put the percent character at the first line */
if (current_collate_locale) {
  found_filename=kpse_find_file(CWEB_NLS_FILENAME,kpse_cweb_format,false); 
  if (found_filename && (nls_file=fopen(found_filename,"r"))) {
    @<Read and parse lines from \.{cweb.nls}@>@;
    fclose(nls_file);
    free(found_filename);
  }
}
tex_new_line;

@ @<Read and parse lines from \.{cweb.nls}@>=
char *current_line;
char *next_word;
int line_found = 0;
int number_of_words = 0;
while (!line_found && (current_line=read_line(nls_file))) {
  next_word=strtok(current_line,SPACE_DELIM);
  if (next_word && !strcmp(next_word,current_collate_locale)) {
    line_found=1;
    @<Output the command line for \.{tex}@>@;
    if (!line_found || number_of_words==0) {
      fprintf(stderr,_("! Incomplete line for language `%s' in %s\n"),
	      current_collate_locale,found_filename);
      mark_harmless;
    }
  }
  if (current_line) free(current_line);
}

@ @<Output the command line for \.{tex}@>=
while ((next_word=strtok(NULL,SPACE_DELIM))!=NULL) {
  if (!number_of_words++) tex_printf("&");
  tex_printf(next_word); tex_putc(' ');
}
@z


Section 80.

@x l.1331
out_ptr=out_buf+1; out_line=1; active_file=tex_file;
*out_ptr='c'; tex_printf("\\input cwebma");
@y
out_ptr=out_buf+1; out_line=1;
*out_ptr='x';
if (current_collate_locale!=NULL && 
    strcmp(current_collate_locale, "C") && 
    strcmp(current_collate_locale, "POSIX")) {
  tex_printf("\\input "); 
  tex_printf(current_collate_locale);
  tex_printf("/cweb-mac.te"); 
}
else {
  tex_printf("\\input C/cweb-mac.te");
}
@.cwebmac@>
@.cweb-..@>
@z


Section 229.

@x l.4241
      if (xisupper(c)) c=tolower(c);
@y
      if (isupper(c)) c=tolower(c);
@z


Section 234.

@x l.4276
$|collate|[0]<|collate|[1]<\cdots<|collate|[100]$.

@<Global...@>=
eight_bits collate[102+128]; /* collation order */
@y
$|collate|[0]<|collate|[1]<\cdots<|collate|[255]$.

@<Global...@>=
eight_bits collate[255]; /* collation order */
@z


Section 235.

@x
We initialize |collate| by copying a few characters at a time, because
some \CEE/ compilers choke on long strings.

@<Set init...@>=
collate[0]=0;
strcpy(collate+1," \1\2\3\4\5\6\7\10\11\12\13\14\15\16\17");
/* 16 characters + 1 = 17 */
strcpy(collate+17,"\20\21\22\23\24\25\26\27\30\31\32\33\34\35\36\37");
/* 16 characters + 17 = 33 */
strcpy(collate+33,"!\42#$%&'()*+,-./:;<=>?@@[\\]^`{|}~_");
/* 32 characters + 33 = 65 */
strcpy(collate+65,"abcdefghijklmnopqrstuvwxyz0123456789");
/* (26 + 10) characters + 65 = 101 */
strcpy(collate+101,"\200\201\202\203\204\205\206\207\210\211\212\213\214\215\216\217");
/* 16 characters + 101 = 117 */
strcpy(collate+117,"\220\221\222\223\224\225\226\227\230\231\232\233\234\235\236\237");
/* 16 characters + 117 = 133 */
strcpy(collate+133,"\240\241\242\243\244\245\246\247\250\251\252\253\254\255\256\257");
/* 16 characters + 133 = 149 */
strcpy(collate+149,"\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\277");
/* 16 characters + 149 = 165 */
strcpy(collate+165,"\300\301\302\303\304\305\306\307\310\311\312\313\314\315\316\317");
/* 16 characters + 165 = 181 */
strcpy(collate+181,"\320\321\322\323\324\325\326\327\330\331\332\333\334\335\336\337");
/* 16 characters + 181 = 197 */
strcpy(collate+197,"\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357");
/* 16 characters + 197 = 213 */
strcpy(collate+213,"\360\361\362\363\364\365\366\367\370\371\372\373\374\375\376\377");
/* 16 characters + 213 = 229 */
@y
@<Set init...@>= {
  int i;
  for (i=0; i<=255; i++) collate[i]=xchr[i][0];
}
@z


Section 237.

@x l.4337
  for (c=100+128; c>= 0; c--) if (bucket[collate[c]]) {
@y
  for (c=255; c>= 0; c--) if (bucket[collate[c]]) {
@z


Section 239.

@x l.4366
      if (xisupper(c)) c=tolower(c);
@y
      if (isupper(c)) c=tolower(c);
@z
