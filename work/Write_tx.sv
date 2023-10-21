class write_tx extends uvm_sequence_item;
rand bit [7:0] data;
rand bit delay;
`uvm_object_utils_begin(write_tx)
 `uvm_field_int(data,UVM_ALL_ON)
 `uvm_field_int(delay,UVM_ALL_ON)
 `uvm_object_utils_end

 `NEW_OBJ

 constraint soft_c { soft delay == 0;}
endclass
