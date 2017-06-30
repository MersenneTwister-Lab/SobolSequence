PANDOC = pandoc
PANDOCFLAGS = --self-contained -t html5 -c $(HOME)/.pandoc/github.css

all: example-ja.html

%.html:%.md
	$(PANDOC) $(PANDOCFLAGS) -o $@ $<

%.html:%.Rd
	$(PANDOC) $(PANDOCFLAGS) -o $@ $<

%.html:%.Rmd
	$(PANDOC) $(PANDOCFLAGS) -o $@ $<
