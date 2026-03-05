task run_test();
	integer fail_num;
	begin
		fail_num = 0;
		$display("//////////////////////////////////////////////////////////");
		$display("			APB_PSLVERR_CHK			    ");
		$display("\\\\\\\\\\\\\\\\\\\\\\\\\\\///////////////////////////////");	

		$display("TEST 1: INVALID DIV VAL");
		apb_wr_chk_pslverr(12'h000,32'h0000_0900,1,fail_num);
		apb_wr_chk_pslverr(12'h000,32'h0000_0a00,1,fail_num);	
		
		$display("TEST 2: DIV EN VIOLATION");
		apb_wr_chk_pslverr(12'h000,32'h0000_0003,0,fail_num);
		apb_wr_chk_pslverr(12'h000,32'h0000_0001,1,fail_num);
		apb_wr_chk_pslverr(12'h000,32'h0000_0002,0,fail_num);
		apb_wr_chk_pslverr(12'h000,32'h0000_0000,0,fail_num);
		
		$display("TEST 3: DIV VAL VIOLATION");
		$display("---------------Case 1------------------");
		apb_wr_chk_pslverr(12'h000,32'h0000_0103,0,fail_num);
		apb_wr_chk_pslverr(12'h000,32'h0000_0203,1,fail_num);
		apb_wr_chk_pslverr(12'h000,32'h0000_0102,0,fail_num);
		apb_wr_chk_pslverr(12'h000,32'h0000_0000,0,fail_num);

		$display("---------------Case 2------------------");
		apb_wr_chk_pslverr(12'h000,32'h0000_0203,0,fail_num);
		apb_wr_chk_pslverr(12'h000,32'h0000_0503,1,fail_num);
		apb_wr_chk_pslverr(12'h000,32'h0000_0202,0,fail_num);
		apb_wr_chk_pslverr(12'h000,32'h0000_0000,0,fail_num);

		
		if(fail_num == 0) begin 
			$display("Test_result  PASSED ");
		end
		else begin
			$display("Test_result  FAIL   ");
		end

	end
endtask

task apb_wr_chk_pslverr;
	input	[11:0] 	addr;
	input	[31:0]	wdata;
	input		exp_err;
	inout		fail_num;
	
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
		if(exp_err) begin
			if(test_bench.tim_pslverr != 1) begin
				$display("%10t FAIL: Pslverr doesn't assert at addr %h",$time,addr);
				fail_num = fail_num + 1;
			end
			else
				$display("%10t PASS: Pslverr assert at addr %h",$time,addr);
		end
		else begin
			if(test_bench.tim_pslverr != 1) begin
				$display("%10t PASS: Pslverr doesn't assert at addr %h",$time,addr);
			end
			else begin
				$display("%10t FAIL: Pslverr assert at addr %h",$time,addr);
				fail_num = fail_num + 1;
			end
		end


		@(posedge test_bench.sys_clk);#1
		if(test_bench.tim_pslverr) begin
			fail_num = fail_num + 1;
			$display("%10t FAIL: Pslverr doesn't deassert after 1 cycle",$time);
		end
		test_bench.tim_paddr 	=	12'b0;
		test_bench.tim_psel	=	1'b0;
		test_bench.tim_penable	=	1'b0;
		test_bench.tim_pwrite	=	1'b0;
		test_bench.tim_pwdata	= 	32'b0;
		test_bench.tim_pstrb	=	4'b0000;

	end
endtask

