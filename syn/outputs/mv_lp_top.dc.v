/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : Q-2019.12-SP3
// Date      : Sun May 14 22:02:25 2023
/////////////////////////////////////////////////////////////


module modA ( A, B, P, Q, upf_clk, B2A, C2A, D2A, A2B, A2C, A2D, Z );
  input A, B, P, Q, upf_clk, B2A, C2A, D2A;
  output A2B, A2C, A2D, Z;
  wire   N0, N1, N3, RA2, N6, RA1, N8, N9, RA3, N12, RA4, N13, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  DFFX1_HVT A2C_reg ( .D(N1), .CLK(upf_clk), .Q(A2C), .QN(n9) );
  DFFX1_HVT RA1_reg ( .D(N6), .CLK(upf_clk), .Q(RA1) );
  DFFX1_HVT RA3_reg ( .D(N9), .CLK(upf_clk), .Q(RA3) );
  DFFX1_HVT Z_reg ( .D(N13), .CLK(upf_clk), .Q(Z) );
  DFFX1_HVT A2D_reg ( .D(N3), .CLK(upf_clk), .Q(A2D) );
  DFFX1_HVT A2B_reg ( .D(N0), .CLK(upf_clk), .Q(A2B) );
  DFFX1_HVT RA4_reg ( .D(N12), .CLK(upf_clk), .Q(RA4) );
  DFFX1_HVT RA2_reg ( .D(N8), .CLK(upf_clk), .Q(RA2) );
  HADDX2_HVT U3 ( .A0(n8), .B0(P), .SO(N0) );
  XOR2X1_HVT U4 ( .A1(B), .A2(A), .Y(n8) );
  INVX0_HVT U5 ( .A(B2A), .Y(n5) );
  NBUFFX2_HVT U6 ( .A(n8), .Y(n1) );
  AND3X1_HVT U7 ( .A1(A), .A2(A2B), .A3(Q), .Y(N1) );
  INVX0_HVT U8 ( .A(n6), .Y(n7) );
  AND3X1_HVT U9 ( .A1(n3), .A2(n5), .A3(n2), .Y(N12) );
  AO21X1_HVT U10 ( .A1(C2A), .A2(D2A), .A3(A2C), .Y(n2) );
  NAND2X0_HVT U11 ( .A1(n4), .A2(C2A), .Y(n3) );
  AND2X1_HVT U12 ( .A1(D2A), .A2(A2C), .Y(n4) );
  AO21X1_HVT U13 ( .A1(RA2), .A2(n1), .A3(A2C), .Y(N6) );
  HADDX1_HVT U14 ( .A0(RA2), .B0(RA1), .SO(N9) );
  NBUFFX2_HVT U15 ( .A(B), .Y(n6) );
  AO22X1_HVT U16 ( .A1(A2C), .A2(n6), .A3(n9), .A4(n7), .Y(N3) );
  HADDX1_HVT U17 ( .A0(RA4), .B0(RA3), .SO(N13) );
  HADDX1_HVT U18 ( .A0(n1), .B0(RA1), .SO(N8) );
endmodule


module modB ( A, B, R, upf_clk, A2B, C2B, D2B, B2A, B2C, B2D, Y );
  input A, B, R, upf_clk, A2B, C2B, D2B;
  output B2A, B2C, B2D, Y;
  wire   N1, N2, RB2, N5, RB1, N7, N8, RB3, N10, RB4, N11, n2, n3, n4, n5, n6,
         n7, n8;

  DFFSSRX1_HVT B2A_reg ( .D(n7), .SETB(1'b1), .RSTB(R), .CLK(upf_clk), .Q(B2A)
         );
  DFFX1_HVT B2D_reg ( .D(N2), .CLK(upf_clk), .Q(B2D) );
  DFFX1_HVT RB3_reg ( .D(N8), .CLK(upf_clk), .Q(RB3) );
  DFFX1_HVT Y_reg ( .D(N11), .CLK(upf_clk), .Q(Y) );
  DFFX1_HVT B2C_reg ( .D(N1), .CLK(upf_clk), .Q(B2C), .QN(n8) );
  DFFX1_HVT RB2_reg ( .D(N7), .CLK(upf_clk), .Q(RB2) );
  DFFX1_HVT RB1_reg ( .D(N5), .CLK(upf_clk), .Q(RB1) );
  DFFX1_HVT RB4_reg ( .D(N10), .CLK(upf_clk), .Q(RB4) );
  OR2X2_HVT U3 ( .A1(n3), .A2(C2B), .Y(n2) );
  XOR3X2_HVT U4 ( .A1(n8), .A2(D2B), .A3(n2), .Y(N10) );
  NBUFFX2_HVT U5 ( .A(A), .Y(n7) );
  INVX0_HVT U6 ( .A(n7), .Y(n5) );
  NAND3X0_HVT U7 ( .A1(B2C), .A2(R), .A3(B2A), .Y(n4) );
  INVX0_HVT U8 ( .A(A2B), .Y(n3) );
  HADDX1_HVT U9 ( .A0(RB4), .B0(RB3), .SO(N11) );
  HADDX1_HVT U10 ( .A0(B2A), .B0(R), .SO(N1) );
  HADDX1_HVT U11 ( .A0(n5), .B0(n4), .SO(N2) );
  XOR2X1_HVT U12 ( .A1(A), .A2(B), .Y(n6) );
  AO21X1_HVT U13 ( .A1(RB2), .A2(n6), .A3(B2D), .Y(N5) );
  HADDX1_HVT U14 ( .A0(RB2), .B0(RB1), .SO(N8) );
  HADDX1_HVT U15 ( .A0(RB1), .B0(n6), .SO(N7) );
endmodule


module modC ( C, D, S, upf_clk, A2C, B2C, D2C, C2A, C2B, C2D, X );
  input C, D, S, upf_clk, A2C, B2C, D2C;
  output C2A, C2B, C2D, X;
  wire   n13, n14, n15, n16, n17, N1, N4, RC2, N7, RC1, N9, N10, RC3, N13, RC4,
         N14, n5, n7, n2, n3, n4, n6, n8, n9, n10, n11, n12;
  assign n8 = C;
  assign n9 = D;
  assign n10 = S;
  assign n11 = B2C;
  assign n12 = A2C;

  DFFSSRX1_HVT C2A_reg ( .D(n6), .SETB(1'b1), .RSTB(D2C), .CLK(upf_clk), .Q(
        C2A), .QN(n5) );
  DFFX1_HVT C2B_reg ( .D(N1), .CLK(upf_clk), .Q(C2B) );
  DFFX1_HVT C2D_reg ( .D(N4), .CLK(upf_clk), .Q(C2D), .QN(n7) );
  DFFX1_HVT RC2_reg ( .D(N9), .CLK(upf_clk), .Q(RC2) );
  DFFX1_HVT RC1_reg ( .D(N7), .CLK(upf_clk), .Q(RC1) );
  DFFX1_HVT RC3_reg ( .D(N10), .CLK(upf_clk), .Q(RC3) );
  DFFX1_HVT RC4_reg ( .D(N13), .CLK(upf_clk), .Q(RC4) );
  DFFX1_HVT X_reg ( .D(N14), .CLK(upf_clk), .Q(X) );
  LSDNSSX8_HVT B2C_UPF_LS ( .A(n11), .Y(n17) );
  LSDNSSX8_HVT D_UPF_LS ( .A(n9), .Y(n14) );
  LSDNSSX8_HVT C_UPF_LS ( .A(n8), .Y(n13) );
  LSDNSSX2_HVT S_UPF_LS ( .A(n10), .Y(n15) );
  LSDNSSX2_HVT A2C_UPF_LS ( .A(n12), .Y(n16) );
  HADDX1_HVT U3 ( .A0(n14), .B0(n13), .SO(n6) );
  HADDX1_HVT U4 ( .A0(RC2), .B0(RC1), .SO(N10) );
  HADDX1_HVT U5 ( .A0(RC3), .B0(RC4), .SO(N14) );
  NAND2X0_HVT U6 ( .A1(C2B), .A2(n5), .Y(n2) );
  HADDX1_HVT U7 ( .A0(n7), .B0(n2), .SO(N13) );
  AND2X1_HVT U8 ( .A1(n14), .A2(n13), .Y(n3) );
  HADDX1_HVT U9 ( .A0(n3), .B0(RC1), .SO(N9) );
  AO22X1_HVT U10 ( .A1(n16), .A2(n17), .A3(n15), .A4(C2A), .Y(N1) );
  INVX0_HVT U11 ( .A(n15), .Y(n4) );
  AO22X1_HVT U12 ( .A1(n5), .A2(n15), .A3(C2A), .A4(n4), .Y(N4) );
  AO21X1_HVT U13 ( .A1(n6), .A2(RC2), .A3(C2D), .Y(N7) );
endmodule


module modD ( D, E, T, upf_clk, A2D, B2D, C2D, D2A, D2B, D2C, W );
  input D, E, T, upf_clk, A2D, B2D, C2D;
  output D2A, D2B, D2C, W;
  wire   n14, n15, n16, n17, N0, N1, N4, RD2, N7, RD1, N9, N10, RD3, N13, RD4,
         N15, n6, n1, n2, n3, n4, n5, n7, n8, n9, n10, n11, n12, n13;
  assign n10 = D;
  assign n11 = E;
  assign n12 = T;
  assign n13 = B2D;

  DFFX1_HVT D2A_reg ( .D(N0), .CLK(upf_clk), .Q(D2A), .QN(n9) );
  DFFX1_HVT D2B_reg ( .D(N1), .CLK(upf_clk), .Q(D2B) );
  DFFX1_HVT D2C_reg ( .D(N4), .CLK(upf_clk), .Q(D2C), .QN(n6) );
  DFFX1_HVT RD2_reg ( .D(N9), .CLK(upf_clk), .Q(RD2) );
  DFFX1_HVT RD1_reg ( .D(N7), .CLK(upf_clk), .Q(RD1) );
  DFFX1_HVT RD3_reg ( .D(N10), .CLK(upf_clk), .Q(RD3) );
  DFFX1_HVT RD4_reg ( .D(N13), .CLK(upf_clk), .Q(RD4) );
  DFFX1_HVT W_reg ( .D(N15), .CLK(upf_clk), .Q(W) );
  LSDNSSX8_HVT D_UPF_LS ( .A(n10), .Y(n14) );
  LSDNSSX1_HVT T_UPF_LS ( .A(n12), .Y(n16) );
  LSDNSSX2_HVT E_UPF_LS ( .A(n11), .Y(n15) );
  LSDNSSX1_HVT B2D_UPF_LS ( .A(n13), .Y(n17) );
  INVX0_HVT U3 ( .A(A2D), .Y(n7) );
  INVX0_HVT U4 ( .A(n17), .Y(n5) );
  OA221X1_HVT U5 ( .A1(D2A), .A2(n2), .A3(n9), .A4(n1), .A5(D2B), .Y(N4) );
  OA221X1_HVT U6 ( .A1(A2D), .A2(n17), .A3(n7), .A4(n5), .A5(n8), .Y(N0) );
  HADDX1_HVT U7 ( .A0(RD2), .B0(RD1), .SO(N10) );
  NAND2X0_HVT U8 ( .A1(n16), .A2(n15), .Y(n1) );
  INVX0_HVT U9 ( .A(n1), .Y(n2) );
  OR2X1_HVT U10 ( .A1(n9), .A2(D2B), .Y(n3) );
  HADDX1_HVT U11 ( .A0(n6), .B0(n3), .SO(N13) );
  AND2X1_HVT U12 ( .A1(n15), .A2(n14), .Y(n4) );
  HADDX1_HVT U13 ( .A0(n4), .B0(RD1), .SO(N9) );
  HADDX1_HVT U14 ( .A0(n15), .B0(n14), .SO(n8) );
  AO21X1_HVT U15 ( .A1(n16), .A2(D2A), .A3(C2D), .Y(N1) );
  AO21X1_HVT U16 ( .A1(n8), .A2(RD2), .A3(D2C), .Y(N7) );
  FADDX1_HVT U17 ( .A(RD3), .B(RD4), .CI(D2C), .S(N15) );
endmodule


module mv_lp_top ( A, B, C, D, E, upf_clk, P, Q, R, S, T, W, X, Y, Z, 
        sleep_moda, sleep_modb, sleep_modc, sleep_modd, iso_en );
  input A, B, C, D, E, upf_clk;
  output P, Q, R, S, T, W, X, Y, Z, sleep_moda, sleep_modb, sleep_modc,
         sleep_modd, iso_en;
  wire   n38, B2A, C2A, D2A, A2B, A2C, A2D, C2B, D2B, B2C, B2D, D2C, C2D,
         net18, net19, net20, net21, net22, net23, n5, n6, n7, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n23, n24, n25, n26,
         n27, n28, n29, n30, n32, n33, n34, n35, n36, n37;

  modA modA_inst ( .A(n9), .B(n26), .P(P), .Q(Q), .upf_clk(upf_clk), .B2A(B2A), 
        .C2A(n34), .D2A(n35), .A2B(net20), .A2C(net21), .A2D(A2D), .Z(Z) );
  modB modB_inst ( .A(n28), .B(n14), .R(n32), .upf_clk(upf_clk), .A2B(A2B), 
        .C2B(n36), .D2B(n37), .B2A(B2A), .B2C(B2C), .B2D(B2D), .Y(Y) );
  modC modC_inst ( .C(n25), .D(n24), .S(S), .upf_clk(upf_clk), .A2C(A2C), 
        .B2C(B2C), .D2C(D2C), .C2A(net18), .C2B(net22), .C2D(C2D), .X(X) );
  modD modD_inst ( .D(n24), .E(E), .T(T), .upf_clk(upf_clk), .A2D(A2D), .B2D(
        B2D), .C2D(C2D), .D2A(net19), .D2B(net23), .D2C(D2C), .W(W) );
  AND2X1_HVT C32 ( .A1(n14), .A2(n6), .Y(sleep_modd) );
  AND2X1_HVT C30 ( .A1(E), .A2(n30), .Y(sleep_modc) );
  AND2X1_HVT C28 ( .A1(n25), .A2(n7), .Y(sleep_modb) );
  INVX0_HVT I_3 ( .A(sleep_moda), .Y(n38) );
  AND2X1_HVT C25 ( .A1(A), .A2(n5), .Y(sleep_moda) );
  ISOLANDX1_HVT snps_pd_moda__iso_pg_moda_c_snps_A2C_UPF_ISO ( .D(net21), 
        .ISO(n27), .Q(A2C) ); //synopsys isolation_upf iso_pg_moda_c+pd_moda
  ISOLANDX1_HVT snps_pd_moda__iso_pg_moda_b_snps_A2B_UPF_ISO ( .D(net20), 
        .ISO(n27), .Q(A2B) ); //synopsys isolation_upf iso_pg_moda_b+pd_moda
  ISOLORAOX1_HVT snps_pd_modd__iso_pg_modd_a_snps_D2A_UPF_ISO ( .D(net19), 
        .ISO(n33), .Q(D2A) ); //synopsys isolation_upf iso_pg_modd_a+pd_modd
  ISOLORAOX1_HVT snps_pd_modc__iso_pg_modc_a_snps_C2A_UPF_ISO ( .D(net18), 
        .ISO(iso_en), .Q(C2A) ); //synopsys isolation_upf iso_pg_modc_a+pd_modc
  ISOLORAOX1_HVT snps_pd_modd__iso_pg_modd_b_snps_D2B_UPF_ISO ( .D(net23), 
        .ISO(iso_en), .Q(D2B) ); //synopsys isolation_upf iso_pg_modd_b+pd_modd
  LSUPX1_HVT D2A_UPF_LS ( .A(D2A), .Y(n35) );
  LSUPX1_HVT C2A_UPF_LS ( .A(C2A), .Y(n34) );
  LSUPX1_HVT C2B_UPF_LS ( .A(C2B), .Y(n36) );
  ISOLORAOX2_HVT snps_pd_modc__iso_pg_modc_b_snps_C2B_UPF_ISO ( .D(net22), 
        .ISO(n23), .Q(C2B) ); //synopsys isolation_upf iso_pg_modc_b+pd_modc
  LSUPX1_HVT D2B_UPF_LS ( .A(D2B), .Y(n37) );
  NBUFFX2_HVT U16 ( .A(D), .Y(n24) );
  NBUFFX2_HVT U17 ( .A(n29), .Y(n9) );
  NBUFFX2_HVT U18 ( .A(n17), .Y(n21) );
  XNOR2X1_HVT U19 ( .A1(n10), .A2(n30), .Y(T) );
  AND2X1_HVT U20 ( .A1(n17), .A2(n6), .Y(n10) );
  NBUFFX2_HVT U21 ( .A(n18), .Y(P) );
  NBUFFX2_HVT U22 ( .A(n33), .Y(n23) );
  NBUFFX2_HVT U23 ( .A(n12), .Y(n17) );
  NBUFFX2_HVT U24 ( .A(n13), .Y(n19) );
  NOR2X0_HVT U25 ( .A1(n7), .A2(C), .Y(Q) );
  NBUFFX2_HVT U26 ( .A(B), .Y(n12) );
  NBUFFX2_HVT U27 ( .A(n38), .Y(n33) );
  INVX0_HVT U28 ( .A(B), .Y(n5) );
  NBUFFX2_HVT U29 ( .A(n5), .Y(n13) );
  NBUFFX2_HVT U30 ( .A(A), .Y(n11) );
  INVX0_HVT U31 ( .A(n11), .Y(n16) );
  NBUFFX2_HVT U32 ( .A(n11), .Y(n15) );
  AO22X1_HVT U33 ( .A1(n13), .A2(n16), .A3(n15), .A4(n12), .Y(n18) );
  NBUFFX2_HVT U34 ( .A(C), .Y(n25) );
  INVX0_HVT U35 ( .A(n19), .Y(n14) );
  NBUFFX2_HVT U36 ( .A(n21), .Y(n26) );
  NBUFFX2_HVT U37 ( .A(n23), .Y(n27) );
  NBUFFX2_HVT U38 ( .A(n15), .Y(n29) );
  NBUFFX2_HVT U39 ( .A(n29), .Y(n28) );
  INVX0_HVT U40 ( .A(C), .Y(n6) );
  NBUFFX2_HVT U41 ( .A(n16), .Y(n30) );
  INVX0_HVT U42 ( .A(D), .Y(n7) );
  NBUFFX2_HVT U43 ( .A(n38), .Y(iso_en) );
  INVX0_HVT U44 ( .A(n18), .Y(R) );
  NBUFFX2_HVT U45 ( .A(R), .Y(n32) );
  INVX0_HVT U46 ( .A(E), .Y(n20) );
  AO22X1_HVT U47 ( .A1(n21), .A2(n20), .A3(n19), .A4(E), .Y(S) );
endmodule

