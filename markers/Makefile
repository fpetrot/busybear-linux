include ../conf/busybear.config
GCC=$(CROSS_COMPILE)gcc

.PHONY: markers

markers: start-marker stop-marker


start-marker: start-marker.c
	$(GCC) $< -o $@

stop-marker: stop-marker.c
	$(GCC) $< -o $@

clean :
	$(RM) start-marker stop-marker
