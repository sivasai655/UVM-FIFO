class As_fifo_base_test extends uvm_test;

`uvm_component_utils(As_fifo_base_test)
`NEW
As_env env;

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env= As_env::type_id::create("env",this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
endfunction

endclass

class Fifo_wr_rd extends As_fifo_base_test;
 	`uvm_component_utils(Fifo_wr_rd)
	`NEW
	function void build_phase(uvm_phase phase);
	 super.build_phase(phase);
   uvm_resource_db#(int)::set("GOBAL","GEN",16,this);
	endfunction


 task run_phase(uvm_phase phase);
   write_seq wr_seq;
	 read_seq rd_seq;
 		wr_seq= write_seq::type_id::create("wr_seq",this);
 		rd_seq= read_seq::type_id::create("rd_seq",this);
	 
	   phase.raise_objection(this);
	   phase.phase_done.set_drain_time(this,100);
	    wr_seq.start(env.WR_Agent.wr_sqr);
	    rd_seq.start(env.RD_Agent.rd_sqr);
     phase.drop_objection(this);
	endtask

endclass


class fifo_full extends As_fifo_base_test;
 	`uvm_component_utils(fifo_full)
	`NEW
	function void build_phase(uvm_phase phase);
	 super.build_phase(phase);
   uvm_resource_db#(int)::set("GOBAL","GEN",17,this);
	endfunction


 task run_phase(uvm_phase phase);
   write_seq wr_seq;
 		wr_seq= write_seq::type_id::create("wr_seq",this);
 			 
	   phase.raise_objection(this);
	   phase.phase_done.set_drain_time(this,100);
	   wr_seq.start(env.WR_Agent.wr_sqr);
     phase.drop_objection(this);
	endtask

endclass

class Fifo_empty extends As_fifo_base_test;
 	`uvm_component_utils(Fifo_empty)
	`NEW
	function void build_phase(uvm_phase phase);
	 super.build_phase(phase);
   uvm_resource_db#(int)::set("GOBAL","GEN",16,this);
  uvm_resource_db#(int)::set("GOBAL","GEN2",17,this);
	endfunction


 task run_phase(uvm_phase phase);
   write_seq wr_seq;
	 read_seq rd_seq;
 		wr_seq= write_seq::type_id::create("wr_seq",this);
 		rd_seq= read_seq::type_id::create("rd_seq",this);
	 
	   phase.raise_objection(this);
	   phase.phase_done.set_drain_time(this,100);
	    wr_seq.start(env.WR_Agent.wr_sqr);
	    rd_seq.start(env.RD_Agent.rd_sqr);
     phase.drop_objection(this);
	endtask

endclass

class Concurrent_wr_rd_test  extends As_fifo_base_test;
 	`uvm_component_utils(Concurrent_wr_rd_test )
	`NEW
	function void build_phase(uvm_phase phase);
	 super.build_phase(phase);
   uvm_resource_db#(int)::set("GOBAL","GEN",200,this);
   uvm_resource_db#(int)::set("GOBAL","GEN2",200,this);
	endfunction


 task run_phase(uvm_phase phase);
   write_delay_seq wr_seq;
	 read_delay_seq rd_seq;
 		wr_seq= write_delay_seq::type_id::create("wr_seq",this);
 		rd_seq= read_delay_seq::type_id::create("rd_seq",this);
	 
	   phase.raise_objection(this);
	   phase.phase_done.set_drain_time(this,100);
		 fork
	    wr_seq.start(env.WR_Agent.wr_sqr);
	    rd_seq.start(env.RD_Agent.rd_sqr);
		 join
     phase.drop_objection(this);
	endtask

endclass
