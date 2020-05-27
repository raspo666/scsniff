default: scsniff

DEPS = result.h atr.h session.h pps.h data.h
CFLAGS = -std=c99 -Wall -pedantic -Wtype-limits

%.o: %.c $(DEPS) Makefile
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f scsniff *.o

scsniff: scsniff.o atr.o session.o pps.o data.o
	$(CC) -o $@ $^
