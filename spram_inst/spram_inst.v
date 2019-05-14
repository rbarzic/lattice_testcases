module	spram_inst(/*AUTOARG*/
   // Outputs
   led,
   // Inputs
   clk, rst_n
   );


   input  clk;
   input    rst_n;
   output   led;
   
   reg [13:0] 		  addr_r;
   reg [15:0] 		  di_r;
   wire [15:0] 		  dout;
   
   
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
	 di_r <= di_r + 16'd7;	 
      end
   end



   SP256K
     U_RAM (
	    .AD       (addr_r),  // I
	    .DI       (di_r),  // I
	    .MASKWE   (addr_r[3:0] ^ addr_r[7:4]),  // I
	    .WE       (addr_r[10]),  // I
	    .CS       (1'b1),  // I
	    .CK       (clk),  // I
	    .STDBY    (1'b0),  // I
	    .SLEEP    (1'b0),  // I
	    .PWROFF_N (1'b1),  // I
	    .DO       (dout)   // O
	    );

   assign led = dout[8];
   

endmodule
