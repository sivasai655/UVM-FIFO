VLOG_FLAGS = -source -lint -sv

uvm:
	rm -rf transcript work *.vcd
	vlog $(VLOG_FLAGS) top.sv

	vsim -c -voptargs=+acc=npr top  -do "vcd file test.vcd; vcd add -r top/*; run -all; quit"


clean:
	rm -rf transcript work *.vcd


m:
	rm -rf transcript work *.vcd
	vlog $(VLOG_FLAGS) top.sv

	set testname report
	vsim -c -voptargs=+acc=npr top +UVM_TESTNAME=Apb_wr_rd_test -do "vcd file test.vcd; vcd add -r top/*; run -all; quit" > $testname.log

