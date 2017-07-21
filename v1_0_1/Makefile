PANDOC = pandoc
PANDOCFLAGS = --self-contained -t html5 -c $(HOME)/.pandoc/github.css

all: lowWAFOMSobol-ja.html

%.html:%.md
	$(PANDOC) $(PANDOCFLAGS) -o $@ $<

#%.html:%.Rd
#	$(PANDOC) $(PANDOCFLAGS) -o $@ $<

sobolsequence-ja.html:sobolsequence-ja.Rmd
	Rscript -e "rmarkdown::render('sobolsequence-ja.Rmd')"
