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
