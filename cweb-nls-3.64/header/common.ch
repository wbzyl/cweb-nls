% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.

@x l.1418
@** Index.
@y
@* Common definitions. The file |"common.h"| must be manually
updated whenever new stuff is added to |"common.w"|. The purpose
of this change is to eliminate this manual editing.

@(cweb.h@>=
typedef char unsigned eight_bits;
extern boolean program; /* \.{CWEAVE} or \.{CTANGLE}? */
extern int phase; /* which phase are we in? */
extern char buffer[]; /* where each line of input goes */
extern char *buffer_end; /* end of |buffer| */
extern char *loc; /* points to the next character to be read from the buffer*/
extern char *limit; /* points to the last character in the buffer */
typedef struct name_info {
  char *byte_start; /* beginning of the name in |byte_mem| */
  struct name_info *link;
  union {
    struct name_info *Rlink; /* right link in binary search tree for section
      names */
    char Ilk; /* used by identifiers in \.{CWEAVE} only */
  } dummy;
  char *equiv_or_xref; /* info corresponding to names */
} name_info; /* contains information about an identifier or section name */
typedef name_info *name_pointer; /* pointer into array of \&{name\_info}s */
typedef name_pointer *hash_pointer;
extern char byte_mem[]; /* characters of names */
extern char *byte_mem_end; /* end of |byte_mem| */
extern name_info name_dir[]; /* information about names */
extern name_pointer name_dir_end; /* end of |name_dir| */
extern name_pointer name_ptr; /* first unused position in |byte_start| */
extern char *byte_ptr; /* first unused position in |byte_mem| */
extern name_pointer hash[]; /* heads of hash lists */
extern hash_pointer hash_end; /* end of |hash| */
extern hash_pointer h; /* index into hash-head array */
extern name_pointer id_lookup(); /* looks up a string in the identifier table */
extern name_pointer section_lookup(); /* finds section name */
extern void print_section_name(), sprint_section_name();
extern int history; /* indicates how bad this run was */
extern void err_print(); /* print error message and context */
extern int wrap_up(); /* indicate |history| and exit */
extern void fatal(); /* issue error message and die */
extern void overflow(); /* succumb because a table has overflowed */
extern int include_depth; /* current level of nesting */
extern FILE *file[]; /* stack of non-change files */
extern FILE *change_file; /* change file */
extern char C_file_name[]; /* name of |C_file| */
extern char tex_file_name[]; /* name of |tex_file| */
extern char idx_file_name[]; /* name of |idx_file| */
extern char scn_file_name[]; /* name of |scn_file| */
extern char file_name[][max_file_name_length];
  /* stack of non-change file names */
extern char change_file_name[]; /* name of change file */
extern int line[]; /* number of current line in the stacked files */
extern int change_line; /* number of current line in change file */
extern boolean input_has_ended; /* if there is no more input */
extern boolean changing; /* if the current line is from |change_file| */
extern boolean web_file_open; /* if the web file is being read */
extern void reset_input(); /* initialize to read the web file and change file */
extern int get_line(); /* inputs the next line */
extern void check_complete(); /* checks that all changes were picked up */
typedef unsigned short sixteen_bits;
extern sixteen_bits section_count; /* the current section number */
extern boolean changed_section[]; /* is the section changed? */
extern boolean change_pending; /* is a decision about change still unclear? */
extern boolean print_where; /* tells \.{CTANGLE} to print line and file info */
extern int argc; /* copy of |ac| parameter to |main| */
extern char **argv; /* copy of |av| parameter to |main| */
extern boolean flags[]; /* an option for each 7-bit code */
extern FILE *C_file; /* where output of \.{CTANGLE} goes */
extern FILE *tex_file; /* where output of \.{CWEAVE} goes */
extern FILE *idx_file; /* where index from \.{CWEAVE} goes */
extern FILE *scn_file; /* where list of sections from \.{CWEAVE} goes */
extern FILE *active_file; /* currently active file for \.{CWEAVE} output */
extern void common_init();

@ Inne definicje. 

@(cweb.h@>=
char section_text[longest_name+1]; /* name being sought for */
char *section_text_end = section_text+longest_name; /* end of |section_text| */
char *id_first; /* where the current identifier begins in the buffer */
char *id_loc; /* just after the current identifier in the buffer */

@** Index.
@z

