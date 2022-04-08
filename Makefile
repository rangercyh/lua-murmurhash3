.PHONY: all test clean

TARGET=lmurmurhash3.so

all: $(TARGET)

CFLAGS = $(CFLAG)
CFLAGS += -g3 -O2 -rdynamic -Wall -fPIC -shared

$(TARGET): lua-murmurhash3.c
	gcc $(CFLAGS) -o $@ $^

clean:
	rm $(TARGET)

test:
	lua test.lua
