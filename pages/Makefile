all: 0.pdf 1.pdf 2.pdf 3.pdf 4.pdf 5.pdf 6.pdf 7.pdf 8.pdf 9.pdf 

%.pdf: tex/%.tex
	pdflatex --output-directory aux $<
	@ln -Fs ../aux/$@ pdf/$@
	
%.tex:
	@if [ ! -e "tex/$@" ]; then vim -c "TTemplate geometry" tex/$@; fi
	@if [ -e "tex/$@" ]; then vim tex/$@; fi;

view.% open.%:
	@open pdf/$*.pdf

clean-log:
	@rm -f aux/*.log

clean-aux:
	@rm -f aux/*.aux

clean-out:
	@rm -f aux/*.out

clean: clean-log clean-aux clean-out

%.tar.gz:
	tar -chzf $*.tar.gz tex/*.tex pdf cls

backup:
	mkdir -p ../pages.backup
	cp -r * ../pages.backup

.PHONY: all clean-log clean-aux clean-out clean backup help

help:
	@echo "Type make <имя-файла>.tex для создания файла"
	@echo "Type make <имя-файла>.pdf для запуска pdflatex"
	@echo "Type make open.<имя-файла> для открытия файла <имя-файла>.pdf"
	@echo "Type make <имя-архива>.tar.gz для всех файлов .tex и .pdf"
