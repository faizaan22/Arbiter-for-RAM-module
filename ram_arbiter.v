module ram_arbiter #(
	parameter G_ADDR_WIDTH = 4,
	parameter G_DATA_WIDTH = 8,
	parameter G_REGISTERED_DATA = 0
)
(
	input RST_N, CLOCK,
	output RST_DONE,
	
	input RD_EN_C1, WR_EN_C1,
	input [G_ADDR_WIDTH-1 : 0] RDADDR_C1, WRADDR_C1,
	input [G_DATA_WIDTH-1 : 0] WRDATA_C1,
	
	input [G_DATA_WIDTH-1 : 0] DATAIN_C2,
	input REQUEST_C2, RD_NOT_WRITE_C2,
	input [G_ADDR_WIDTH-1 : 0] ADDR_C2,
	
	output [G_DATA_WIDTH-1 : 0] RDDATA_C1, DATAOUT_C2,
	output ACK_C2
);

wire [G_DATA_WIDTH-1 : 0] WR_DATA, RD_DATA1;
wire [G_ADDR_WIDTH-1 : 0] WR_ADDR, RD_ADDR;
wire RD_EN, WR_EN;

ram #(G_ADDR_WIDTH, G_DATA_WIDTH) dut1 (.CLOCK(CLOCK),
.RST_N(RST_N),
.RD_EN(RD_EN),
.WR_EN(WR_EN),
.RD_ADDR(RD_ADDR),
.WR_ADDR(WR_ADDR),
.WR_DATA(WR_DATA),
.RD_DATA(RD_DATA1));

arbiter #(G_ADDR_WIDTH,G_DATA_WIDTH,G_REGISTERED_DATA) dut2 (.RST_N(RST_N),
.CLOCK(CLOCK),
.RST_DONE(RST_DONE),
.RD_EN_C1(RD_EN_C1),
.WR_EN_C1(WR_EN_C1),
.RDADDR_C1(RDADDR_C1),
.WRADDR_C1( WRADDR_C1),
.WRDATA_C1( WRDATA_C1),
.REQUEST_C2( REQUEST_C2),
.RD_NOT_WRITE_C2( RD_NOT_WRITE_C2),
.ADDR_C2( ADDR_C2),
.DATAIN_C2( DATAIN_C2),
.RD_EN( RD_EN),
.WR_EN( WR_EN),
.RD_ADDR( RD_ADDR),
.WR_ADDR( WR_ADDR),
.WR_DATA( WR_DATA),
.RD_DATA(RD_DATA1),
.DATAOUT_C2(DATAOUT_C2),
.ACK_C2(ACK_C2),
.RDDATA_C1(RDDATA_C1));

endmodule 