SOURCES :=$(shell find . -name \*.c | sed -e '/utilities/d' -e '/orig/d')
OBJECTS :=$(patsubst %.c,%.o,$(SOURCES))
EXECS   :=$(patsubst %.o,%,$(OBJECTS))
# Dumps the arrays in a first stage to make sure everything goes fine
# Use the smallest dataset for the same reason, and also because gem5
# is supposed to simulate that stuff
CFLAGS=-O3 -I./utilities -DSTANDARD_DATASET #-DPOLYBENCH_DUMP_ARRAYS -DMINI_DATASET
CCC ?= riscv64-unknown-linux-gnu-gcc
MNT ?= ../mnt

# Special handling of ./utilities/polybench.o in the rules

%: %.o
	$(CCC) -o $@ $< ./utilities/polybench.o -lm

%.o: %.c
	$(CCC) $(CFLAGS) -c $< -o $@

# This Makefile is expected to be used only when building a busybox image
all : $(EXECS)
	@if [ ! -d "$(MNT)" ]; then \
		echo "The $(MNT) folder does not exist, please compile busybox"; \
	else \
		mv $^ $(MNT)/bin; \
	fi

$(EXECS) : ./utilities/polybench.o $(OBJECTS)

./utilities/polybench.o : ./utilities/polybench.c

clean :
	$(RM) $(EXECS) $(OBJECTS)
