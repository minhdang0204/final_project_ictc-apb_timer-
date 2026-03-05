task run_test();
	integer	fail_num;
	begin	
		$display("//////////////////////////////////////////////////////////");
		$display("			RST CHECK			    ");
		$display("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
	
		fail_num = 0;
		$display("====================== check reset =========================");
		
		rd_chk(12'h00,32'h00000100,fail_num); //tcr
		rd_chk(12'h04,32'h00000000,fail_num); //tdr0
		rd_chk(12'h08,32'h00000000,fail_num); //tdr1
		rd_chk(12'h0C,32'hFFFFFFFF,fail_num); //tcmp0
		rd_chk(12'h10,32'hFFFFFFFF,fail_num); //tcmp1
		rd_chk(12'h14,32'h00000000,fail_num); //tier
		rd_chk(12'h18,32'h00000000,fail_num); //tisr
		rd_chk(12'h1C,32'h00000000,fail_num); //thcsr

		$display("=============================================================");

		if(fail_num == 0) begin
			$display("Test_result  PASSED ");
		end
		else begin
			$display("Test_result  FAIL   ");
		end
	end
endtask

task rd_chk;
	input	[11:0] 	addr;
	input	[31:0]	exp;
	inout	integer fail_num;
	begin
		@(posedge test_bench.sys_clk);#1
		test_bench.tim_paddr 	=	addr;
		test_bench.tim_pwrite	=	1'b0;
		test_bench.tim_psel	=	1'b1;
		
		@(posedge test_bench.sys_clk);#1
		test_bench.tim_penable	=	1'b1;

		wait(test_bench.tim_pready);#1

		if(test_bench.tim_prdata == exp) begin
			$display("===================================================================================================");
			$display("%10t Pass: Addr %h = %h",$time, addr,test_bench.tim_prdata);
			$display("===================================================================================================");
		end
		else begin
			fail_num = fail_num+1;
			$display("===================================================================================================");
			$display("%10t Fail: Addr %h = %h, exp = %h",$time, addr,test_bench.tim_prdata,exp);
			$display("===================================================================================================");
		end
		@(posedge sys_clk);#1
		test_bench.tim_psel	=	1'b0;
		test_bench.tim_penable	=	1'b0;
	end
endtask

