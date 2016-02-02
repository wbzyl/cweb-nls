% THIS IS FILE BELONGS TO CWEB-NLS PACKAGE.


Section 21.

@x
@d append_xref(c) if (xref_ptr==xmem_end) overflow("cross-reference");
@y
@d append_xref(c) if (xref_ptr==xmem_end) overflow(_("cross-reference"));
@z


Section 49.

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


Section 50.

@x
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z


Section 53.

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


Section 54.

@x
    err_print("! Section name didn't end"); break;
@y
    err_print(_("! Section name didn't end")); break;
@z

@x
    err_print("! Control codes are forbidden in section name"); break;
@y
    err_print(_("! Control codes are forbidden in section name")); break;
@z


Section 56

@x
    err_print("! Control text didn't end"); loc=limit;
@y
    err_print(_("! Control text didn't end")); loc=limit;
@z

@x
      err_print("! Control codes are forbidden in control text");
@y
      err_print(_("! Control codes are forbidden in control text"));
@z


Section 57.

@x
  if (loc>=limit) err_print("! Verbatim string didn't end");
@y
  if (loc>=limit) err_print(_("! Verbatim string didn't end"));
@z


Section 61.

@x
  if (++section_count==max_sections) overflow("section number");
@y
  if (++section_count==max_sections) overflow(_("section number"));
@z


Section 66.

@x
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z


Section 71.

@x
    err_print("! Missing left identifier of @@s");
@y
    err_print(_("! Missing left identifier of @@s"));
@z

@x
      err_print("! Missing right identifier of @@s");
@y
      err_print(_("! Missing right identifier of @@s"));
@z


Section 75.

@x
      printf("\n! Never defined: <"); print_section_name(p); putchar('>'); mark_harmless;
@y
      printf(_("\n! Never defined: <")); print_section_name(p); putchar('>'); mark_harmless;
@z

@x
      printf("\n! Never used: <"); print_section_name(p); putchar('>'); mark_harmless;
@y
      printf(_("\n! Never used: <")); print_section_name(p); putchar('>'); mark_harmless;
@z


Section 85.

@x
  printf("\n! Line had to be broken (output l. %d):\n",out_line);
@y
  printf(_("\n! Line had to be broken (output l. %d):\n"),out_line);
@z


Section 88.

@x
        default: err_print("! Double @@ should be used in limbo");
@y
        default: err_print(_("! Double @@ should be used in limbo"));
@z


Section 91.

@x
@d app_tok(c) {if (tok_ptr+2>tok_mem_end) overflow("token"); *(tok_ptr++)=c;}
@y
@d app_tok(c) {if (tok_ptr+2>tok_mem_end) overflow(_("token")); *(tok_ptr++)=c;}
@z


Section 92.

@x
          err_print("! Input ended in mid-comment");
@y
          err_print(_("! Input ended in mid-comment"));
@z

@x
        if (bal>1) err_print("! Missing } in comment");
@y
        if (bal>1) err_print(_("! Missing } in comment"));
@z

@x
      else {err_print("! Extra } in comment");
@y
      else {err_print(_("! Extra } in comment"));
@z



Section 93.

@x
  if (bal>1) err_print("! Missing } in comment");
@y
  if (bal>1) err_print(_("! Missing } in comment"));
@z


Section 94.

@x
    err_print("! Illegal use of @@ in comment");
@y
    err_print(_("! Illegal use of @@ in comment"));
@z


Section 111.

@x
  if (p>=text_ptr) confusion("find_first_ident");
@y
  if (p>=text_ptr) confusion(_("find_first_ident"));
@z


Section 165.

@x
    overflow("token");
@y
    overflow(_("token"));
@z

@x
    overflow("text");
@y
    overflow(_("text"));
@z


Section 170.

@x
    if (tok_ptr+6>tok_mem_end) overflow("token");
@y
    if (tok_ptr+6>tok_mem_end) overflow(_("token"));
@z


Section 171.

@x
  printf("\nIrreducible scrap sequence in section %d:",section_count);
@y
  printf(_("\nIrreducible scrap sequence in section %d:"),section_count);
@z


Section 172.

@x
  printf("\nTracing after l. %d:\n",cur_line); mark_harmless;
@y  Section  172  Wed Sep 18 20:53:39 1996
  printf(_("\nTracing after l. %d:\n"),cur_line); mark_harmless;
@z


Section 176.

@x
  overflow("scrap/token/text");
@y
  overflow(_("scrap/token/text"));
@z


Section 178.

@x
        else err_print("! Double @@ should be used in strings");
@y
        else err_print(_("! Double @@ should be used in strings"));
@z


Section 182.

@x
  if (next_control!='|') err_print("! Missing '|' after C text");
@y
  if (next_control!='|') err_print(_("! Missing '|' after C text"));
@z


Section 188.

@x
  if (stack_ptr==stack_end) overflow("stack");
@y
  if (stack_ptr==stack_end) overflow(_("stack"));
@z


Section 201.

@x
  printf("\n! Illegal control code in section name: <");
@y
  printf(_("\n! Illegal control code in section name: <"));
@z


Section 202.

@x
    printf("\n! C text in section name didn't end: <");
@y
    printf(_("\n! C text in section name didn't end: <"));
@z

@x
      if (j>buffer+long_buf_size-3) overflow("buffer");
@y
      if (j>buffer+long_buf_size-3) overflow(_("buffer"));
@z


Section 203.

@x
  if (j>buffer+long_buf_size-4) overflow("buffer");
@y
  if (j>buffer+long_buf_size-4) overflow(_("buffer"));
@z


Section 205.

@x
reset_input(); if (show_progress) printf("\nWriting the output file...");
@y
reset_input(); if (show_progress) printf(_("\nWriting the output file..."));
@z


Section 209.

@x
        err_print("! TeX string should be in C text only"); break;
@y
        err_print(_("! TeX string should be in C text only")); break;
@z

@x
        err_print("! You can't do that in TeX text"); break;
@y
        err_print(_("! You can't do that in TeX text")); break;
@z


Section 213.

@x
    err_print("! Improper macro definition");
@y
    err_print(_("! Improper macro definition"));
@z

@x
      default: err_print("! Improper macro definition"); break;
@y
      default: err_print(_("! Improper macro definition")); break;
@z


Section 214.

@x
  if (scrap_ptr!=scrap_info+2) err_print("! Improper format definition");
@y
  if (scrap_ptr!=scrap_info+2) err_print(_("! Improper format definition"));
@z


Section 217.

@x
  err_print("! You need an = sign after the section name");
@y
  err_print(_("! You need an = sign after the section name"));
@z


Section 218.

@x
  err_print("! You can't do that in C text");
@y
  err_print(_("! You can't do that in C text"));
@z


Section 225.

@x
  phase=3; if (show_progress) printf("\nWriting the index...");
@y
  phase=3; if (show_progress) printf(_("\nWriting the index..."));
@z

@x
    fatal("! Cannot open index file ",idx_file_name);
@y
    fatal(_("! Cannot open index file "),idx_file_name);
@z

@x
    fatal("! Cannot open section file ",scn_file_name);
@y
    fatal(_("! Cannot open section file "),scn_file_name);
@z

@x
if (show_happiness) printf("\nDone.");
@y
if (show_happiness) printf(_("\nDone."));
@z


Section 248.

@x 
  printf("\nMemory usage statistics:\n");
@.Memory usage statistics:@>
  printf("%ld names (out of %ld)\n",
            (long)(name_ptr-name_dir),(long)max_names);
  printf("%ld cross-references (out of %ld)\n",
            (long)(xref_ptr-xmem),(long)max_refs);
  printf("%ld bytes (out of %ld)\n",
            (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf("Parsing:\n");
  printf("%ld scraps (out of %ld)\n",
            (long)(max_scr_ptr-scrap_info),(long)max_scraps);
  printf("%ld texts (out of %ld)\n",
            (long)(max_text_ptr-tok_start),(long)max_texts);
  printf("%ld tokens (out of %ld)\n",
            (long)(max_tok_ptr-tok_mem),(long)max_toks);
  printf("%ld levels (out of %ld)\n",
            (long)(max_stack_ptr-stack),(long)stack_size);
  printf("Sorting:\n");
  printf("%ld levels (out of %ld)\n",
@y
  printf(_("\nMemory usage statistics:\n"));
@.Memory usage statistics:@>
  printf(_("%ld names (out of %ld)\n"),
            (long)(name_ptr-name_dir),(long)max_names);
  printf(_("%ld cross-references (out of %ld)\n"),
            (long)(xref_ptr-xmem),(long)max_refs);
  printf(_("%ld bytes (out of %ld)\n"),
            (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf(_("Parsing:\n"));
  printf(_("%ld scraps (out of %ld)\n"),
            (long)(max_scr_ptr-scrap_info),(long)max_scraps);
  printf(_("%ld texts (out of %ld)\n"),
            (long)(max_text_ptr-tok_start),(long)max_texts);
  printf(_("%ld tokens (out of %ld)\n"),
            (long)(max_tok_ptr-tok_mem),(long)max_toks);
  printf(_("%ld levels (out of %ld)\n"),
            (long)(max_stack_ptr-stack),(long)stack_size);
  printf(_("Sorting:\n"));
  printf(_("%ld levels (out of %ld)\n"),
@z
