@x
@c @<Include files@>@/
@y
@c
#include <wchar.h>
#include <locale.h>
#include <wctype.h>
@<Include files@>@/
@z

@x
  argc=ac; argv=av;
@y
  setlocale(LC_CTYPE, "en_US.UTF-8");
  argc=ac; argv=av;
@z

@x
@d buf_size 100 /* maximum length of input line, plus one */
@y
@d buf_size 1000 /* maximum length of input line, plus one */
@z

@x
@d line_length 80 /* lines of \TEX/ output have at most this many characters;
@y
@d line_length 255 /* lines of \TEX/ output have at most this many characters;
@z

@x
@d out(c) {if (out_ptr>=out_buf_end) break_out(); *(++out_ptr)=c;}
@y
@<Predecl...@>=
void out(char c);
@ @c
void out(char c)
{
  int utf8count = 0;
  for (char *i = out_buf; i<=out_ptr; i++) {
    if ((((eight_bits)(*i) & (1<<7)) &&
          ((eight_bits)(*i) & (1<<6))) ||
          (~((eight_bits)(*i)) & (1<<7))) /* increase if 0x or 11x */
      utf8count++;
  }
  if (utf8count>80) break_out();
  *(++out_ptr)=c;
}
@ Dummy.
@z

@x
  int count; /* characters remaining before string break */
@y
  int count; /* characters remaining before string break */
  int finish_symbol;
@z

@x
  if (count==0) { /* insert a discretionary break in a long string */
     app_str(@q(@>@q{@>"}\\)\\.{"@q}@>); count=20;
@q(@>@.\\)@>
  }
@y
  if (count==0) {
     if (((eight_bits)(*id_first) & (1<<7)) &&
        (~((eight_bits)(*id_first)) & (1<<6))) { /* if we see 10x, move on */
       count=1;
       finish_symbol = 1;
     }
     else {
       finish_symbol = 0;
       app_str("}\\)\\.{");
       count=20;
     }
  }
@z

@x
  count--;
@y
  if (finish_symbol == 1) count--;
  else if ((((eight_bits)(*(id_first - 1)) & (1<<7)) &&
          ((eight_bits)(*(id_first - 1)) & (1<<6))) ||
          (~((eight_bits)(*(id_first - 1))) & (1<<7))) /* decrease only when we see 11x or 0x */
         count--;
@z

@x
  } else if (is_tiny(cur_name)) out('|')@;
@y
  } else if (is_tiny(cur_name)) out('|');
@z

@x
      if (xislower(*p)) { /* not entirely uppercase */
         delim='\\'; break;
      }
@y
      if (xislower(*p)) { /* not entirely uppercase */
         delim='\\'; break;
      }
      else if (ishigh(*p)) {
          char my_z;
          int my_n;
          int my_i;
          int my_k;
          my_n = 0;
          for (my_i = 6; my_i >= 0; my_i--) { /* count number of 1's after first 1 */
            my_z = 1 << my_i;
            if ((my_z & *p) == my_z) my_n++;
            else break;
          }
          wchar_t my_wc = 0;
          int my_y = my_n;
          int my_q = my_n;
          for (my_i = 0; my_i <= my_n; my_i++) { /* loop over all bytes of symbol */
            for (my_k = 5 - my_y; my_k >= 0; my_k--) { /* loop over all bits */
              my_z = 1 << my_k;
              if ((my_z & *p) == my_z) my_wc |= 1 << (6*my_q+my_k);
            }
            my_y = 0;
            my_q--;
            p++;
          }
          p--;
          if (iswlower(my_wc)) {
            delim = '\\';
            break;
          }
        }
@z

@x
      if (b!='0' || force_lines==0) out(b)@;
@y
      if (b!='0' || force_lines==0) out(b);
@z

@x
  else if (b!='|') out(b)
@y
  else if (b!='|') out(b);
@z

@x
        if (xislower(*j)) goto lowcase;
@y
        if (xislower(*j)) goto lowcase;
        else if (ishigh(*j)) {
          char my_z;
          int my_n;
          int my_i;
          int my_k;
          my_n = 0;
          for (my_i = 6; my_i >= 0; my_i--) { /* count number of 1's after first 1 */
            my_z = 1 << my_i;
            if ((my_z & *j) == my_z) my_n++;
            else break;
          }
          wchar_t my_wc = 0;
          int my_y = my_n;
          int my_q = my_n;
          for (my_i = 0; my_i <= my_n; my_i++) { /* loop over all bytes of symbol */
            for (my_k = 5 - my_y; my_k >= 0; my_k--) { /* loop over all bits */
              my_z = 1 << my_k;
              if ((my_z & *j) == my_z) my_wc |= 1 << (6*my_q+my_k);
            }
            my_y = 0;
            my_q--;
            j++;
          }
          j--;
          if (iswlower(my_wc))
            goto lowcase;
        }
@z
