PARROT := $(shell which parrot)
BASH := $(shell which bash)
NQP := $(shell which nqp-p)
CAT := $(shell which cat)

XML_PBC := xml.pbc
XML_PIR := xml.pir
XML_NQP := xml.nqp
XML_SOURCES := \
  src/Grammar.nqp \
  src/Actions.nqp \

$(XML_PBC): $(XML_PIR)
	$(PARROT) -t=pbc --output="$@" $<

$(XML_PIR): $(XML_NQP)
	$(NQP) -t=pir --output="$@" $<

$(XML_NQP): $(XML_SOURCES)
	$(CAT) $^ > "$@"

test: t/run.bash $(XML_PBC)
	@$(BASH) $<
