comp:
	iverilog -o tb  -I $(RADIANT_TOP)/ip/pmi  -c vlist_tb.txt

run:
	vvp tb

wave:
	gtkwave tb.vcd &
