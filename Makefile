LOCALBIN = $(HOME)/.local/bin

.PHONY: install
install: | localbin
	rsync -ab --backup-dir backup scripts/* $(LOCALBIN)

.PHONY: localbin
localbin:
	mkdir -p $(LOCALBIN)
