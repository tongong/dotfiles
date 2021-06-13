REQUIRED_BINS := gpg
$(foreach bin,$(REQUIRED_BINS),\
    $(if $(shell command -v $(bin) 2> /dev/null),$(info Found `$(bin)`),$(error Missing Dep. Please install `$(bin)`)))

.PHONY: install uninstall

install:
	install -D -m755 diary-add /usr/local/bin/diary-add
	install -D -m755 diary-add-hidden /usr/local/bin/diary-add-hidden
	install -D -m755 diary-edit /usr/local/bin/diary-edit
	install -D -m755 diary-list /usr/local/bin/diary-list
	install -D -m755 diary-new /usr/local/bin/diary-new
	install -D -m755 diary-print /usr/local/bin/diary-print
	install -D -m755 diary-read-all /usr/local/bin/diary-read-all

uninstall:
	rm -f /usr/local/bin/diary-add
	rm -f /usr/local/bin/diary-add-hidden
	rm -f /usr/local/bin/diary-edit
	rm -f /usr/local/bin/diary-list
	rm -f /usr/local/bin/diary-new
	rm -f /usr/local/bin/diary-print
	rm -f /usr/local/bin/diary-read-all
