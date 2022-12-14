// YCbCr to RGB 
module YCbCr2RGB (	Red,Green,Blue,oDVAL,
					iY,iCb,iCr,iDVAL,
					iRESET,iCLK);
//	Input
input [7:0] iY,iCb,iCr;
input iDVAL,iRESET,iCLK;
wire iCLK;
//	Output
output [9:0] Red,Green,Blue;
output reg	oDVAL;
//	Internal Registers/Wires
reg [9:0] oRed,oGreen,oBlue;
reg	[3:0] oDVAL_d;
reg [19:0] X_OUT,Y_OUT,Z_OUT;
wire [26:0] X,Y,Z;

assign	Red  =	oRed;
assign	Green=	oGreen;
assign	Blue =	oBlue;

always@(posedge iCLK)
begin
	if(iRESET)
	begin
		oDVAL<=0;
		oDVAL_d<=0;
		oRed<=0;
		oGreen<=0;
		oBlue<=0;
	end
	else
	begin
		// Red
		if(X_OUT[19])
		oRed<=0;
		else if(X_OUT[18:0]>1023)
		oRed<=1023;
		else
		oRed<=X_OUT[9:0];
		// Green
		if(Y_OUT[19])
		oGreen<=0;
		else if(Y_OUT[18:0]>1023)
		oGreen<=1023;
		else
		oGreen<=Y_OUT[9:0];
		// Blue
		if(Z_OUT[19])
		oBlue<=0;
		else if(Z_OUT[18:0]>1023)
		oBlue<=1023;
		else
		oBlue<=Z_OUT[9:0];
		// Control
		{oDVAL,oDVAL_d}<={oDVAL_d,iDVAL};
	end
end

always@(posedge iCLK)
begin
	if(iRESET)
	begin
		X_OUT<=0;
		Y_OUT<=0;
		Z_OUT<=0;
	end
	else
	begin
		X_OUT<=( X - 114131 ) >>7;
		Y_OUT<=( Y + 69370  ) >>7;
		Z_OUT<=( Z - 141787 ) >>7;			
	end
end

//	Y		596,		0,			817
MAC_3 u0(
			.aclr0(iRESET),
			.clock0(iCLK),
			.dataa_0(iY),
			.dataa_1(iCb),
			.dataa_2(iCr),
			.datab_0(17'h00254),
			.datab_1(17'h00000),
			.datab_2(17'h00331),
			.result(X)			
			);
//MAC_3 u0(	iRESET,		iCLK,iY,			iCb,		iCr,
//			17'h00254,	17'h00000,	17'h00331,
//					 X);
//	Cb		596,		-200,		-416
MAC_3 u1(
			.aclr0(iRESET),
			.clock0(iCLK),
			.dataa_0(iY),
			.dataa_1(iCb),
			.dataa_2(iCr),
			.datab_0(17'h00254),
			.datab_1(17'h3FF38),
			.datab_2(17'h3FE60),
			.result(Y)			
			);
//MAC_3 u1(	iRESET,		iCLK,iY,			iCb,		iCr,
//			17'h00254,	17'h3FF38,	17'h3FE60,
//			Y		);
//	Cr		596,		1033,		0
MAC_3 u2(
			.aclr0(iRESET),
			.clock0(iCLK),
			.dataa_0(iY),
			.dataa_1(iCb),
			.dataa_2(iCr),
			.datab_0(17'h00254),
			.datab_1(17'h00409),
			.datab_2(17'h00000),
			.result(Z)			
			);
//MAC_3 u2(	iRESET,		iCLK,iY,			iCb,		iCr,
//			17'h00254,	17'h00409,	17'h00000,
//			Z		);

endmodule
