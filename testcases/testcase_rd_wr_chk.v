task run_test();
	integer fail_num;
	begin
		$display("//////////////////////////////////////////////////////////");
		$display("			R/W CHECK			    ");
		$display("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");

		fail_num = 0;
		$display("================= Check R/W TCR ===================");
		wr_chk(12'h000,32'h0000_0000);
		rd_chk(12'h000,32'h0000_0000,fail_num);
		wr_chk(12'h000,32'h3333_3333);
		rd_chk(12'h000,32'h0000_0303,fail_num);
		wr_chk(12'h000,32'haaaa_aaaa);
		rd_chk(12'h000,32'h0000_0303,fail_num);
		wr_chk(12'h000,32'hffff_ffff);
		rd_chk(12'h000,32'h0000_0303,fail_num);
		


		$display("================= Check R/W TDR0 ==================");
		wr_chk(12'h004,32'h0000_0000);
		rd_chk(12'h004,32'h0000_0000,fail_num);
		wr_chk(12'h004,32'hffff_ffff);
		rd_chk(12'h004,32'hffff_ffff,fail_num);
		wr_chk(12'h004,32'h5555_5555);
		rd_chk(12'h004,32'h5555_5555,fail_num);
		wr_chk(12'h004,32'haaaa_aaaa);
		rd_chk(12'h004,32'haaaa_aaaa,fail_num);
		

		$display("================= Check R/W TDR1 ==================");
		wr_chk(12'h008,32'h0000_0000);
		rd_chk(12'h008,32'h0000_0000,fail_num);
		wr_chk(12'h008,32'hffff_ffff);
		rd_chk(12'h008,32'hffff_ffff,fail_num);
		wr_chk(12'h008,32'h5555_5555);
		rd_chk(12'h008,32'h5555_5555,fail_num);	
		wr_chk(12'h008,32'haaaa_aaaa);
		rd_chk(12'h008,32'haaaa_aaaa,fail_num);

		$display("================= Check R/W TCMP0 =================");	
		wr_chk(12'h00C,32'h0000_0000);
		rd_chk(12'h00C,32'h0000_0000,fail_num);
		wr_chk(12'h00C,32'hffff_ffff);
		rd_chk(12'h00C,32'hffff_ffff,fail_num);
		wr_chk(12'h00C,32'h5555_5555);	
		rd_chk(12'h00C,32'h5555_5555,fail_num);
		wr_chk(12'h00C,32'haaaa_aaaa);
		rd_chk(12'h00C,32'haaaa_aaaa,fail_num);


		$display("================= Check R/W TCMP1 =================");
		wr_chk(12'h010,32'h0000_0000);
		rd_chk(12'h010,32'h0000_0000,fail_num);
		wr_chk(12'h010,32'hffff_ffff);
		rd_chk(12'h010,32'hffff_ffff,fail_num);
		wr_chk(12'h010,32'h5555_5555);
		rd_chk(12'h010,32'h5555_5555,fail_num);
		wr_chk(12'h010,32'haaaa_aaaa);
		rd_chk(12'h010,32'haaaa_aaaa,fail_num);


		$display("================= Check R/W TIER ==================");
		wr_chk(12'h014,32'h0000_0000);
		rd_chk(12'h014,32'h0000_0000,fail_num);
		wr_chk(12'h014,32'h3333_3333);
		rd_chk(12'h014,32'h0000_0001,fail_num);
		wr_chk(12'h014,32'haaaa_aaaa);
		rd_chk(12'h014,32'h0000_0000,fail_num);
		wr_chk(12'h014,32'hffff_ffff);
		rd_chk(12'h014,32'h0000_0001,fail_num);
	

		$display("================= Check R/W TISR ==================");
		wr_chk(12'h018,32'h0000_0000);
		rd_chk(12'h018,32'h0000_0000,fail_num);
		wr_chk(12'h018,32'h3333_3333);
		rd_chk(12'h018,32'h0000_0000,fail_num);
		wr_chk(12'h018,32'haaaa_aaaa);
		rd_chk(12'h018,32'h0000_0000,fail_num);
		wr_chk(12'h018,32'hffff_ffff);
		rd_chk(12'h018,32'h0000_0000,fail_num);

		$display("================= Check R/W THCSR =================");
		wr_chk(12'h01C,32'h0000_0000);
		rd_chk(12'h01C,32'h0000_0000,fail_num);
		wr_chk(12'h01C,32'hffff_ffff);
		rd_chk(12'h01C,32'h0000_0001,fail_num);
		wr_chk(12'h01C,32'h5555_5555);
		rd_chk(12'h01C,32'h0000_0001,fail_num);
		wr_chk(12'h01C,32'haaaa_aaaa);
		rd_chk(12'h01C,32'h0000_0000,fail_num);

		if(fail_num == 0) begin
			$display("Test_result  PASSED ");
		end
		else begin
			$display("Test_result  FAIL   ");
		end

	end
endtask

task wr_chk;
	input	[11:0] 	addr;
	input	[31:0]	wdata;
	
	begin
		@(posedge test_bench.sys_clk);#1
		test_bench.tim_paddr	=	addr;
		test_bench.tim_pwrite	=	1'b1;
		test_bench.tim_psel	=	1'b1;
		test_bench.tim_pwdata	= 	wdata;
		test_bench.tim_pstrb	=	4'b1111;
		@(posedge test_bench.sys_clk);#1
		test_bench.tim_penable	=	1'b1;

		wait(test_bench.tim_pready);#1
		$display(" %10t Write data %h at addr %h",$time,wdata,addr);

		@(posedge test_bench.sys_clk);#1
		test_bench.tim_paddr 	=	12'b0;
		test_bench.tim_psel	=	1'b0;
		test_bench.tim_penable	=	1'b0;
		test_bench.tim_pwrite	=	1'b0;
		test_bench.tim_pwdata	= 	32'b0;
		test_bench.tim_pstrb	=	4'b0000;

	end
endtask
		
task rd_chk;
	input	[11:0] 	addr;
	input	[31:0]	exp;
	inout	integer fail_num;
	begin
		$display(" %10t Read data at addr %h    	 " ,$time,addr);
		@(posedge test_bench.sys_clk);#1
		test_bench.tim_paddr 	=	addr;
		test_bench.tim_pwrite	=	1'b0;
		test_bench.tim_psel	=	1'b1;
		
		@(posedge test_bench.sys_clk);#1
		test_bench.tim_penable	=	1'b1;

		wait(test_bench.tim_pready);#1

		if(test_bench.tim_prdata == exp) begin
			$display("===================================================================================================");
			$display("%10t Pass: Data of Addr %h = %h",$time, addr,test_bench.tim_prdata);
			$display("===================================================================================================");
		end
		else begin
			fail_num = fail_num+1;
			$display("===================================================================================================");
			$display("%10t Fail: Data of Addr %h = %h, exp = %h",$time, addr,test_bench.tim_prdata,exp);
			$display("===================================================================================================");
		end
		@(posedge sys_clk);#1
		test_bench.tim_paddr 	=	12'b0;
		test_bench.tim_psel	=	1'b0;
		test_bench.tim_penable	=	1'b0;
	end
endtask

