CC?=cc
CFLAGS?=-O
LIBS=`[ \`uname\` = "SunOS" ] && echo -lsocket -lnsl`
PREFIX=/usr/

all: darkhttpd

darkhttpd: darkhttpd.c
	$(CC) $(CFLAGS) $(LIBS) darkhttpd.c -o $@

install: all
	mkdir -p $(PREFIX)/bin
	cp -f darkhttpd $(PREFIX)/bin

uninstall:
	rm -f ${PREFIX}/bin/darkhttpd

clean:
	rm -f darkhttpd core darkhttpd.core

.PHONY: all clean
