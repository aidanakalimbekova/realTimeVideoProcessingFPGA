module DIV (
	aclr,
	clock,
	denom,
	numer,
	quotient,
	remain);

	input	  aclr;
	input	  clock;
	input	[3:0]  denom;
	input	[9:0]  numer;
	output	[9:0]  quotient;
	output	[3:0]  remain;

	wire [9:0] sub_wire0;
	wire [3:0] sub_wire1;
	wire [9:0] quotient = sub_wire0[9:0];
	wire [3:0] remain = sub_wire1[3:0];

	lpm_divide	LPM_DIVIDE_component (
				.aclr (aclr),
				.clock (clock),
				.denom (denom),
				.numer (numer),
				.quotient (sub_wire0),
				.remain (sub_wire1),
				.clken (1'b1));
	defparam
		LPM_DIVIDE_component.lpm_drepresentation = "UNSIGNED",
		LPM_DIVIDE_component.lpm_hint = "LPM_REMAINDERPOSITIVE=TRUE",
		LPM_DIVIDE_component.lpm_nrepresentation = "UNSIGNED",
		LPM_DIVIDE_component.lpm_pipeline = 1,
		LPM_DIVIDE_component.lpm_type = "LPM_DIVIDE",
		LPM_DIVIDE_component.lpm_widthd = 4,
		LPM_DIVIDE_component.lpm_widthn = 10;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: PRIVATE: PRIVATE_LPM_REMAINDERPOSITIVE STRING "TRUE"
// Retrieval info: PRIVATE: PRIVATE_MAXIMIZE_SPEED NUMERIC "-1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: USING_PIPELINE NUMERIC "1"
// Retrieval info: PRIVATE: VERSION_NUMBER NUMERIC "2"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_DREPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_HINT STRING "LPM_REMAINDERPOSITIVE=TRUE"
// Retrieval info: CONSTANT: LPM_NREPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_PIPELINE NUMERIC "1"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_DIVIDE"
// Retrieval info: CONSTANT: LPM_WIDTHD NUMERIC "4"
// Retrieval info: CONSTANT: LPM_WIDTHN NUMERIC "10"
// Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT NODEFVAL "aclr"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: denom 0 0 4 0 INPUT NODEFVAL "denom[3..0]"
// Retrieval info: USED_PORT: numer 0 0 10 0 INPUT NODEFVAL "numer[9..0]"
// Retrieval info: USED_PORT: quotient 0 0 10 0 OUTPUT NODEFVAL "quotient[9..0]"
// Retrieval info: USED_PORT: remain 0 0 4 0 OUTPUT NODEFVAL "remain[3..0]"
// Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @denom 0 0 4 0 denom 0 0 4 0
// Retrieval info: CONNECT: @numer 0 0 10 0 numer 0 0 10 0
// Retrieval info: CONNECT: quotient 0 0 10 0 @quotient 0 0 10 0
// Retrieval info: CONNECT: remain 0 0 4 0 @remain 0 0 4 0
// Retrieval info: GEN_FILE: TYPE_NORMAL DIV.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL DIV.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL DIV.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL DIV.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL DIV_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL DIV_bb.v FALSE
// Retrieval info: LIB_FILE: lpm
