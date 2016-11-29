@x
@<Include files@>@/
@y
#include <wchar.h>
#include <limits.h>
@<Include files@>@/
size_t mbsntowcs (wchar_t *pwcs, const char *s, size_t n, size_t len)
{
  return mbsnrtowcs(pwcs, &s, n, len, NULL);
}
@z

@x
@d long_buf_size (buf_size+longest_name) /* for \.{CWEAVE} */
@y
@d long_buf_size (buf_size*MB_LEN_MAX+longest_name*MB_LEN_MAX) /* for \.{CWEAVE} */
@z

@x
char *buffer_end=buffer+buf_size-2; /* end of |buffer| */
@y
char *buffer_end=buffer+buf_size*MB_LEN_MAX-2; /* end of |buffer| */
@z

@x
  while (k<=buffer_end && (c=getc(fp)) != EOF && c!='\n')
    if ((*(k++) = c) != ' ') limit = k;
  if (k>buffer_end)
@y
  while ((ssize_t)mbsntowcs(NULL,buffer,k-buffer,0)<buf_size-1 && (c=getc(fp)) != EOF && c!='\n')
    if ((*(k++) = c) != ' ') limit = k;
  if (mbsntowcs(NULL,buffer,k-buffer,0)>=buf_size-1)
@z

@x
char change_buffer[buf_size]; /* next line of |change_file| */
@y
char change_buffer[buf_size*MB_LEN_MAX]; /* next line of |change_file| */
@z
