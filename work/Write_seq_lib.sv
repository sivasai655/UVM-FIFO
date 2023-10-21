class write_base_seq extends uvm_sequence#(write_tx);

`uvm_object_utils(write_base_seq)
`NEW_OBJ

task pre_body();
 if(starting_phase != null) begin
 	 starting_phase.raise_objection(this);
	 starting_phase.phase_done.set_drain_time(this,100);
 end
endtask

task post_body();
 if(starting_phase != null)begin
  starting_phase.drop_objection(this);
	end
endtask


endclass

class write_seq extends write_base_seq;
 int tx;
	`uvm_object_utils(write_seq)
	`NEW_OBJ
   
	 task body();
	  uvm_resource_db#(int)::read_by_name("GOBAL","GEN",tx,this);
		repeat(tx) begin
					`uvm_do(req);
		end
	 endtask
 endclass

class write_delay_seq extends write_base_seq;
 int tx;
 int write_delay;
	`uvm_object_utils(write_delay_seq)
	`NEW_OBJ
   
	 task body();
	  	  uvm_resource_db#(int)::read_by_name("GOBAL","GEN",tx,this);
		repeat(tx) begin
		 	write_delay= 1;
					`uvm_do_with(req,{req.delay==write_delay;});
		end
	 endtask
 endclass

