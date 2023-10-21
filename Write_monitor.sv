class write_mon extends uvm_monitor;
`uvm_component_utils(write_mon)
uvm_analysis_port#(write_tx) ap_port;

`NEW
 virtual As_fifo inf;
 
 function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 if(!uvm_resource_db#(virtual As_fifo)::read_by_name("ALL","TB",inf,this))
 begin
 `uvm_error("WRITE_MON","Problem with the interface")
 end
 ap_port= new("ap_port",this);
 endfunction

 task run_phase(uvm_phase phase);
   
 endtask


endclass
