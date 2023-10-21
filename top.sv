import uvm_pkg::*;
`include "uvm_macros.svh"
`include "fifo.sv"
`include "As_fifo_interface.sv"
`include "common.sv"
`include "Write_tx.sv"
`include "Write_driver.sv"
`include "Write_monitor.sv"
`include "Write_cov.sv"
`include "Write_sqr.sv"
`include "Write_seq_lib.sv"
`include "Read_tx.sv"
`include "Read_diver.sv"
`include "Read_sqr.sv"
`include "Read_cov.sv"
`include "Read_monitor.sv"
`include "Read_seq_lib.sv"
`include "Read_Agent.sv"
`include "Write_Agent.sv"
`include "As_env.sv"
`include "as_fifo_test_lib.sv"
 
 
 
 
module top;

bit rst_i,write_clk, read_clk;


As_fifo vif(rst_i, write_clk, read_clk);


async_fifo dut(.wr_clk(vif.write_clk),
							 .rd_clk(vif.read_clk),
							 .rst(vif.rst_i),
							 .wdata(vif.Wdata),
							 .wr_en(vif.write_en),
							 .rdata(vif.Rdata),
							 .rd_en(vif.read_en),
							 .empty(vif.Empty),
							 .full(vif.full),
							 .wr_error(vif.write_error),
							 .rd_error(vif.read_error)
							 );





initial begin
				write_clk = 0;
				forever #5 write_clk = ~write_clk;
end

initial begin
				read_clk = 0;
				forever #7 read_clk = ~read_clk;
end

initial begin
		rst_i = 1;
	  vif.write_en = 0;
		vif.read_en = 0;
		vif.Wdata =0;
		#30;
		rst_i = 0;
end

initial begin 
				uvm_resource_db#(virtual As_fifo)::set("ALL","TB",vif,null);
end

initial begin
				run_test("Concurrent_wr_rd_test");
end

	

endmodule
