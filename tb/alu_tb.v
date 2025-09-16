
`include "rtl/alu.v"

module alu_tb;
	reg iCLK;
  reg iOPCODE;
	reg [7:0] iDATAIN1;
	reg [7:0] iDATAIN2;
	wire [7:0] oDATAOUT;
	integer i;
 
	initial begin
		$dumpfile("sim/alu_tb.vcd");
    $dumpvars(0,alu_tb);

		iCLK = 1;
		iOPCODE = 0;
		for (i = 0; i <10; i = i +1 ) begin
			iCLK=0;
			iOPCODE  = ! iOPCODE;			  //1'b0;
			iDATAIN1 = {$random}%255;	 	//8'h01;
			iDATAIN2 = {$random}%255;		//8'h03;
			#10;
			iCLK=1;	
			#10;	
		end

	end
 

	alu u1(
		.iCLK(iCLK),

		.iOPCODE(iOPCODE),
		.iDATAIN1(iDATAIN1),
		.iDATAIN2(iDATAIN2),
		
		.oDATAOUT(oDATAOUT)
	);


endmodule

