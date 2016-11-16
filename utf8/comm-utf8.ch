@x
@<Include files@>@/
@y
#include <wchar.h>
#include <limits.h>
@<Include files@>@/
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
  while (*k='\0', (ssize_t)mbstowcs(NULL, buffer, 0)<buf_size-1 && (c=getc(fp)) != EOF && c!='\n')
    if ((*(k++) = c) != ' ') limit = k;
  if (mbstowcs(NULL, buffer, 0)>=buf_size-1)
@z

@x
char change_buffer[buf_size]; /* next line of |change_file| */
@y
char change_buffer[buf_size*MB_LEN_MAX]; /* next line of |change_file| */
@z
