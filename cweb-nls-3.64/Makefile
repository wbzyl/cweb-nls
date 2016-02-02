# This Makefile belongs to the CWEB-NLS package.
# It is distributed WITHOUT ANY WARRANTY, express or implied.
#
# Copyright (C) 2003 Wlodek Bzyl
#
# Permission is granted to make and distribute verbatim copies
# of this document provided that the copyright notice and this 
# permission notice are preserved on all copies.
#
# Permission is granted to copy and distribute modified versions 
# of this document under the conditions for verbatim copying, 
# provided that the entire resulting derived work is given 
# a different name and distributed under the terms of a permission 
# notice identical to this one.

# Warning: 
# This package requires tetex-2.0.2 or later

SHELL = /bin/sh

export DESTDIR =

prefix = /usr/local

bindir = $(prefix)/bin

# The location of the main TEXMF tree 

texrootdir = TEXMFLOCAL # local install (the default)
#texrootdir = TEXMFMAIN  # global install

texmfmain = $(shell kpsewhich --expand-var=\$$$(texrootdir))

# Directory for the macros supporting literate sources typesetting.

export macrosdir = $(texmfmain)/tex/cweb

# Directory for the `cweb.nls' configuration file.

export configdir = $(texmfmain)/cweb

# Names for the generated `cweave' and `ctangle' binaries.

cweave-nls = cw
ctangle-nls = ct

all : $(cweave-nls) $(ctangle-nls)


# Temporary hack: check if kpathsea version >= 345 

.PHONY : clean dist tarball kpsewhich-exists kpsewhich-version

kpsewhich-exists :
	@type kpsewhich >/dev/null 2>&1 || \
   echo "! Where is the \`kpsewhich' program? (Is the tetex package installed?)"

kpathsea-version =  $(shell kpsewhich --version | head -1 | \
sed -e 's/[^0-9.]*\([0-9]\+\)\.\([0-9]\+\)\.\([0-9]\+\)/\1\2\3/')
old-kpathsea = "! Too old kpathsea library. Please install the latest tetex distribution."
kpsewhich-version : kpsewhich-exists
	@if test $(kpathsea-version) -lt 345 ; then echo $(old-kpathsea) ; exit 1 ; fi

check : kpsewhich-version

# end of hack

# Identify this package.

export package = cweb-nls
export version = 3.64
pv = $(package)-$(version)

# Directory for translated message catalogs.

export localedir = /usr/local/lib/locale

# The `cwebinputs' value should point to the directory where
# the `cweb-3.64.tar.gz' package was unpacked.
# This package could be found at `ftp.dante.de/pub/web/cweb'.

export cwebinputs = ../cweb-3.64

# Name of the program for weaving a code.

CWEAVE = cweave

# Place where Kpathsea lives.
#kpathsealib = /usr/local/lib
#kpathseainclude = /usr/local/include

LIBS = -lkpathsea

# I18N
DEFS= -DPACKAGE=\"$(package)\" -DLOCALEDIR=\"$(localedir)\"

# We keep debugging info around, but most users don't need it.
CFLAGS = -Wall -g -O
#CFLAGS = -Wall -g -O -I $(kpathseainclude)

LINKFLAGS =
#LINKFLAGS = -L $(kpathsealib)

export subdirs-1 = banner kpathsea nls msg header
subdirs-2 = tex po
subdirs-3 = doc

build-dependencies = $(cwebinputs)/$(1).w $(addsuffix /$(1).ch,$(subdirs-1))

common.w : $(call build-dependencies,common)
	tie -m $*.w $^
ctangle.w :  $(call build-dependencies,ctangle)
	tie -m $*.w $^
cweave.w :  $(call build-dependencies,cweave)
	tie -m $*.w $^

$(ctangle-nls) : common.o ctangle.o
	$(CC) $(LINKFLAGS) $^ -o $@ $(LIBS)

$(cweave-nls) : common.o cweave.o
	$(CC) $(LINKFLAGS) $^ -o $@ $(LIBS)

clean :
	for dir in $(subdirs-1) $(subdirs-3); do rm -f $$dir/*~ $$dir/\# ; done
	rm -f core *~ \#* *.o *.c cweb.h $(ctangle-nls) $(cweave-nls) \
              common.w ctangle.w cweave.w \
              *.tex *.log *.dvi *.scn *.idx *.toc *.ps *.pdf $(pv).tar.gz
	for dir in $(subdirs-2); do $(MAKE) -C $$dir clean ; done

dist tarball :
	shtool tarball -o $(pv).tar.gz -c 'gzip -9' .


.SUFFIXES : .w .tex .dvi .pdf .ps

%.tex : %.w
	$(CWEAVE) $<

%.dvi : %.tex
	tex "\let\pdf+ \input $*"

%.pdf: %.dvi
	dvipdfm $*.dvi

%.ps : %.pdf
	pdf2ps $<

%.o : %.c
	$(CC) -c $(CFLAGS) $(DEFS) $<

INSTALL = /usr/bin/install
INSTALL_PROGRAM = $(INSTALL) -m 755
INSTALL_DATA = $(INSTALL) -m 644
MKINSTALLDIRS = $(INSTALL) -m 755 -d

install : all install-message-catalog install-macros
	$(MKINSTALLDIRS) $(DESTDIR)$(bindir) 
	$(MKINSTALLDIRS) $(DESTDIR)$(macrosdir) 
	$(MKINSTALLDIRS) $(DESTDIR)$(configdir)
	$(INSTALL) $(cweave-nls) $(ctangle-nls) $(DESTDIR)$(bindir)
# post install
	mktexlsr

install-message-catalog :
	$(MAKE) -C po install

install-macros :
	$(MAKE) -C tex install

dest-prefix = /tmp/$(pv)

uninstall :
	@echo "Removing \`$(pv)' package."
	@$(MAKE) DESTDIR=$(dest-prefix) install
	find $(dest-prefix) -type f | perl -p -e "s#$(dest-prefix)##" | xargs rm -f
# post uninstall
	mktexlsr
