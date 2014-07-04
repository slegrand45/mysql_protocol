OCAMLBUILD=ocamlbuild
OCAMLBUILD_OPTIONS=-use-ocamlfind -verbose 9
OCAMLFIND=ocamlfind
TAR=tar
CP=cp
RM=rm
LATEX=pdflatex

all:
	$(OCAMLBUILD) $(OCAMLBUILD_OPTIONS) src.otarget

doc:
	$(OCAMLBUILD) $(OCAMLBUILD_OPTIONS) src.docdir/index.html; \
	$(RM) -v -f docs/*.html docs/*.css; \
	$(CP) -v _build/src.docdir/* docs/

tests: all
	$(OCAMLBUILD) -I src $(OCAMLBUILD_OPTIONS) test.otarget

install: all
	$(OCAMLFIND) install mysql_protocol META ./_build/src/mysql_protocol.cmi ./_build/src/mysql_protocol.cmo ./_build/src/mysql_protocol.cma ./_build/src/mysql_protocol.cmx ./_build/src/mysql_protocol.cmxa ./_build/src/mysql_protocol.a

clean:
	$(OCAMLBUILD) -I src $(OCAMLBUILD_OPTIONS) -clean; \
	(cd tutorials; $(RM) -v -f tutorial.aux tutorial.log tutorial.out tutorial.toc)

example:
	$(OCAMLBUILD) $(OCAMLBUILD_OPTIONS) examples.otarget

benchmark: 
	$(OCAMLBUILD) $(OCAMLBUILD_OPTIONS) benchmarks.otarget

tutorial:
	(cd tutorials; $(LATEX) tutorial.tex)

deinstall:
	$(OCAMLFIND) remove mysql_protocol
