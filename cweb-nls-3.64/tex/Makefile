# This Makefile belongs to the CWEB-NLS package.

# These variables are exported by ../Makefile

# Currently, only the Polish language is supported.
# So, this Makefile is very simple.

# This is the name of Polish locale.
polish = pl_PL

# This is the name of English locale. 
english = en_US

polish-tcx = -translate-file=il2-pl


# Create `cweb-pl_PL.tex' and `pl_PL-cweb.tex'

$(polish) : cweb-nls.tex pl_PL.msg pl_PL.def
	LANG=$(polish) $(TEX) $(polish-tcx) '\def\lang{$@}\input $(package)'

INSTALL = /usr/bin/install
INSTALL_DATA = $(INSTALL) -m 644
MKINSTALLDIRS = $(INSTALL) -m 755 -d

install : $(polish)
	$(MKINSTALLDIRS) $(DESTDIR)$(configdir) 
	$(MKINSTALLDIRS) $(DESTDIR)$(macrosdir)/C
	$(MKINSTALLDIRS) $(DESTDIR)$(macrosdir)/$(english) 
	$(MKINSTALLDIRS) $(DESTDIR)$(macrosdir)/$(polish)
	$(INSTALL_DATA) cweb.nls $(DESTDIR)$(configdir)
	$(INSTALL_DATA) cweb-$(polish).tex $(DESTDIR)$(macrosdir)/$(polish)/cweb-mac.tex
	$(INSTALL_DATA) $(polish)-cweb.tex $(DESTDIR)$(macrosdir)/$(polish)/messages.tex
	$(INSTALL_DATA) cwebmac.tex $(DESTDIR)$(macrosdir)
	$(INSTALL_DATA) cweb-c.tex $(macrosdir)/C/cweb-mac.tex
	$(INSTALL_DATA) cweb-c.tex $(macrosdir)/$(english)/cweb-mac.tex

.PHONY : clean

clean :
	rm -f *.log *~ cweb-pl_PL.tex pl_PL-cweb.tex
