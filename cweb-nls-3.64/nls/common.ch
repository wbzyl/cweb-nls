% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.


Section 3.

@x l.93
  @<Set the default options common to \.{CTANGLE} and \.{CWEAVE}@>;
@y
  @<Set the default options common to \.{CTANGLE} and \.{CWEAVE}@>;
  @<Use the current locale to initialize |xchr| and |xord| arrays@>@;
@z


Section 7. (Several new section are added.)

@x l.138
@d minus_gt_ast 027 /* `\.{->*}'\,;  corresponds to MIT's {\tentex\char'27} */
@y
@d minus_gt_ast 027 /* `\.{->*}'\,;  corresponds to MIT's {\tentex\char'27} */

@* Handling the national character set. 
\.{CWEB} programmers can use any 8-bit code from the forbidden range
128--255 within \TeX{} text and in the \CEE/ program. When character
with code above 127 occur in the identifier \.{CTANGLE} replace them
by standard ASCII alphanumeric. \.{CWEAVE} has more work to do. It has
to sort identifiers and section names using the alphabetic order as
specified by the current locale.
@^ASCII code dependencies@>
@^high-bit character handling@>

@d invalid_code 255 
   /* code that should not appear */
@d size sizeof(xchr[0]) 
   /* size of an object to be sorted: char${}+{}$terminating |NULL| */

@<Other definitions@>=
unsigned char xchr[255][2]; 
  /* collating order as specified by locale and $\S235$ of \.{CWEAVE} */
unsigned int xord[255];  
  /* specifies national character order */

@ The function |strcoll| is similar to |strcmp| but uses the collating
sequence of the current locale for collation. We use it to obtain the
collating sequence for single characters.
@^ASCII code dependencies@>
@^high-bit character handling@>
@^system dependencies@>

@f __compar_fn_t int

@c
int
compare_elements(char *p1, char *p2)
{
  return strcoll(p1,p2);
}
void
sort_strings(unsigned char array[], int nstrings)
{
  qsort(array, nstrings, size, (__compar_fn_t) compare_elements);
}

@ The desired collating order is specified by |xchr| array;
namely $|xchr|[0][0]<\cdots<|xchr|[255][0]$.
We use the order $\hbox{null}<\.\ <\hbox{other characters}
<{}$\.\_${}<\hbox{letters (uppercase${}={}$lowercase)}<\.0<\cdots<\.9.$ 

The collation mapping for digits and characters is computed from the
current locale. Next, from the |xchr[][0]| array the inverse mapping is
computed and remembered in the |xord| array.
@^ASCII code dependencies@>
@^high-bit character handling@>

@c
void
initialize_collating_tables() 
{
  int i; /* index into |xchr| array */
  int j; /* current character */
  int first_char_to_be_sorted; 
  int number_char_to_be_sorted; 

  xchr[0][0]='\0';
  xchr[1][0]=' ';
  for (i=2; i<=255; i++) { 
    xchr[i][0]=i; 
    xchr[i][1]='\0';
  }
  for (j=1,i=2; j<32; j++,i++) xchr[i][0]=j; 
  /* control characters; omit space */
  for (j=33; j<48; j++,i++) xchr[i][0]=j; 
  /* \.{!"\#\$\%\&'()*+,-./}; omit digits */
  for (j=58; j<65; j++,i++) xchr[i][0]=j; 
  /* \.{:;<=>?@@}; omit capital letters */
  for (j=91; j<97; j++,i++) xchr[i][0]=j; 
  /* \.{[\\]\^`}; omit small letters */
  for (j=123; j<127; j++,i++) xchr[i][0]=j;
  /* \.{\{\v\}\~\_} */
  first_char_to_be_sorted=i; 
  number_char_to_be_sorted=0;
  for (j=48; j<123; j++) 
    if (isalnum(j)) {
      xchr[i][0]=j;
      i++;
      number_char_to_be_sorted++;
    }
  for (j=128; j<=255; j++,i++) xchr[i][0]=j;
  number_char_to_be_sorted += (255-128);
  sort_strings(xchr[first_char_to_be_sorted], number_char_to_be_sorted);
  for (i=0; i<=255; i++) xord[i]=invalid_code;
  for (i=0; i<=255; i++) xord[xchr[i][0]]=i;
}

@ @<Predec...@>=
void initialize_collating_tables();

@ @<Use the current locale to initialize |xchr| and |xord| arrays@>=
initialize_collating_tables();

@z


Section 45.

@x l.811
are null-terminated, and we keep an eye open for prefixes and extensions.
@y
are null-terminated, and we keep an eye open for prefixes and extensions.

To compare characters from the 127--255 range we have to declare |*j|
and |*k| as |unsigned char|; otherwise we could end up with indexing
|xord| with negative numbers.
@z

@x l.820
  char *j, *k; /* beginning of first and second strings */
@y
  unsigned char *j, *k; /* beginning of first and second strings */
@z

@x l.823
  char *j1=j+j_len, *k1=k+k_len;
@y
  unsigned char *j1=j+j_len, *k1=k+k_len;
@z

@x l.828
  else if (*j<*k) return less;
@y
  else if (xord[*j]<xord[*k]) return less;
@z
