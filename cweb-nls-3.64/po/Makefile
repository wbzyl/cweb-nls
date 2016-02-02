# This Makefile belongs to the CWEB-NLS package.


# These variables are exported by ../Makefile

pocwebinputs = ../$(cwebinputs)
posubdirs-1 = $(addprefix ../,$(subdirs-1))

build-dependencies ?= $(pocwebinputs)/$(1).w $(addsuffix /$(1).ch,$(posubdirs-1))

polish = pl_PL

XGETTEXT = xgettext
POUPDATE = msgmerge
MSGFMT = msgfmt

INSTALL = /usr/bin/install
INSTALL_DATA = $(INSTALL) -m 644
MKINSTALLDIRS = $(INSTALL) -m 755 -d

install : pl_PL.mo
	$(MKINSTALLDIRS) $(DESTDIR)$(localedir)/$(polish)/LC_MESSAGES
	$(INSTALL_DATA) $(polish).mo \
               $(DESTDIR)$(localedir)/$(polish)/LC_MESSAGES/$(package).mo

com-nls.w : $(call build-dependencies,common)
	tie -m $*.w $^
ct-nls.w : $(call build-dependencies,ctangle)
	tie -m $*.w $^
cw-nls.w : $(call build-dependencies,cweave)
	tie -m $*.w $^

cwebfiles = com-nls.w cw-nls.w ct-nls.w
potfiles = $(cwebfiles:%.w=%.c)

.SUFFIXES : 
.SUFFIXES : .w .c .po .mo

%.c : %.w
	$(CTANGLE) $*.w

%.mo : %.po
	$(MSGFMT) --output-file=$@ $<

# Make initial PO file

initial-po: $(potfiles) 
	$(XGETTEXT) --default-domain=$(package) \
 --keyword=_ --keyword=N_ $(potfiles)

# Update newly created PO file

update-po: $(potfiles) initial-po 
	$(POUPDATE) --output-file=$(polish).pox \
 $(polish).po $(package).po


.PHONY : clean

clean :
	rm -f *~ \#* *-nls.w *.h *.c *.mo
