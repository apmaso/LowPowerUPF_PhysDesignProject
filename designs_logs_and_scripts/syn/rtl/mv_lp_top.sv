/////////////////////////////////////////////////////
// ece581_lp_top RTL for UPF and Low-Power Design
// Author: Venkatesh Patil (venpatil@pdx.edu)
// Updated: Team2 of ECE-481/581-WCC Winter 2023
// ECE-4/581 and can be used ECE-530
// Top level instantiate 4 sub-modules
// Top level has some logic elements
// Each module connects to other modules
////////////////////////////////////////////////////


module mv_lp_top (A,B,C,D,E,upf_clk,P,Q,R,S,T,W,X,Y,Z,sleep_moda,sleep_modb,sleep_modc,sleep_modd,iso_en);
    input logic A,B,C,D,E;
    input logic upf_clk;
    output logic P,Q,R,S,T,W,X,Y,Z;
    output logic sleep_moda,sleep_modb,sleep_modc,sleep_modd,iso_en;



//Logic at the top level
    assign P = A ^ ~B;
    assign Q = ~C & D;
	assign R = A ^ B;
	assign S = E ^ B;
    assign T = (C & B) ^ (A ^ B);

// Control signal generation at top level
    assign sleep_moda = A & !B;
    assign iso_en = !sleep_moda;
    assign sleep_modb = C & !D;
    assign sleep_modc = E & !A;
    assign sleep_modd = B & !C;



//Instantiate 4 sub-modules at the top level
modA modA_inst (A,B,P,Q,upf_clk,B2A,C2A,D2A,A2B,A2C,A2D,Z);
modB modB_inst (A,B,R,upf_clk,A2B,C2B,D2B,B2A,B2C,B2D,Y);
modC modC_inst (C,D,S,upf_clk,A2C,B2C,D2C,C2A,C2B,C2D,X);
modD modD_inst (D,E,T,upf_clk,A2D,B2D,C2D,D2A,D2B,D2C,W );
//pmu pmu_inst (A,B,C,D,E,sleep_moda,sleep_modb,sleep_modc,sleep_modd,iso_en);
//module TEST (A,B,C, in, upf_clk, dataout);

endmodule

// Implement logic for each module of your choice
// Each module should sent out signal to othe 3 modules
// Each module should use the signals coming from other modules

//PMU enable control
/*module pmu (A,B,C,D,E,sleep_moda,sleep_modb,sleep_modc,sleep_modd,iso_en);
    input logic A,B,C,D,E;
    output wire sleep_moda,sleep_modb,sleep_modc,sleep_modd,iso_en;


assign sleep_moda = A & !B;
assign iso_en = !sleep_moda;
assign sleep_modb = C & !D;
assign sleep_modc = E & !A;
assign sleep_modd = B & !C;

endmodule
*/


module modA (A,B,P,Q,upf_clk,B2A,C2A,D2A,A2B,A2C,A2D,Z);
    input logic A,B,P,Q; 
    input logic upf_clk;
    input wire B2A,C2A,D2A;
    output logic A2B,A2C,A2D;
    output logic Z;
	// Internal registers
	reg RA1 = 0,RA2 = 0,RA3 = 0,RA4 = 0;
   
    always @(posedge upf_clk) begin
    //sending signals to other modules
        A2B <= A ^ B ^ P ;
        A2C <= A & A2B & Q ;
        A2D <= ~A2C + B; 
		RA1 <= RA2 * (A + B) | A2C;
		RA2 <= (A ^ B) + RA1;
		RA3 <= RA2 + RA1;
		
     // sending signal to out of block
        RA4 <= ~B2A & (C2A * D2A) + A2C;
		Z <= RA3 ^ RA4;
    
    end  
endmodule


module modB (A,B,R,upf_clk,A2B,C2B,D2B,B2A,B2C,B2D,Y);
    input logic A,B,R, upf_clk;
    input wire A2B,C2B,D2B;
    output logic B2A,B2C,B2D;
    output logic Y;
	// Internal registers
	reg RB1 = 0,RB2 = 0,RB3 = 0,RB4 = 0; 

      always @(posedge upf_clk) begin
    //sending signals to other modules
        B2A <= A * R;
        B2C <= R ^ B2A;
        B2D <= A ^ R & B2A & B2C;
		RB1 <= RB2 * (A ^ B) | B2D;
		RB2 <= (A + B) ^ RB1;
		RB3 <= RB2 ^ RB1;
    // sending signal to out of block
        RB4 <= (A2B && ~C2B) ^ (D2B + B2C);
		Y <= RB3 + RB4 ;
    end         

endmodule


module modC (C,D,S,upf_clk,A2C,B2C,D2C,C2A,C2B,C2D,X);
    input logic C,D,S,upf_clk;
    input wire A2C,B2C,D2C;
    output logic C2A,C2B,C2D;
    output logic X;
	// Internal registers
	reg RC1 = 0,RC2 = 0,RC3 = 0,RC4 = 0;
    
    always @(posedge upf_clk) begin
    //sending signals to other modules
        C2A <= (C ^ D) & D2C;
        C2B <= (C2A & S) | (A2C & B2C);
        C2D <= C2A ^ C2B + C2B + S;
		RC1 <= RC2 * (C ^ D) | C2D;
		RC2 <= (C * D) + RC1;
		RC3 <= RC2 + RC1;
		
    // sending signal to out of block
        RC4 <= (C2A & C2B) + (C2B ^ C2D);
		X <= RC4 + RC3;
    end         
 endmodule


module modD (D,E,T,upf_clk,A2D,B2D,C2D,D2A,D2B,D2C,W);
    input logic D,E,T,upf_clk;
    input wire A2D,B2D,C2D;
    output logic D2A,D2B,D2C;
    output logic W;
	// Internal registers
	reg RD1 = 0,RD2 = 0,RD3 = 0,RD4 = 0;
    
    always @(posedge upf_clk) begin
    //sending signals to other modules
        D2A <= (E ^ D) & (A2D ^ B2D);
        D2B <= (D2A & T) | C2D;
        D2C <= (D2A & D2B) + (E & T & D2B);
		RD1 <= RD2 * (E ^ D) | D2C;
		RD2 <= (E * D) + RD1;
		RD3 <= RD2 + RD1;
    // sending signal to out of block
        RD4 <= (D2A & D2B) + (D2A ^ D2C);
		W <= RD3 + RD4 ^ D2C;
    end         
endmodule
