GRAMMAR := bug/grammar.peg
OPTIMIZEDGRAMMAR := bug/optimized_grammar.peg
GENERATEDFILE := bug/grammar.go
FLAGS ?= --optimize-grammar

.PHONY: build
build: $(GENERATEDFILE)
	go build ./bug

.PHONY: build-opt
build-opt:
	pigeon $(FLAGS) -o $(GENERATEDFILE) $(OPTIMIZEDGRAMMAR)
	go build ./bug

$(GENERATEDFILE): $(GRAMMAR)
	pigeon $(FLAGS) -o $@ $<

.PHONY: clean
clean:
	-rm $(GENERATEDFILE)


