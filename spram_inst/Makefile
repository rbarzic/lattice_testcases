comp:
	iverilog -o tb  -I $(RADIANT_TOP)/cae_library/simulation/verilog/iCE40UP  -c vlist_tb.txt

run:
	vvp tb

wave:
	gtkwave tb.vcd &
