class write_cov extends uvm_subscriber#(write_tx);
write_tx tx;
`uvm_component_utils(write_cov)


covergroup wr_cg;
endgroup

function new(string name= "",uvm_component parent = null);
super.new(name,parent);
wr_cg= new();
endfunction

function void write(write_tx t);
	$cast(tx,t);
	wr_cg.sample();
endfunction
endclass

