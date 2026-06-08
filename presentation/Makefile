.PHONY: notes clean

notes:
	sed 's/\\documentclass\(.*\)/\\documentclass\1\n\\usepackage{pgfpages}\n\\setbeameroption{show notes on second screen=right}\n\\setbeamertemplate{note page}{\\pagecolor{white}\\vspace{1em}\\footnotesize\\insertnote}/' presentation.tex > presentation-notes-tmp.tex
	pdflatex -interaction=nonstopmode -jobname=presentation-notes presentation-notes-tmp.tex
	pdflatex -interaction=nonstopmode -jobname=presentation-notes presentation-notes-tmp.tex
	rm -f presentation-notes-tmp.tex presentation-notes.aux presentation-notes.log presentation-notes.out presentation-notes.nav presentation-notes.snm presentation-notes.toc
	@echo "Done: presentation-notes.pdf"

clean:
	rm -f presentation-notes.pdf presentation-notes-tmp.tex presentation-notes.aux presentation-notes.log presentation-notes.out presentation-notes.nav presentation-notes.snm presentation-notes.toc
