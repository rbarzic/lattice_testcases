module	spram_inst(/*AUTOARG*/
   // Outputs
   led,
   // Inputs
   clk, rst_n
   );


   input  clk;
   input    rst_n;
   output   led;
   
   reg [8:0] 		  addr_r;
   reg [31:0] 		  di_r;
   wire [31:0] 		  dout;
   
   
   always @(posedge clk or negedge rst_n) begin
      if(rst_n == 1'b0) begin
	 /*AUTORESET*/
	 // Beginning of autoreset for uninitialized flops
	 addr_r <= 14'h0;
	 di_r <= 16'h0;
	 // End of automatics
      end
      else begin
	 addr_r <= addr_r + 1'b1;
	 di_r <= di_r + 32'd7;	 
      end
   end

// 2KB Ram (512x32)	
pmi_ram_dq_be
#(
  .pmi_addr_depth       ( 512), // integer
  .pmi_addr_width       (9 ), // integer
  .pmi_data_width       ( 32), // integer
  .pmi_regmode          ( "noreg"), // "reg"|"noreg"
  .pmi_gsr              ( "disabled"), // "enable"|"disable"
  .pmi_resetmode        ( "async"), // "async"|"sync"
  .pmi_optimization     ( "area"), // "area"|"speed"
  .pmi_init_file        ( "memory.hex"), // string
  .pmi_init_file_format ( "hex"), // "binary"|"hex"
  .pmi_write_mode       ( "normal"), // "normal"|"writethrough"|"readbeforewrite"
  .pmi_family           ( "common"), // "common"
  .pmi_byte_size        ( 8) // integer
) U_RAM (
  .Data      ( di_r),  // I:
  .Address   ( addr_r),  // I:
  .Clock     ( clk),  // I:
  .ClockEn   ( 1'b1),  // I:
  .WE        ( addr_r[4]),  // I:
  .Reset     ( !rst_n),  // I:
  .ByteEn    ( addr_r[7:4]),  // I:
  .Q         ( dout)   // O:
);
   
   assign led = dout[2];
   
endmodule
