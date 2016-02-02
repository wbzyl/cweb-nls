% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.


Section 9.

@x
      ungetc(c,fp); loc=buffer; err_print("! Input line too long");
@y
      ungetc(c,fp); loc=buffer; err_print(_("! Input line too long"));
@z


Section 13.

@x
    err_print("! Missing @@x in change file");
@y
    err_print(_("! Missing @@x in change file"));
@z


Section 14.

@x
    err_print("! Change file ended after @@x");
@y
    err_print(_("! Change file ended after @@x"));
@z


Section 16.

@x
      err_print("! Change file ended before @@y");
@y
      err_print(_("! Change file ended before @@y"));
@z

@x
        err_print("! CWEB file ended during a change");
@y
        err_print(_("! CWEB file ended during a change"));
@z


Section 17.

@x
  loc=buffer+2; err_print("! Where is the matching @@y?");
@y
  loc=buffer+2; err_print(_("! Where is the matching @@y?"));
@z

@x
    printf("\n! Hmm... %d ",n);
@y
    printf(_("\n! Hmm... %d "),n);
@z

@x
    err_print("of the preceding lines failed to match");
@y
    err_print(_("of the preceding lines failed to match"));
@z


Section 19.

@x l.396
       fatal("! Cannot open input file ", web_file_name);
@y
       fatal(_("! Cannot open input file "), web_file_name);
@z

@x
       fatal("! Cannot open change file ", change_file_name);
@y
       fatal(_("! Cannot open change file "), change_file_name);
@z


Section 21.

@x
      err_print("! Include file name not given");
@y
      err_print(_("! Include file name not given"));
@z

@x
      err_print("! Too many nested includes");
@y
      err_print(_("! Too many nested includes"));
@z


Section 22.

@x
        err_print("! Include file name too long"); goto restart;}
@y
        err_print(_("! Include file name too long")); goto restart;}
@z


Section 23.

@x
  include_depth--; err_print("! Cannot open include file"); goto restart;
@y
  include_depth--; err_print(_("! Cannot open include file")); goto restart;
@z


Section 25.

@x
    err_print("! Change file ended without @@z");
@y
    err_print("! Change file ended without @@z");
@z 

@x
        err_print("! Where is the matching @@z?");
@y
        err_print(_("! Where is the matching @@z?"));
@z 


Section 26.

@x
    err_print("! Change file entry did not match");
@y
    err_print(_("! Change file entry did not match"));
@z


Section 39.

@x
  if (byte_ptr+l>byte_mem_end) overflow("byte memory");
  if (name_ptr>=name_dir_end) overflow("name");
@y
  if (byte_ptr+l>byte_mem_end) overflow(_("byte memory"));
  if (name_ptr>=name_dir_end) overflow(_("name"));
@z


Section 47.

@x
  if (s+name_len>byte_mem_end) overflow("byte memory");
  if (name_ptr+1>=name_dir_end) overflow("name");
@y
  if (s+name_len>byte_mem_end) overflow(_("byte memory"));
  if (name_ptr+1>=name_dir_end) overflow(_("name"));
@z


Section 48.

@x
  if (name_ptr>=name_dir_end) overflow("name");
@y
  if (name_ptr>=name_dir_end) overflow(_("name"));
@z

@x
  if (s+name_len>byte_mem_end) overflow("byte memory");
@y
  if (s+name_len>byte_mem_end) overflow(_("byte memory"));
@z


Section 52.

@x
      printf("\n! New name is a prefix of <");
@y
      printf(_("\n! New name is a prefix of <"));
@z

@x
      printf("\n! New name extends <");
@y
      printf(_("\n! New name extends <"));
@z

@x
    printf("\n! Section name incompatible with <");
@y
    printf(_("\n! Section name incompatible with <"));
@z

@x
    printf(">,\n which abbreviates <");
@y
    printf(_(">,\n which abbreviates <"));
@z


Section 59.

@x
  printf(". (l. %d of change file)\n", change_line);
else if (include_depth==0) printf(". (l. %d)\n", cur_line);
  else printf(". (l. %d of include file %s)\n", cur_line, cur_file_name);
@y
  printf(_(". (l. %d of change file)\n"), change_line);
else if (include_depth==0) printf(_(". (l. %d)\n"), cur_line);
  else printf(_(". (l. %d of include file %s)\n"), cur_line, cur_file_name);
@z


Section 62.

@x
case spotless: if (show_happiness) printf("(No errors were found.)\n"); break;
case harmless_message:
  printf("(Did you see the warning message above?)\n"); break;
case error_message:
  printf("(Pardon me, but I think I spotted something wrong.)\n"); break;
case fatal_message: printf("(That was a fatal error, my friend.)\n");
@y
case spotless: if (show_happiness) printf(_("(No errors were found.)\n")); break;
case harmless_message:
  printf(_("(Did you see the warning message above?)\n")); break;
case error_message:
  printf(_("(Pardon me, but I think I spotted something wrong.)\n")); break;
case fatal_message: printf(_("(That was a fatal error, my friend.)\n"));
@z


Section 65.

@x
  printf("\n! Sorry, %s capacity exceeded",t); fatal("","");
@y
  printf(_("\n! Sorry, `%s' capacity exceeded"),t); fatal("","");
@z


Section 66.

@x
@d confusion(s) fatal("! This can't happen: ",s)
@y
@d confusion(s) fatal(_("! This can't happen: "),s)
@z


Section 75.

@x l.1353
"! Usage: ctangle [options] webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n"
@y
_("! Usage: ct [options] webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n")
@z

@x l.1357
"! Usage: cweave [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n"
@y
_("! Usage: cw [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
@z


Section 76.

@x
@ @<Complain about arg...@>= fatal("! Filename too long\n", *argv);
@y
@ @<Complain about arg...@>= fatal(_("! Filename too long\n"), *argv);
@z


Section 78.

@x
    fatal("! Cannot open output file ", C_file_name);
@y
    fatal(_("! Cannot open output file "), C_file_name);
@z

@x
    fatal("! Cannot open output file ", tex_file_name);
@y
    fatal(_("! Cannot open output file "), tex_file_name);
@z
