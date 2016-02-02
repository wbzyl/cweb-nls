% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.


Section 10. Included from `common.h'
	    The tie program does not read included files!
	    but the wmerge program does.

%@x
%@d confusion(s) fatal("! This can't happen: ",s)
%@y
%@d confusion(s) fatal(_("! This can't happen: "),s)
%@z


Section 34.

@x
    printf("\n! Not present: <");
@y
    printf(_("\n! Not present: <"));
@z


Section 40.

@x
      overflow("output files");
@y
      overflow(_("output files"));
@z


Section 42.

@x
    printf("\n! No program text was specified."); mark_harmless;
@y
    printf(_("\n! No program text was specified.")); mark_harmless;
@z

@x
        printf("\nWriting the output file (%s):",C_file_name);
@y
        printf(_("\nWriting the output file (%s):"),C_file_name);
@z

@x
        printf("\nWriting the output files:");
@y
        printf(_("\nWriting the output files:"));
@z

@x
    if(show_happiness) printf("\nDone.");
@y
    if(show_happiness) printf(_("\nDone."));
@z


Section 43.

@x
    if (C_file ==0) fatal("! Cannot open output file:",output_file_name);
@y
    if (C_file ==0) fatal(_("! Cannot open output file:"),output_file_name);
@z


Section 47.

@x
          else if (a<050000) { confusion("macro defs have strange char");}
@y
          else if (a<050000) { confusion(_("macro defs have strange char"));}
@z


Section 60.

@x
          err_print("! Input ended in mid-comment");
@y
          err_print(_("! Input ended in mid-comment"));
@z

@x
        err_print("! Section name ended in mid-comment"); loc--;
@y
        err_print(_("! Section name ended in mid-comment")); loc--;
@z


Section 67.

@x
        err_print("! String didn't end"); loc=limit; break;
@y
        err_print(_("! String didn't end")); loc=limit; break;
@z

@x
        err_print("! Input ended in middle of string"); loc=buffer; break;
@y
        err_print(_("! Input ended in middle of string")); loc=buffer; break;
@z

@x
    printf("\n! String too long: ");
@y
    printf(_("\n! String too long: "));
@z


Section 68.

@x
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z

@x
        err_print("! Double @@ should be used in control text");
@y
        err_print(_("! Double @@ should be used in control text"));
@z


Section 69.

@x
        err_print("! Double @@ should be used in ASCII constant");
@y
        err_print(_("! Double @@ should be used in ASCII constant"));
@z

@x
        err_print("! String didn't end"); loc=limit-1; break;
@y
        err_print("! String didn't end"); loc=limit-1; break;
@z


Section 72.

@x
    err_print("! Input ended in section name");
@y
    err_print(_("! Input ended in section name"));
@z

@x
  printf("\n! Section name too long: ");
@y
  printf(_("\n! Section name too long: "));
@z


Section 73.

@x
    err_print("! Section name didn't end"); break;
@y
    err_print(_("! Section name didn't end")); break;
@z

@x
    err_print("! Nesting of section names not allowed"); break;
@y
    err_print(_("! Nesting of section names not allowed")); break;
@z


Section 74.

@x
  if (loc>=limit) err_print("! Verbatim string didn't end");
@y
  if (loc>=limit) err_print(_("! Verbatim string didn't end"));
@z


Section 78.

@x
    err_print("! @@d, @@f and @@c are ignored in C text"); continue;
@y
    err_print(_("! @@d, @@f and @@c are ignored in C text")); continue;
@z


Section 79.

@x
  if (*try_loc=='=') err_print ("! Missing `@@ ' before a named section");
@y
  if (*try_loc=='=') err_print (_("! Missing `@@ ' before a named section"));
@z


Section 80.

@x
      else err_print("! Double @@ should be used in string");
@y
      else err_print(_("! Double @@ should be used in string"));
@z


Section 81.

@x
    default: err_print("! Unrecognized escape sequence");
@y
    default: err_print(_("! Unrecognized escape sequence"));
@z


Section 85.

@x
    err_print("! Definition flushed, must start with identifier");
@y
    err_print(_("! Definition flushed, must start with identifier"));
@z


Section 93.

@x
            err_print("! Double @@ should be used in control text");
@y
            err_print(_("! Double @@ should be used in control text"));
@z

@x
        default: err_print("! Double @@ should be used in limbo");
@y
        default: err_print(_("! Double @@ should be used in limbo"));
@z


Section 94.

@x
    err_print("! Improper hex number following @@l");
@y
    err_print(_("! Improper hex number following @@l"));
@z

@x
      err_print("! Replacement string in @@l too long");
@y
      err_print(_("! Replacement string in @@l too long"));
@z



Section 95.

@x
  printf("\nMemory usage statistics:\n");
  printf("%ld names (out of %ld)\n",
          (long)(name_ptr-name_dir),(long)max_names);
  printf("%ld replacement texts (out of %ld)\n",
          (long)(text_ptr-text_info),(long)max_texts);
  printf("%ld bytes (out of %ld)\n",
          (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf("%ld tokens (out of %ld)\n",
@y
  printf(_("\nMemory usage statistics:\n"));
  printf(_("%ld names (out of %ld)\n"),
          (long)(name_ptr-name_dir),(long)max_names);
  printf(_("%ld replacement texts (out of %ld)\n"),
          (long)(text_ptr-text_info),(long)max_texts);
  printf(_("%ld bytes (out of %ld)\n"),
          (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf(_("%ld tokens (out of %ld)\n"),
@z
