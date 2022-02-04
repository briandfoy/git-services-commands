GIT_CMD_DIR=$(shell git --exec-path)
MAN_PREFIX=/usr/local/share
MAN_DIR=$(MAN_PREFIX)/man
MAN1_DIR=$(MAN_DIR)/man1
PANDOC=pandoc
PERL=perl
PROVE=prove
SCRIPTS=git-bitbucket git-github git-gitlab
MANS=$(SCRIPTS:=.1)
MDS=$(MANS:=.md)
INSTALL=install

.PHONY: install
install: install_scripts install_mans

.PHONY: install_scripts
install_scripts: $(SCRIPTS)
	@ for script in $(SCRIPTS); do $(INSTALL) -v -m 555 $$script $(GIT_CMD_DIR)/$$script; done

.PHONY: install_mans
install_mans: $(MANS)
	@ for manpage in $(MANS); do $(INSTALL) -v -m 444 $$manpage $(MAN1_DIR)/$$manpage; done

%.1: %.1.md
	@ $(PANDOC) --standalone --to man $< -o $@

%.1.md: %
	@ $(PERL) -ne 'next unless /\A__DATA__\Z/; last } while(<>) { print' $< > $@

.PHONY: clean
clean:
	rm *.1 *.md

.PHONY: uninstall
uninstall:
	for script in $(SCRIPTS); do rm $(GIT_CMD_DIR)/$$script; done

.PHONY: test
test:
	$(PROVE) t
