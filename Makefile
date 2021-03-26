.PHONY: all check

all: scsniff

DEPS = packet.h atr.h session.h pps.h data.h
CFLAGS = -std=c99 -Wall -pedantic -Wtype-limits
MODULES = atr.o data.o pps.o session.o serial.o

%.o: %.c $(DEPS) Makefile
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f scsniff test *.o

scsniff: scsniff.o $(MODULES)
	$(CC) -o $@ $^

test: test.o $(MODULES) atr_test.o data_test.o session_test.o
	$(CC) -o $@ $^ `pkg-config --libs check`

check: test
	./test
