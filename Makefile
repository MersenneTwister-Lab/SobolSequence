PANDOC = pandoc
PANDOCFLAGS = --self-contained -t html5 -c $(HOME)/.pandoc/github.css

all: example-ja.html

%.html:%.md
	$(PANDOC) $(PANDOCFLAGS) -o $@ $<
