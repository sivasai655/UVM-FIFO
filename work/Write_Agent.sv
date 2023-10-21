class Write_Agent extends uvm_agent;

`uvm_component_utils(Write_Agent)
 write_drv wr_drv;
 write_mon wr_mon;
 write_cov wr_cov;
 write_sqr wr_sqr;

`NEW

 function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 wr_drv= write_drv::type_id::create("wr_drv",this);
 wr_sqr= write_sqr::type_id::create("wr_sqr",this);
 wr_mon= write_mon::type_id::create("wr_mon",this);
 wr_cov= write_cov::type_id::create("wr_cov",this);
 endfunction

 function void connect_phase(uvm_phase phase);
 wr_drv.seq_item_port.connect(wr_sqr.seq_item_export);
 wr_mon.ap_port.connect(wr_cov.analysis_export);
 endfunction



endclass

