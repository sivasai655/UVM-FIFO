class write_drv extends uvm_driver#(write_tx);
`uvm_component_utils(write_drv)
`NEW
 virtual As_fifo inf;

 function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 if(!uvm_resource_db#(virtual As_fifo)::read_by_name("ALL","TB",inf,this))
 begin
 `uvm_error("WRITE_DRIVER","Problem with the interface")
 end
 
 endfunction

 task run_phase(uvm_phase phase);
  wait(inf.rst_i == 0);
  forever begin 
	seq_item_port.get_next_item(req);
  drive_tx(req);
	req.print();
  seq_item_port.item_done;
 end
 endtask

task drive_tx(write_tx tx);
			 @(posedge inf.write_clk);
				 inf.write_en =1;
		 inf.Wdata = tx.data;
		 @(posedge inf.write_clk);
		 inf.write_en =0;
		 inf.Wdata = 0;
		 
		 repeat(tx.delay) @(posedge inf.write_clk);
endtask

endclass
