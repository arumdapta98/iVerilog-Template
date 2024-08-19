module addsub (
  input iCLK,
  input iOPCODE,	              // 0: ADD, 1: SUB
	input [7:0] iDATAIN1,         // input datain1
	input [7:0] iDATAIN2,         // input datain2
	output reg [7:0] oDATAOUT
  );

	always @ (posedge iCLK)
	begin
    case (iOPCODE)
		  1'b0 : oDATAOUT <= iDATAIN1 + iDATAIN2;
		  1'b1 : oDATAOUT <= iDATAIN1 - iDATAIN2;
      default : oDATAOUT <= 8'h00;
    endcase
	end

endmodule
