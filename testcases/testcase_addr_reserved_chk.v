task run_test();
	integer fail_num;
	begin
		$display("//////////////////////////////////////////////////////////");
		$display("			RESERVED ADDR CHECK		    ");
		$display("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");

		fail_num = 0;
		$display("================= Check R/W addr = 12'h020 ===================");
		wr_chk(12'h020,32'h0000_0000);
		rd_chk(12'h020,32'h0000_0000,fail_num);
		wr_chk(12'h020,32'hffff_ffff);
		rd_chk(12'h020,32'h0000_0000,fail_num);
		wr_chk(12'h020,32'h5555_5555);
		rd_chk(12'h020,32'h0000_0000,fail_num);
		wr_chk(12'h020,32'haaaa_aaaa);
		rd_chk(12'h020,32'h0000_0000,fail_num);
		
		$display("================= Check R/W addr = 12'h024 ===================");
		wr_chk(12'h024,32'h0000_0000);
		rd_chk(12'h024,32'h0000_0000,fail_num);
		wr_chk(12'h024,32'hffff_ffff);
		rd_chk(12'h024,32'h0000_0000,fail_num);
		wr_chk(12'h024,32'h5555_5555);
		rd_chk(12'h024,32'h0000_0000,fail_num);
		wr_chk(12'h024,32'haaaa_aaaa);
		rd_chk(12'h024,32'h0000_0000,fail_num);
	
		$display("================= Check R/W addr = 12'h028 ===================");
		wr_chk(12'h028,32'h0000_0000);
		rd_chk(12'h028,32'h0000_0000,fail_num);
		wr_chk(12'h028,32'hffff_ffff);
		rd_chk(12'h028,32'h0000_0000,fail_num);
		wr_chk(12'h028,32'h5555_5555);
		rd_chk(12'h028,32'h0000_0000,fail_num);
		wr_chk(12'h028,32'haaaa_aaaa);
		rd_chk(12'h028,32'h0000_0000,fail_num);
		
		$display("================= Check R/W addr = 12'h080 ===================");
		wr_chk(12'h080,32'h0000_0000);
		rd_chk(12'h080,32'h0000_0000,fail_num);
		wr_chk(12'h080,32'hffff_ffff);
		rd_chk(12'h080,32'h0000_0000,fail_num);
		wr_chk(12'h080,32'h5555_5555);
		rd_chk(12'h080,32'h0000_0000,fail_num);
		wr_chk(12'h080,32'haaaa_aaaa);
		rd_chk(12'h080,32'h0000_0000,fail_num);
		
		$display("================= Check R/W addr = 12'h0084 ===================");
		wr_chk(12'h084,32'h0000_0000);
		rd_chk(12'h084,32'h0000_0000,fail_num);
		wr_chk(12'h084,32'hffff_ffff);
		rd_chk(12'h084,32'h0000_0000,fail_num);
		wr_chk(12'h084,32'h5555_5555);
		rd_chk(12'h084,32'h0000_0000,fail_num);
		wr_chk(12'h084,32'haaaa_aaaa);
		rd_chk(12'h084,32'h0000_0000,fail_num);

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

