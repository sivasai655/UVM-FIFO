class read_base_seq extends uvm_sequence#(read_tx);

`uvm_object_utils(read_base_seq)
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

class read_seq extends read_base_seq;
 int tx;
	`uvm_object_utils(read_seq)
	`NEW_OBJ

	 task body();
   uvm_resource_db#(int)::read_by_name("GOBAL","GEN2",tx,this); 
		repeat(tx) begin
		
			`uvm_do(req);
		end
	 endtask
 endclass

class read_delay_seq extends read_base_seq;
 int tx;
 int read_delay;
	`uvm_object_utils(read_delay_seq)
	`NEW_OBJ
   
	 task body();
	  	  uvm_resource_db#(int)::read_by_name("GOBAL","GEN",tx,this);
		repeat(tx) begin
		 	read_delay= 1;
					`uvm_do_with(req,{req.delay==read_delay;});
		end
	 endtask
 endclass

