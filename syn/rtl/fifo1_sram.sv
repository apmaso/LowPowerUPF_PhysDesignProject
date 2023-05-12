// RTL Taken from:
// http://www.sunburst-design.com/papers/CummingsSNUG2002SJ_FIFO1.pdf

// Top module:
// Rajan Sankaranarayanan, Sathish Thirumalaisamy, ECE 581 Winter 2020

module fifo1_sram #(parameter DSIZE = 8, parameter ASIZE = 10) (
	output [DSIZE-1:0] rdata,
	output wfull,
	output rempty,
	input [DSIZE-1:0] wdata_in,
	input winc, wclk, wclk2x, wrst_n,
	input rinc, rclk, rrst_n);
	wire [ASIZE-1:0] waddr, raddr;
	wire [ASIZE:0] wptr, rptr, wq2_rptr, rq2_wptr;
	
	reg [DSIZE-1:0] wdata;

	always @(posedge wclk2x or negedge wrst_n)
	 	if (!wrst_n) 
			{wdata} <= 0;
 		else 
			wdata <= wdata_in;

	sync_r2w sync_r2w (.wq2_rptr(wq2_rptr), .rptr(rptr),
		.wclk(wclk), .wrst_n(wrst_n));
	
	sync_w2r sync_w2r (.rq2_wptr(rq2_wptr), .wptr(wptr),
		.rclk(rclk), .rrst_n(rrst_n));
	
	fifomem #(DSIZE, ASIZE) fifomem
		(.rdata(rdata), .wdata(wdata),
		.waddr(waddr), .raddr(raddr),
		.wclken(winc), .wfull(wfull),
		.wclk(wclk), .rclk(rclk));
	
	rptr_empty #(ASIZE) rptr_empty
		(.rempty(rempty),
		.raddr(raddr),
		.rptr(rptr), .rq2_wptr(rq2_wptr),
		.rinc(rinc), .rclk(rclk),
		.rrst_n(rrst_n));
	
	wptr_full #(ASIZE) wptr_full
		(.wfull(wfull), .waddr(waddr),
		.wptr(wptr), .wq2_rptr(wq2_rptr),
		.winc(winc), .wclk(wclk),
		.wrst_n(wrst_n));
	
endmodule


// ------------------------------------------------------------------
module fifomem #(parameter DATASIZE = 8, // Memory data word width
	parameter ADDRSIZE = 10) // Number of mem address bits
	(output [DATASIZE-1:0] rdata,
	input [DATASIZE-1:0] wdata,
	input [ADDRSIZE-1:0] waddr, raddr,
	input wclken, wfull, wclk,rclk);

	// RTL Verilog memory model
	localparam DEPTH = 1<<ADDRSIZE;
	/// reg [DATASIZE-1:0] mem [0:DEPTH-1];

	logic [7:0]rd_cs_n;
	logic [7:0]wr_cs_n;

	// 3 to 8 read address decoder
	always@( raddr[9:7]) begin
           rd_cs_n=8'hFF;
           case (raddr[9:7])
               3'b000: rd_cs_n[0]=1'b0;
               3'b001: rd_cs_n[1]=1'b0;
               3'b010: rd_cs_n[2]=1'b0;
               3'b011: rd_cs_n[3]=1'b0;
               3'b100: rd_cs_n[4]=1'b0;
               3'b101: rd_cs_n[5]=1'b0;
               3'b110: rd_cs_n[6]=1'b0;
               3'b111: rd_cs_n[7]=1'b0;
               default: rd_cs_n=8'hFF;
           endcase
  	end
	// 3 to 8 write address decoder
	always@( waddr[9:7]) begin
           wr_cs_n=8'hFF;
           case (waddr[9:7])
               3'b000: wr_cs_n[0]=1'b0;
               3'b001: wr_cs_n[1]=1'b0;
               3'b010: wr_cs_n[2]=1'b0;
               3'b011: wr_cs_n[3]=1'b0;
               3'b100: wr_cs_n[4]=1'b0;
               3'b101: wr_cs_n[5]=1'b0;
               3'b110: wr_cs_n[6]=1'b0;
               3'b111: wr_cs_n[7]=1'b0;
               default: wr_cs_n=8'hFF;
           endcase
  	end


        //1024x8 memory using 8 128x8 sram
	// A1 k Input Primary Read/Write Address 
	// CE1 1 Input Primary Positive-Edge Clock 
	// WEB1 1 Input Primary Write Enable, Active Low 
	// OEB1 1 Input Primary Output Enable, Active Low 
	// CSB1 1 Input Primary Chip Select, Active Low
	// I1 n Input Primary Input data bus 
	// O1 n Output Primary Output data bus 
	// A2 k Input Dual Read/Write Address 
	// CE2 1 Input Dual Positive-Edge Clock 
	// WEB2 1 Input Dual Write Enable, Active Low
	// OEB2 1 Input Dual Output Enable, Active Low 
	// CSB2 1 Input Dual Chip Select, Active Low 
	// I2 n Input Dual Input data bus 
	// O2 n Output Dual Output data bus 
	// VDD Power supply VSS Power ground 

	genvar i;
	generate
		for(i=0;i<8;i++) begin
			SRAM2RW128x8 U (.A1(waddr[6:0]),
					 .CE1(wclk),
					 .WEB1(wclken),
					 .OEB1(1'b1),
					 .CSB1(wr_cs_n[i]),
					 .I1(wdata),
					 .O1(),
					 .A2(raddr[6:0]),
					 .CE2(rclk),
					 .WEB2(1'b1),
					 .OEB2(1'b0),
					 .CSB2(rd_cs_n[i]),
					 .I2(8'h00),
					 .O2(rdata) );
		end
	endgenerate	

endmodule

// ------------------------------------------------------------------
module sync_r2w #(parameter ADDRSIZE = 10)
	(output reg [ADDRSIZE:0] wq2_rptr,
	input [ADDRSIZE:0] rptr,
	input wclk, wrst_n);
	reg [ADDRSIZE:0] wq1_rptr;
	always @(posedge wclk or negedge wrst_n)
		if (!wrst_n) {wq2_rptr,wq1_rptr} <= 0;
		else {wq2_rptr,wq1_rptr} <= {wq1_rptr,rptr};
endmodule

// ------------------------------------------------------------------
module sync_w2r #(parameter ADDRSIZE = 10)
	(output reg [ADDRSIZE:0] rq2_wptr,
	input [ADDRSIZE:0] wptr,
	input rclk, rrst_n);
	reg [ADDRSIZE:0] rq1_wptr;
	always @(posedge rclk or negedge rrst_n)
		if (!rrst_n) {rq2_wptr,rq1_wptr} <= 0;
		else {rq2_wptr,rq1_wptr} <= {rq1_wptr,wptr};
endmodule


// ------------------------------------------------------------------
module rptr_empty #(parameter ADDRSIZE = 10)
	(output reg rempty,
	output [ADDRSIZE-1:0] raddr,
	output reg [ADDRSIZE :0] rptr,
	input [ADDRSIZE :0] rq2_wptr,
	input rinc, rclk, rrst_n);
	reg [ADDRSIZE:0] rbin;
	wire [ADDRSIZE:0] rgraynext, rbinnext;
	wire rempty_val;
	//-------------------
	// GRAYSTYLE2 pointer
	//-------------------
	always @(posedge rclk or negedge rrst_n)
		if (!rrst_n) {rbin, rptr} <= 0;
	else {rbin, rptr} <= {rbinnext, rgraynext};
	// Memory read-address pointer (okay to use binary to address memory)
	assign raddr = rbin[ADDRSIZE-1:0];
	assign rbinnext = rbin + (rinc & ~rempty);
	assign rgraynext = (rbinnext>>1) ^ rbinnext;
	//---------------------------------------------------------------
	// FIFO empty when the next rptr == synchronized wptr or on reset
	//---------------------------------------------------------------
	assign rempty_val = (rgraynext == rq2_wptr);
	always @(posedge rclk or negedge rrst_n)
		if (!rrst_n) rempty <= 1'b1;
	else rempty <= rempty_val;
endmodule


// ------------------------------------------------------------------
module wptr_full #(parameter ADDRSIZE = 10)
	(output reg wfull,
	output [ADDRSIZE-1:0] waddr,
	output reg [ADDRSIZE :0] wptr,
	input [ADDRSIZE :0] wq2_rptr,
	input winc, wclk, wrst_n);
	reg [ADDRSIZE:0] wbin;
	wire [ADDRSIZE:0] wgraynext, wbinnext;
	wire wfull_val;
	// GRAYSTYLE2 pointer
	always @(posedge wclk or negedge wrst_n)
		if (!wrst_n) {wbin, wptr} <= 0;
		else {wbin, wptr} <= {wbinnext, wgraynext};
	// Memory write-address pointer (okay to use binary to address memory)
	assign waddr = wbin[ADDRSIZE-1:0];
	assign wbinnext = wbin + (winc & ~wfull);
	assign wgraynext = (wbinnext>>1) ^ wbinnext;
	//------------------------------------------------------------------
	// Simplified version of the three necessary full-tests:
	// assign wfull_val=((wgnext[ADDRSIZE] !=wq2_rptr[ADDRSIZE] ) &&
	// (wgnext[ADDRSIZE-1] !=wq2_rptr[ADDRSIZE-1]) &&
	// (wgnext[ADDRSIZE-2:0]==wq2_rptr[ADDRSIZE-2:0]));
	//------------------------------------------------------------------
	assign wfull_val = (wgraynext=={~wq2_rptr[ADDRSIZE:ADDRSIZE-1],
	wq2_rptr[ADDRSIZE-2:0]});
	always @(posedge wclk or negedge wrst_n)
		if (!wrst_n) wfull <= 1'b0;
		else wfull <= wfull_val;
endmodule

