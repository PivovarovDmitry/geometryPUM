.SUFFIXES: .tex .dvi .ps .pdf

.tex.dvi:
	latex $<

.dvi.ps:
	dvips -Ppdf -G0 $<

.ps.pdf:
	ps2pdf $<

clean:
	@rm -f *.ps *.pdf *.dvi *.log *.aux *.out
