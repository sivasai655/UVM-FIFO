class read_drv extends uvm_driver#(read_tx);
`uvm_component_utils(read_drv)
`NEW
 virtual As_fifo inf;

 function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 if(!uvm_resource_db#(virtual As_fifo)::read_by_name("ALL","TB",inf,this))
 begin
 `uvm_error("Read_DRIVER","Problem with the interface")
 end
 
 endfunction

 task run_phase(uvm_phase phase);
 forever begin
  seq_item_port.get_next_item(rsp);
  drive_tx(rsp);
	seq_item_port.item_done;
 end
 endtask

task drive_tx(read_tx tx);
		 @(posedge inf.read_clk);
		 inf.read_en =1;
		 @(posedge inf.read_clk);
		 tx.data = inf.Rdata;
		 inf.read_en =0;
		 repeat(tx.delay) @(posedge inf.read_clk);
endtask

endclass
