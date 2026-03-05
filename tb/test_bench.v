module test_bench;
	reg 		sys_clk;
 	reg		sys_rst_n;
  	reg		tim_psel;
  	reg		tim_pwrite;
  	reg		tim_penable;
  	reg	[11:0]	tim_paddr;
  	reg	[31:0]	tim_pwdata;
  	reg	[3:0]	tim_pstrb;
  	reg		dbg_mode;
	wire	[31:0]	tim_prdata;
	wire		tim_pready;
	wire		tim_pslverr;
	wire		tim_int;


	timer_top u_dut(.*);
    
	`include "run_test.v"
	initial begin
		sys_clk = 0;
		forever #10 sys_clk = ~sys_clk;
	end
	
 	initial begin
		sys_rst_n 	= 0;
        	tim_paddr 	= 12'b0;
		tim_pwrite 	= 1'b0;
		tim_psel	= 1'b0;
		tim_penable	= 1'b0;
		tim_pwdata	= 32'b0;
		tim_pstrb	= 4'b0;
		dbg_mode	= 1'b0;	
		#40
		sys_rst_n	= 1'b1;

		#40
		run_test();
        	#100;
       	 	$finish;
    	end

endmodule
