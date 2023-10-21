interface As_fifo(input bit rst_i, write_clk, read_clk);
bit write_en;
bit read_en;
bit [7:0] Wdata;
bit  [7:0] Rdata;
bit  write_error,read_error;
bit full, Empty;

endinterface
