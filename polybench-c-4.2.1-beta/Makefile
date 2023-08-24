SOURCES :=$(shell find . -name \*.c | sed -e '/utilities/d' -e '/orig/d')
OBJECTS :=$(patsubst %.c,%.o,$(SOURCES))
EXECS   :=$(patsubst %.o,%,$(OBJECTS))
# Dumps the arrays in a first stage to make sure everything goes fine
# Use the smallest dataset for the same reason, and also because gem5
# is supposed to simulate that stuff
CFLAGS=-O3 -I./utilities -DPOLYBENCH_DUMP_ARRAYS -DMINI_DATASET
CC=riscv64-unknown-linux-gnu-gcc

# Special handling of ./utilities/polybench.o in the rules

%: %.o
	$(CC) -o $@ $< ./utilities/polybench.o -lm

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all : $(EXECS)
	if [ ! -d "../mnt" ]; then \
		echo "The ../mnt folder does not exist, please compile busybox"; \
	else \
		mv $^ ../mnt/bin; \
	fi

$(EXECS) : ./utilities/polybench.o $(OBJECTS)

./utilities/polybench.o : ./utilities/polybench.c

clean :
	$(RM) $(EXECS) $(OBJECTS)
