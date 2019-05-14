`timescale 1ns/1ps
module tb ();

   


   /*AUTOREG*/
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk;			// From U_CLOCK_GEN of clock_gen.v
   wire			rst_n;			// From U_RESET_GEN of reset_generator.v
   // End of automatics

   reg 			rst_async_n;
   

    /* spram_inst AUTO_TEMPLATE(
     .led		(),
     ); */
   spram_inst U_SPRAM_INST (
			   /*AUTOINST*/
			    // Outputs
			    .led		(),		 // Templated
			    // Inputs
			    .clk		(clk),
			    .rst_n		(rst_n));
   
    /* clock_gen AUTO_TEMPLATE(
     ); */
   clock_gen U_CLOCK_GEN (
			   /*AUTOINST*/
			  // Outputs
			  .clk			(clk));
   
    /* reset_generator AUTO_TEMPLATE(
     ); */
   reset_generator U_RESET_GEN (
			   /*AUTOINST*/
				// Outputs
				.rst_n		(rst_n),
				// Inputs
				.clk		(clk),
				.rst_async_n	(rst_async_n));
   
   initial begin
      $display("-I- Starting....");      
      $dumpfile("tb.vcd");
      $dumpvars(0,tb);
      rst_async_n <= 1'b0;
      #100;
      rst_async_n <= 1'b1;
      #5000;
      $display("-I- Done !");
      $finish;
   end




   
endmodule // tb
/*
 Local Variables:
 verilog-library-directories:(
 "."
 )
 End:
 */
