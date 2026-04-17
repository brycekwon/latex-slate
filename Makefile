LATEXMK := latexmk
FLAGS := -pdf -silent
TEX := TEXINPUTS=..:

CLASS_FILES := slate.sty slate-resume.cls slate-letter.cls

.PHONY: all resume cv letter watch clean

all: resume cv letter

resume: examples/resume.pdf
cv: examples/cv.pdf
letter: examples/cover-letter.pdf

examples/%.pdf: examples/%.tex $(CLASS_FILES)
	cd examples && $(TEX) $(LATEXMK) $(FLAGS) $*.tex

watch:
	cd examples && $(TEX) $(LATEXMK) $(FLAGS) -pvc resume.tex

clean:
	cd examples && $(LATEXMK) -C
	rm -f examples/*.aux examples/*.log examples/*.out examples/*.fls examples/*.fdb_latexmk examples/*.synctex.gz examples/*.toc examples/*.bbl examples/*.blg examples/*.nav examples/*.snm examples/*.vrb
