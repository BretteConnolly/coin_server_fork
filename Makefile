# Output binary name
bin=coin-server

# Set the following to '0' to disable log messages:
LOGGER ?= 1
DEBUG_ON ?= 1
VERSION = 1.0

# Compiler/linker flags
CFLAGS += -g -Wall -DLOGGER=$(LOGGER) -DVERSION=$(VERSION)
LDLIBS +=
LDFLAGS +=

src=server.c common.c task.c sha1.c
obj=$(src:.c=.o)

all: $(bin)

$(bin): $(obj)
	$(CC) $(CFLAGS) $(LDLIBS) $(LDFLAGS) $(obj) -o $@

server.o: server.h server.c common.o logger.h
common.o: common.h logger.h
task.o: task.h task.c logger.h
sha1.o: sha1.c sha1.h

clean:
	rm -f $(bin) $(obj) vgcore.*

