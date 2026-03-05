coverage exclude -src ../rtl/apb_slave_wait_state.v -code s -line 23 -comment {PSEL HAS TO BE 1 TO START TRANSFERING} 
coverage exclude -src ../rtl/apb_slave_wait_state.v -code s -line 34 -comment {PSEL HAS TO BE 1 TO START TRANSFERING} 
coverage exclude -src ../rtl/apb_slave_wait_state.v -code e -line 23-34 -comment {PSEL HAS TO BE 1 TO START TRANSFERING} 
coverage exclude -src run_test.v -code s -line 4-51 -comment {this testcase only check the pslverr, so only use 1 addr} 
coverage exclude -src run_test.v -code s -line 52-59 -comment {no fail_num} 
coverage exclude -src run_test.v -code s -line 60-62 -comment {no fault in rtl code} 
coverage exclude -src run_test.v -code s -line 63-73 -comment {no fault in rtl code} 
coverage exclude -src run_test.v -code s -line 74-82 -comment {no fault in rtl code} 
coverage exclude -src run_test.v -code s -line 83-344
coverage exclude -src run_test.v -code b -line 22-51 -comment {this testcase only check the pslverr, so only use 1 addr} 
coverage exclude -src run_test.v -code b -line 59 -comment {no fail_num} 
coverage exclude -src run_test.v -code b -line 61-62 -comment {no fault in rtl code} 
coverage exclude -src run_test.v -code b -line 70-82 -comment {no fault in rtl code} 
coverage exclude -src run_test.v -code b -line 87-288
coverage exclude -src run_test.v -code c -line 22-59 -comment {no fail_num} 
coverage exclude -src run_test.v -code c -line 82 -comment {no fault in rtl code} 
coverage exclude -src run_test.v -code c -line 95-283
coverage exclude -scope /test_bench -togglenode dbg_mode sys_rst_n {tim_paddr[0]} {tim_paddr[1]} {tim_paddr[6]} {tim_paddr[8]} {tim_paddr[9]} {tim_paddr[10]} {tim_paddr[11]} -comment {don't use} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tcr[2]} {tcr[3]} {tcr[4]} -comment {rd} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tcr[5]} {tcr[6]} {tcr[7]} {tcr[12]} {tcr[13]} {tcr[14]} {tcr[15]} {tcr[16]} {tcr[17]} {tcr[18]} -comment {rb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tcr[19]} {tcr[20]} {tcr[21]} {tcr[22]} {tcr[23]} {tcr[24]} {tcr[25]} {tcr[26]} {tcr[27]} {tcr[28]} -comment {rb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tcr[29]} {tcr[30]} {tcr[31]} {thcsr[2]} {thcsr[3]} {thcsr[4]} {thcsr[5]} {thcsr[6]} {thcsr[7]} {thcsr[8]} {thcsr[9]} {thcsr[10]} {thcsr[11]} -comment {rb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {thcsr[12]} {thcsr[13]} {thcsr[14]} {thcsr[15]} {thcsr[16]} {thcsr[17]} {thcsr[18]} {thcsr[19]} {thcsr[20]} {thcsr[21]} -comment {rb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {thcsr[22]} {thcsr[23]} {thcsr[24]} {thcsr[25]} {thcsr[26]} {thcsr[27]} {thcsr[28]} {thcsr[29]} {thcsr[30]} {thcsr[31]}
coverage exclude -scope /test_bench/u_dut/register -togglenode {tier[1]} {tier[2]} {tier[3]} {tier[4]} {tier[5]} {tier[6]} {tier[7]} {tier[8]} {tier[9]} {tier[10]} -comment {rb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tier[11]} {tier[12]} {tier[13]} -comment {rb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tier[14]} -comment {rbb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tier[15]} {tier[16]} {tier[17]} {tier[18]} {tier[19]} {tier[20]} {tier[21]} {tier[22]} {tier[23]} {tier[24]} -comment {rb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tier[25]} {tier[26]} {tier[27]} {tier[28]} {tier[29]} {tier[30]} {tier[31]} {tisr[1]} {tisr[2]} {tisr[3]} {tisr[4]} {tisr[5]} {tisr[6]} {tisr[7]} {tisr[8]} {tisr[9]} {tisr[10]} -comment {rb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tisr[11]} {tisr[12]} {tisr[13]} {tisr[14]} {tisr[15]} {tisr[16]} {tisr[17]} {tisr[18]} {tisr[19]} {tisr[20]} -comment {rb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tisr[21]} {tisr[22]} {tisr[23]} {tisr[24]} {tisr[25]} {tisr[26]} {tisr[27]} {tisr[28]} {tisr[29]} {tisr[30]} -comment {rb} 
coverage exclude -scope /test_bench/u_dut/register -togglenode {tisr[31]} -comment {rb} 
