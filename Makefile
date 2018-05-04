GRAMMAR := bug/grammar.peg
GENERATEDFILE := bug/grammar.go

.PHONY: build
build: $(GENERATEDFILE)
	go build ./bug

$(GENERATEDFILE): $(GRAMMAR)
	pigeon --optimize-grammar -o $@ $<

.PHONY: clean
clean:
	-rm $(GENERATEDFILE)


