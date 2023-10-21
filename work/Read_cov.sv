class read_cov extends uvm_subscriber#(read_tx);
read_tx tx;
`uvm_component_utils(read_cov)

covergroup rd_cg;
endgroup

function new(string name= "",uvm_component parent = null);
super.new(name,parent);
rd_cg= new();
endfunction

function void write(read_tx t);
	$cast(tx,t);
	rd_cg.sample();
endfunction
endclass

