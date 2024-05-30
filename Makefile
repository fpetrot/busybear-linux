all: busybear.bin

clean:
	rm -fr build busybear-riscv64.bin busybear-riscv32.bin

distclean: clean
	rm -fr archives

busybear.bin: scripts/build.sh
	./scripts/build.sh

archive:
	tar --exclude build --exclude archives --exclude busybear.bin \
	    -C .. -cjf ../busybear-linux.tar.bz2 busybear-linux
