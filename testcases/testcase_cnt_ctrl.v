task run_test();
	integer fail_num;
	reg [63:0] cnt;
	reg [31:0] task_rdata;
	begin
		fail_num = 0;
		test_bench.dbg_mode = 1;
		$display("//////////////////////////////////////////////////////////");
		$display("			CNT_CTRL CHECK			    ");
		$display("\\\\\\\\\\\\\\\\\\\\\\\\\\\///////////////////////////////");
		$display("DEBUG MODE IS ON");
		$display("----------------------------------------------------------");
		
		$display("*************************TEST 1:**************************");
		$display("NORMAL COUNTING MODE:");
		wr_chk(12'h000,32'h0000_0001);
		
		repeat(100) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;

		check_counting(cnt,64'h0000_0000_0000_0068,fail_num);

		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'b0);
		

		wr_chk(12'h004,32'hFFFF_FF00);
		wr_chk(12'h008,32'b0);
		wr_chk(12'h000,32'h0000_0001);
		repeat(256) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;

		check_counting(cnt,64'h0000_0001_0000_0004,fail_num);
		
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'b0);
		

		$display("*************************TEST 2:**************************");
		$display("DIV VAL = 0:");
		wr_chk(12'h000,32'h0000_0003);
		
		repeat(346) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;

		check_counting(cnt,64'h0000_0000_0000_015e,fail_num);
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'h0000_0002);
		wr_chk(12'h000,32'b0);
		
	
		$display("DIV VAL = 1:");
		wr_chk(12'h000,32'h0000_0103);
		
		repeat(256) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;
		check_counting(cnt,64'h0000_0000_0000_0082,fail_num);
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'h0000_0102);
		wr_chk(12'h000,32'b0);
	
		
		$display("DIV VAL = 2:");
		wr_chk(12'h000,32'h0000_0203);
		
		repeat(256) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;
		check_counting(cnt,64'h0000_0000_0000_0041,fail_num);
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'h0000_0202);
		wr_chk(12'h000,32'b0);
		
		$display("DIV VAL = 3:");
		wr_chk(12'h000,32'h0000_0303);
		
		repeat(256) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;
		check_counting(cnt,64'h0000_0000_0000_0020,fail_num);
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'h0000_0302);
		wr_chk(12'h000,32'b0);

		$display("DIV VAL = 4:");
		wr_chk(12'h000,32'h0000_0403);
		
		repeat(256) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;
		check_counting(cnt,64'h0000_0000_0000_0010,fail_num);
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'h0000_0402);
		wr_chk(12'h000,32'b0);
		
		$display("DIV VAL = 5:");
		wr_chk(12'h000,32'h0000_0503);
		
		repeat(256) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;
		check_counting(cnt,64'h0000_0000_0000_0008,fail_num);
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'h0000_0502);
		wr_chk(12'h000,32'b0);

		$display("DIV VAL = 6:");
		wr_chk(12'h000,32'h0000_0603);
		
		repeat(256) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;
		check_counting(cnt,64'h0000_0000_0000_0004,fail_num);
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'h0000_0602);
		wr_chk(12'h000,32'b0);

		$display("DIV VAL = 7:");
		wr_chk(12'h000,32'h0000_0703);
		
		repeat(256) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;
		check_counting(cnt,64'h0000_0000_0000_0002,fail_num);
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'h0000_0702);
		wr_chk(12'h000,32'b0);

		$display("DIV VAL = 8:");
		wr_chk(12'h000,32'h0000_0803);
		
		repeat(256) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;
		check_counting(cnt,64'h0000_0000_0000_0001,fail_num);
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'h0000_0802);
		wr_chk(12'h000,32'b0);
		
		$display("DIV VAL = 8, DIV EN = 0");
		wr_chk(12'h000,32'h0000_0801);
		
		repeat(100) @(posedge test_bench.sys_clk);
		#1
		wr_chk(12'h01C,32'h0000_0001);

		rd_chk(12'h004,task_rdata);
		$display("%10t rdata of TDR0 = %h",$time,task_rdata);
		cnt[31:0] = task_rdata;
		rd_chk(12'h008,task_rdata);
		$display("%10t rdata of TDR1 = %h",$time,task_rdata);
		cnt[63:32] = task_rdata;
		check_counting(cnt,64'h0000_0000_0000_0068,fail_num);
		wr_chk(12'h004,32'b0);
		wr_chk(12'h008,32'b0);	
		wr_chk(12'h01C,32'h0000_0000);
		wr_chk(12'h000,32'h0000_0800);
		wr_chk(12'h000,32'b0);
	
	
		if(fail_num == 0) begin
		        $display("Test_result  PASSED ");
		end
		else begin
		        $display("Test_result  FAIL   ");
		end

	end
		


endtask

task check_counting;
	input [63:0]	cnt;
	input [63:0]	exp_cnt;
	inout 		fail_num;
	begin
		if(cnt == exp_cnt) begin
			$display("----------------------------------------");
			$display("%10t	Pass:	exp_cnt = %h		  ",$time,exp_cnt);
			$display("		actual  = %h		  ",cnt);
			$display("----------------------------------------");
		end
		else begin
			fail_num = fail_num + 1;
			$display("----------------------------------------");
			$display("%10t	Fail:	exp_cnt = %h		  ",$time,exp_cnt);
			$display("		actual  = %h		  ",cnt);
			$display("----------------------------------------");
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
	output	[31:0]  rdata;	
	begin
		$display(" %10t Read data at addr %h    	 " ,$time,addr);
		@(posedge test_bench.sys_clk);#1
		test_bench.tim_paddr 	=	addr;
		test_bench.tim_pwrite	=	1'b0;
		test_bench.tim_psel	=	1'b1;
		
		@(posedge test_bench.sys_clk);#1
		test_bench.tim_penable	=	1'b1;
		wait(test_bench.tim_pready);#1
		rdata = test_bench.tim_prdata;

		@(posedge sys_clk);#1
		test_bench.tim_paddr 	=	12'b0;
		test_bench.tim_psel	=	1'b0;
		test_bench.tim_penable	=	1'b0;
	end
endtask


