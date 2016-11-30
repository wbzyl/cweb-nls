@x l.70
@c @<Include files@>@/
@y
@c
#include <wchar.h>
#include <wctype.h>
#include <limits.h>
#include <locale.h>
@<Include files@>@/
size_t mbsntowcs (wchar_t *, const char *, size_t, size_t);
extern char *encTeX[];
int enc_lookup(wchar_t wc)
{
  int z;
  char mb[MB_CUR_MAX];

  if ((z = wctob(wc)) != EOF) return z;

  wctomb(mb, wc);

  for(z = 0x80; z <= 0xff; z++)
    if (strlen(encTeX[z]) && (strncmp(mb, encTeX[z], strlen(encTeX[z])) == 0))
      break;

  return z;
}
@z

@x l.102
  argc=ac; argv=av;
@y
  setlocale(LC_CTYPE, "en_US.UTF-8");
  argc=ac; argv=av;
@z

@x l.128
@d long_buf_size (buf_size+longest_name)
@y
@d long_buf_size (buf_size*MB_LEN_MAX+longest_name*MB_LEN_MAX)
@z

@x l.143
@i common.h
@y
@i comm-utf8.h
@z

@x l.270
@d is_tiny(p) ((p+1)->byte_start==(p)->byte_start+1)
@y
@d is_tiny(p) ((p+1)->byte_start==(p)->byte_start+mblen((p)->byte_start,MB_CUR_MAX))
@z

@x l.1300
char out_buf[line_length+1]; /* assembled characters */
@y
char out_buf[line_length*MB_LEN_MAX+1]; /* assembled characters */
@z

@x l.1302
char *out_buf_end = out_buf+line_length; /* end of |out_buf| */
@y
char *out_buf_end = out_buf+line_length*MB_LEN_MAX; /* end of |out_buf| */
@z

@x l.1380
@d out(c) {if (out_ptr>=out_buf_end) break_out(); *(++out_ptr)=c;}
@y
@d out(c) {
  if ((ssize_t)mbsntowcs(NULL,out_buf,out_ptr-out_buf+1,0)>line_length) break_out();
  *(++out_ptr)=c;
}
@z

@x l.3359
  if((eight_bits)(*id_first)>0177) {
    app_tok(quoted_char);
    app_tok((eight_bits)(*id_first++));
  }
@y
  if((eight_bits)(*id_first)>0177) {
    for (int w = mblen(id_first,MB_CUR_MAX); w > 0; w--) {
      app_tok(quoted_char);
      app_tok((eight_bits)(*id_first++));
    }
  }
@z

@x l.3696
  char scratch[longest_name]; /* scratch area for section names */
@y
  char scratch[longest_name*MB_LEN_MAX]; /* scratch area for section names */
@z

@x l.3752
      if (xislower(*p)) { /* not entirely uppercase */
         delim='\\'; break;
      }
@y
      if (xislower(*p)) { /* not entirely uppercase */
         delim='\\'; break;
      }
      else if (ishigh(*p)) {
          wchar_t wc;
          mbtowc(&wc, p, MB_CUR_MAX);
          if (iswlower(wc)) {
            delim='\\'; break;
          }
        }
@z

@x l.3768
  out((cur_name->byte_start)[0]);
@y
  for (int w = 0; w < mblen(cur_name->byte_start,MB_CUR_MAX); w++)
    out(*(cur_name->byte_start + w));
@z

@x l.4379
@<Do the first pass...@>= {
int c;
for (c=0; c<=255; c++) bucket[c]=NULL;
for (h=hash; h<=hash_end; h++) {
  next_name=*h;
  while (next_name) {
    cur_name=next_name; next_name=cur_name->link;
    if (cur_name->xref!=(char*)xmem) {
      c=(eight_bits)((cur_name->byte_start)[0]);
      if (xisupper(c)) c=tolower(c);
      blink[cur_name-name_dir]=bucket[c]; bucket[c]=cur_name;
    }
  }
}
}
@y
@<Do the first pass...@>= {
wchar_t wc;
for (int c=0; c<=255; c++) bucket[c]=NULL;
for (h=hash; h<=hash_end; h++) {
  next_name=*h;
  while (next_name) {
    cur_name=next_name; next_name=cur_name->link;
    if (cur_name->xref!=(char*)xmem) {
      mbtowc(&wc,cur_name->byte_start,MB_CUR_MAX);
      if (iswupper(wc)) wc=towlower(wc);
      blink[cur_name-name_dir]=bucket[enc_lookup(wc)]; bucket[enc_lookup(wc)]=cur_name;
    }
  }
}
}
@z

@x l.4505
  eight_bits c;
  next_name=sort_ptr->head;
  do {
    cur_name=next_name; next_name=blink[cur_name-name_dir];
    cur_byte=cur_name->byte_start+cur_depth;
    if (cur_byte==(cur_name+1)->byte_start) c=0; /* hit end of the name */
    else {
      c=(eight_bits) *cur_byte;
      if (xisupper(c)) c=tolower(c);
    }
  blink[cur_name-name_dir]=bucket[c]; bucket[c]=cur_name;
@y
  wchar_t wc;
  next_name=sort_ptr->head;
  do {
    cur_name=next_name; next_name=blink[cur_name-name_dir];
    cur_byte=cur_name->byte_start;
    for (int w = 0; w < cur_depth; w++)
      cur_byte+=mblen(cur_byte,MB_CUR_MAX);
    if (cur_byte==(cur_name+1)->byte_start) wc=0; /* hit end of the name */
    else {
      mbtowc(&wc,cur_byte,MB_CUR_MAX);
      if (iswupper(wc)) wc=towlower(wc);
    }
  blink[cur_name-name_dir]=bucket[enc_lookup(wc)]; bucket[enc_lookup(wc)]=cur_name;
@z

@x l.4536
        if (xislower(*j)) goto lowcase;
@y
        if (xislower(*j)) goto lowcase;
        else if (ishigh(*j)) {
          wchar_t wc;
          mbtowc(&wc, j, MB_CUR_MAX);
          if (iswlower(wc)) goto lowcase;
        }
@z
