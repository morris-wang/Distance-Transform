/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Mon Dec  6 16:43:47 2021
/////////////////////////////////////////////////////////////


module DT_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module DT_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVXL U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module DT_DW01_inc_2 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX2 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX4 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CMPR22X2 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  INVXL U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_dec_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  CLKINVX1 U1 ( .A(n16), .Y(n1) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U3 ( .A(A[11]), .Y(n3) );
  CLKINVX1 U4 ( .A(A[10]), .Y(n4) );
  AO21X1 U5 ( .A0(n5), .A1(A[9]), .B0(n6), .Y(SUM[9]) );
  OAI2BB1X1 U6 ( .A0N(n7), .A1N(A[8]), .B0(n5), .Y(SUM[8]) );
  OAI2BB1X1 U7 ( .A0N(n8), .A1N(A[7]), .B0(n7), .Y(SUM[7]) );
  OAI2BB1X1 U8 ( .A0N(n9), .A1N(A[6]), .B0(n8), .Y(SUM[6]) );
  OAI2BB1X1 U9 ( .A0N(n10), .A1N(A[5]), .B0(n9), .Y(SUM[5]) );
  OAI2BB1X1 U10 ( .A0N(n11), .A1N(A[4]), .B0(n10), .Y(SUM[4]) );
  OAI2BB1X1 U11 ( .A0N(n12), .A1N(A[3]), .B0(n11), .Y(SUM[3]) );
  OAI2BB1X1 U12 ( .A0N(n13), .A1N(A[2]), .B0(n12), .Y(SUM[2]) );
  OAI2BB1X1 U13 ( .A0N(A[0]), .A1N(A[1]), .B0(n13), .Y(SUM[1]) );
  XOR2X1 U14 ( .A(A[13]), .B(n14), .Y(SUM[13]) );
  NOR2X1 U15 ( .A(A[12]), .B(n15), .Y(n14) );
  XNOR2X1 U16 ( .A(A[12]), .B(n15), .Y(SUM[12]) );
  OAI21XL U17 ( .A0(n1), .A1(n3), .B0(n15), .Y(SUM[11]) );
  NAND2X1 U18 ( .A(n1), .B(n3), .Y(n15) );
  OAI21XL U19 ( .A0(n6), .A1(n4), .B0(n16), .Y(SUM[10]) );
  NAND2X1 U20 ( .A(n6), .B(n4), .Y(n16) );
  NOR2X1 U21 ( .A(n5), .B(A[9]), .Y(n6) );
  OR2X1 U22 ( .A(n7), .B(A[8]), .Y(n5) );
  OR2X1 U23 ( .A(n8), .B(A[7]), .Y(n7) );
  OR2X1 U24 ( .A(n9), .B(A[6]), .Y(n8) );
  OR2X1 U25 ( .A(n10), .B(A[5]), .Y(n9) );
  OR2X1 U26 ( .A(n11), .B(A[4]), .Y(n10) );
  OR2X1 U27 ( .A(n12), .B(A[3]), .Y(n11) );
  OR2X1 U28 ( .A(n13), .B(A[2]), .Y(n12) );
  NAND2BX1 U29 ( .AN(A[1]), .B(SUM[0]), .Y(n13) );
endmodule


module DT_DW01_inc_3 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module DT_DW01_inc_4 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, N157, N158, N159, N160, N161, N162, N163, N164, N165, N166,
         N171, N188, N206, N207, N208, N209, N210, N211, N212, N213, N214,
         N215, N216, N217, N218, N219, N221, N222, N223, N224, N225, N226,
         N227, N228, N229, N230, N231, N232, N233, N262, N264, N265, N266,
         N267, N268, N269, N270, N271, N272, N273, N274, N275, N304, N305,
         N306, N307, N308, N309, N310, N311, N312, N313, N314, N315, N316,
         N317, N421, N423, N429, N431, N432, N433, N434, N435, N436, N437,
         N438, N439, N440, N469, N470, N471, N472, N473, N474, N475, N476,
         N478, N479, N480, N481, N482, N483, N484, N485, N553, n33, n34, n35,
         n37, n38, n39, n42, n44, n47, n48, n49, n50, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n67, n78, n79, n81, n82, n83, n84, n87,
         n88, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n113, n114, n115,
         n118, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n157, n158, n159, n160, n161, n162, n163,
         n164, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, \r454/carry[2] , \r454/carry[3] ,
         \r454/carry[4] , \r454/carry[5] , \r454/carry[6] , \r454/carry[7] ,
         \r454/carry[8] , \r454/carry[9] , \r454/carry[10] , \r454/carry[11] ,
         \r454/carry[12] , \r454/carry[13] , n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n293, n294, n295,
         n296, n297, n298, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423;
  wire   [3:0] state_cs;
  wire   [3:0] state_ns;
  wire   [13:1] \r455/carry ;

  DFFRX4 \res_addr_reg[13]  ( .D(n213), .CK(clk), .RN(n301), .Q(res_addr[13]), 
        .QN(n252) );
  DFFRX4 \res_do_reg[6]  ( .D(n197), .CK(clk), .RN(n300), .Q(res_do[6]), .QN(
        n186) );
  DT_DW01_inc_0 add_156 ( .A(res_do), .SUM({N476, N475, N474, N473, N472, N471, 
        N470, N469}) );
  DT_DW01_inc_1 r461 ( .A(res_di), .SUM({N485, N484, N483, N482, N481, N480, 
        N479, N478}) );
  DT_DW01_inc_2 r458 ( .A({1'b0, res_di}), .SUM({N439, N438, N437, N436, N435, 
        N434, N433, N432, N431}) );
  DT_DW01_dec_0 r456 ( .A(res_addr), .SUM({N317, N316, N315, N314, N313, N312, 
        N311, N310, N309, N308, N307, N306, N305, N304}) );
  DT_DW01_inc_3 r453 ( .A(res_addr), .SUM({N219, N218, N217, N216, N215, N214, 
        N213, N212, N211, N210, N209, N208, N207, N206}) );
  DT_DW01_inc_4 r452 ( .A(sti_addr), .SUM({N166, N165, N164, N163, N162, N161, 
        N160, N159, N158, N157}) );
  DFFRX2 res_wr_reg ( .D(n215), .CK(clk), .RN(n300), .Q(res_wr), .QN(n181) );
  DFFRX2 done_reg ( .D(n191), .CK(clk), .RN(n300), .Q(done), .QN(n170) );
  DFFRX2 \sti_addr_reg[9]  ( .D(n216), .CK(clk), .RN(n301), .Q(sti_addr[9]), 
        .QN(n180) );
  DFFSX2 sti_rd_reg ( .D(n201), .CK(clk), .SN(reset), .Q(sti_rd), .QN(n182) );
  DFFRX2 res_rd_reg ( .D(n192), .CK(clk), .RN(n300), .Q(res_rd) );
  DFFRX2 \sti_addr_reg[6]  ( .D(n219), .CK(clk), .RN(n301), .Q(sti_addr[6]), 
        .QN(n177) );
  DFFRX2 \sti_addr_reg[7]  ( .D(n218), .CK(clk), .RN(n301), .Q(sti_addr[7]), 
        .QN(n178) );
  DFFRX2 \sti_addr_reg[8]  ( .D(n217), .CK(clk), .RN(n301), .Q(sti_addr[8]), 
        .QN(n179) );
  DFFRX1 \state_cs_reg[2]  ( .D(state_ns[2]), .CK(clk), .RN(reset), .Q(
        state_cs[2]), .QN(n245) );
  DFFRX1 \state_cs_reg[3]  ( .D(state_ns[3]), .CK(clk), .RN(reset), .Q(
        state_cs[3]) );
  DFFRX1 \res_addr_reg[12]  ( .D(n212), .CK(clk), .RN(reset), .Q(n424), .QN(
        n235) );
  DFFRX1 \res_addr_reg[11]  ( .D(n211), .CK(clk), .RN(reset), .Q(n425), .QN(
        n242) );
  DFFRX1 \res_addr_reg[10]  ( .D(n202), .CK(clk), .RN(n300), .Q(n426), .QN(
        n251) );
  DFFRX1 \cnt_reg[3]  ( .D(n226), .CK(clk), .RN(n301), .QN(n231) );
  DFFRX2 \sti_addr_reg[1]  ( .D(n225), .CK(clk), .RN(n301), .Q(sti_addr[1]), 
        .QN(n171) );
  DFFRX2 \sti_addr_reg[2]  ( .D(n223), .CK(clk), .RN(n301), .Q(sti_addr[2]), 
        .QN(n173) );
  DFFRX2 \sti_addr_reg[3]  ( .D(n222), .CK(clk), .RN(n301), .Q(sti_addr[3]), 
        .QN(n174) );
  DFFRX2 \sti_addr_reg[4]  ( .D(n221), .CK(clk), .RN(n301), .Q(sti_addr[4]), 
        .QN(n175) );
  DFFRX2 \sti_addr_reg[5]  ( .D(n220), .CK(clk), .RN(n301), .Q(sti_addr[5]), 
        .QN(n176) );
  DFFRX2 \sti_addr_reg[0]  ( .D(n224), .CK(clk), .RN(n301), .Q(sti_addr[0]), 
        .QN(n172) );
  DFFRX1 \res_addr_reg[8]  ( .D(n204), .CK(clk), .RN(reset), .Q(n428), .QN(
        n238) );
  DFFRX1 \res_addr_reg[9]  ( .D(n203), .CK(clk), .RN(n300), .Q(n427), .QN(n249) );
  DFFRX1 \cnt_reg[2]  ( .D(n227), .CK(clk), .RN(n301), .Q(n271), .QN(n232) );
  DFFRX2 \res_do_reg[7]  ( .D(n199), .CK(clk), .RN(n300), .Q(res_do[7]), .QN(
        n184) );
  DFFRX1 \res_addr_reg[6]  ( .D(n206), .CK(clk), .RN(reset), .Q(n430), .QN(
        n240) );
  DFFRX1 \res_addr_reg[7]  ( .D(n205), .CK(clk), .RN(reset), .Q(n429), .QN(
        n236) );
  DFFRX1 \cnt_reg[1]  ( .D(n228), .CK(clk), .RN(reset), .Q(n246), .QN(n233) );
  DFFRX1 \cnt_reg[0]  ( .D(n229), .CK(clk), .RN(reset), .Q(n272), .QN(n234) );
  DFFRX1 \res_addr_reg[3]  ( .D(n209), .CK(clk), .RN(reset), .Q(n433), .QN(
        n241) );
  DFFRX1 \res_addr_reg[4]  ( .D(n208), .CK(clk), .RN(reset), .Q(n432), .QN(
        n239) );
  DFFRX1 \res_addr_reg[5]  ( .D(n207), .CK(clk), .RN(reset), .Q(n431), .QN(
        n250) );
  DFFRX1 \res_addr_reg[0]  ( .D(n230), .CK(clk), .RN(reset), .Q(N262), .QN(
        n247) );
  DFFRX1 \res_addr_reg[1]  ( .D(n214), .CK(clk), .RN(reset), .Q(n435), .QN(
        n253) );
  DFFRX1 \res_addr_reg[2]  ( .D(n210), .CK(clk), .RN(reset), .Q(n434), .QN(
        n237) );
  DFFRX1 \state_cs_reg[0]  ( .D(state_ns[0]), .CK(clk), .RN(reset), .Q(
        state_cs[0]), .QN(n244) );
  DFFRX1 \state_cs_reg[1]  ( .D(state_ns[1]), .CK(clk), .RN(reset), .Q(
        state_cs[1]) );
  DFFRX2 \res_do_reg[2]  ( .D(n193), .CK(clk), .RN(n300), .Q(res_do[2]), .QN(
        n190) );
  DFFRX2 \res_do_reg[1]  ( .D(n198), .CK(clk), .RN(n300), .Q(res_do[1]), .QN(
        n185) );
  DFFRX2 \res_do_reg[0]  ( .D(n200), .CK(clk), .RN(n300), .Q(res_do[0]), .QN(
        n183) );
  DFFRX2 \res_do_reg[4]  ( .D(n195), .CK(clk), .RN(n300), .Q(res_do[4]), .QN(
        n188) );
  DFFRX2 \res_do_reg[3]  ( .D(n194), .CK(clk), .RN(n300), .Q(res_do[3]), .QN(
        n189) );
  DFFRX2 \res_do_reg[5]  ( .D(n196), .CK(clk), .RN(n300), .Q(res_do[5]), .QN(
        n187) );
  INVX1 U190 ( .A(n405), .Y(n410) );
  OAI221X1 U191 ( .A0(res_di[4]), .A1(n188), .B0(res_di[5]), .B1(n187), .C0(
        n380), .Y(n381) );
  NOR2X1 U192 ( .A(n183), .B(res_di[0]), .Y(n256) );
  CLKINVX1 U193 ( .A(res_di[5]), .Y(n389) );
  OAI221XL U194 ( .A0(res_do[3]), .A1(n387), .B0(res_do[4]), .B1(n388), .C0(
        n379), .Y(n380) );
  INVX8 U195 ( .A(n248), .Y(n254) );
  AND3X2 U196 ( .A(n109), .B(n111), .C(n108), .Y(n243) );
  AND2X2 U197 ( .A(n243), .B(n107), .Y(n248) );
  NAND2X1 U198 ( .A(n255), .B(n410), .Y(N440) );
  NAND3X2 U199 ( .A(N440), .B(n297), .C(n115), .Y(n107) );
  OR3X2 U200 ( .A(n184), .B(N439), .C(N438), .Y(n255) );
  OA22X2 U201 ( .A0(n423), .A1(n244), .B0(n418), .B1(N423), .Y(n114) );
  NAND3X1 U202 ( .A(n260), .B(n261), .C(n262), .Y(n378) );
  OR2X1 U203 ( .A(res_do[1]), .B(n376), .Y(n261) );
  OAI221X1 U204 ( .A0(res_di[2]), .A1(n190), .B0(res_di[3]), .B1(n189), .C0(
        n378), .Y(n379) );
  INVX3 U205 ( .A(n107), .Y(n413) );
  NOR2XL U206 ( .A(n183), .B(res_di[0]), .Y(n377) );
  NOR2BXL U207 ( .AN(n256), .B(res_di[1]), .Y(n376) );
  CLKINVX1 U208 ( .A(N435), .Y(n408) );
  NAND2X1 U209 ( .A(res_do[4]), .B(n408), .Y(n399) );
  NAND2XL U210 ( .A(res_di[1]), .B(n412), .Y(n257) );
  NAND2X1 U211 ( .A(N432), .B(n411), .Y(n258) );
  NAND2XL U212 ( .A(N479), .B(n413), .Y(n259) );
  AND3X2 U213 ( .A(n257), .B(n258), .C(n259), .Y(n102) );
  OR2X1 U214 ( .A(n377), .B(n385), .Y(n260) );
  OR2X1 U215 ( .A(res_do[2]), .B(n386), .Y(n262) );
  NAND4X2 U216 ( .A(n82), .B(n245), .C(n113), .D(n114), .Y(n109) );
  OAI21XL U217 ( .A0(res_do[6]), .A1(n409), .B0(n398), .Y(n402) );
  OA21X2 U218 ( .A0(n403), .A1(n402), .B0(n401), .Y(n404) );
  CLKINVX1 U219 ( .A(res_di[7]), .Y(n263) );
  INVX1 U220 ( .A(n396), .Y(n407) );
  NOR2X1 U221 ( .A(n155), .B(n298), .Y(n49) );
  NOR2X1 U222 ( .A(n81), .B(n297), .Y(n110) );
  NAND2X1 U223 ( .A(n244), .B(n418), .Y(n155) );
  OAI21XL U224 ( .A0(n416), .A1(n42), .B0(n81), .Y(n38) );
  NAND2X1 U225 ( .A(N423), .B(n110), .Y(n108) );
  INVXL U226 ( .A(res_di[4]), .Y(n388) );
  INVXL U227 ( .A(res_di[3]), .Y(n387) );
  INVXL U228 ( .A(res_di[1]), .Y(n385) );
  INVXL U229 ( .A(res_di[2]), .Y(n386) );
  OAI2BB1X4 U230 ( .A0N(n263), .A1N(res_do[7]), .B0(n384), .Y(N423) );
  INVX1 U231 ( .A(N432), .Y(n406) );
  CLKBUFX3 U232 ( .A(n129), .Y(n273) );
  NOR4XL U233 ( .A(res_di[7]), .B(res_di[6]), .C(res_di[5]), .D(res_di[4]), 
        .Y(n169) );
  NOR4XL U234 ( .A(res_di[3]), .B(res_di[2]), .C(res_di[1]), .D(res_di[0]), 
        .Y(n168) );
  CLKBUFX3 U235 ( .A(N262), .Y(res_addr[0]) );
  CLKBUFX3 U236 ( .A(n435), .Y(res_addr[1]) );
  CLKBUFX3 U237 ( .A(n434), .Y(res_addr[2]) );
  CLKBUFX3 U238 ( .A(n433), .Y(res_addr[3]) );
  CLKBUFX3 U239 ( .A(n432), .Y(res_addr[4]) );
  CLKBUFX3 U240 ( .A(n234), .Y(n296) );
  CLKBUFX3 U241 ( .A(n431), .Y(res_addr[5]) );
  CLKBUFX3 U242 ( .A(n430), .Y(res_addr[6]) );
  CLKBUFX3 U243 ( .A(n429), .Y(res_addr[7]) );
  CLKBUFX3 U244 ( .A(n428), .Y(res_addr[8]) );
  CLKBUFX3 U245 ( .A(n232), .Y(n294) );
  CLKBUFX3 U246 ( .A(state_cs[3]), .Y(n297) );
  CLKBUFX3 U247 ( .A(n424), .Y(res_addr[12]) );
  CLKBUFX3 U248 ( .A(n427), .Y(res_addr[9]) );
  CLKBUFX3 U249 ( .A(n425), .Y(res_addr[11]) );
  CLKBUFX3 U250 ( .A(n426), .Y(res_addr[10]) );
  OR2X1 U251 ( .A(res_do[6]), .B(n400), .Y(n264) );
  OR2XL U252 ( .A(n409), .B(n400), .Y(n265) );
  OR2XL U253 ( .A(res_do[6]), .B(n409), .Y(n266) );
  NAND3X1 U254 ( .A(n264), .B(n265), .C(n266), .Y(n401) );
  OR2X1 U255 ( .A(N436), .B(n187), .Y(n267) );
  OR2X1 U256 ( .A(N436), .B(n399), .Y(n268) );
  OR2X1 U257 ( .A(n187), .B(n399), .Y(n269) );
  NAND3X1 U258 ( .A(n267), .B(n268), .C(n269), .Y(n400) );
  AOI2BB2XL U259 ( .B0(N429), .B1(n110), .A0N(N421), .A1N(n52), .Y(n111) );
  OAI211X2 U260 ( .A0(n254), .A1(n184), .B0(n103), .C0(n104), .Y(n199) );
  AND3X8 U261 ( .A(n254), .B(n108), .C(n110), .Y(n92) );
  OAI211X2 U262 ( .A0(n254), .A1(n190), .B0(n87), .C0(n88), .Y(n193) );
  OAI211X2 U263 ( .A0(n254), .A1(n188), .B0(n95), .C0(n96), .Y(n195) );
  OAI211X2 U264 ( .A0(n254), .A1(n186), .B0(n99), .C0(n100), .Y(n197) );
  OAI211X2 U265 ( .A0(n254), .A1(n183), .B0(n105), .C0(n106), .Y(n200) );
  OAI211X2 U266 ( .A0(n254), .A1(n189), .B0(n93), .C0(n94), .Y(n194) );
  OAI211X2 U267 ( .A0(n254), .A1(n187), .B0(n97), .C0(n98), .Y(n196) );
  OAI211X2 U268 ( .A0(n254), .A1(n185), .B0(n101), .C0(n102), .Y(n198) );
  CLKINVX1 U269 ( .A(n52), .Y(n417) );
  INVX3 U270 ( .A(n109), .Y(n412) );
  INVX3 U271 ( .A(n108), .Y(n411) );
  OAI21XL U272 ( .A0(n415), .A1(n44), .B0(n39), .Y(state_ns[1]) );
  XOR2X1 U273 ( .A(n361), .B(n159), .Y(n228) );
  NAND2X1 U274 ( .A(n49), .B(n423), .Y(n52) );
  CLKINVX1 U275 ( .A(n155), .Y(n416) );
  NAND2X1 U276 ( .A(n159), .B(n361), .Y(n158) );
  NAND2X1 U277 ( .A(n416), .B(n423), .Y(n113) );
  CLKBUFX3 U278 ( .A(n127), .Y(n274) );
  OAI21XL U279 ( .A0(n423), .A1(n122), .B0(n421), .Y(n127) );
  CLKINVX1 U280 ( .A(n78), .Y(n421) );
  CLKINVX1 U281 ( .A(n38), .Y(n415) );
  NAND4X1 U282 ( .A(n237), .B(n241), .C(n239), .D(n250), .Y(n57) );
  CLKINVX1 U283 ( .A(N423), .Y(N429) );
  CLKINVX1 U284 ( .A(N437), .Y(n409) );
  OAI211X1 U285 ( .A0(n251), .A1(n277), .B0(n124), .C0(n125), .Y(n202) );
  AOI22X1 U286 ( .A0(N272), .A1(n276), .B0(N216), .B1(n273), .Y(n124) );
  AOI221XL U287 ( .A0(N230), .A1(n275), .B0(N314), .B1(n274), .C0(n420), .Y(
        n125) );
  OAI211X1 U288 ( .A0(n249), .A1(n277), .B0(n130), .C0(n131), .Y(n203) );
  AOI22X1 U289 ( .A0(N271), .A1(n128), .B0(N215), .B1(n273), .Y(n130) );
  AOI221XL U290 ( .A0(N229), .A1(n275), .B0(N313), .B1(n274), .C0(n420), .Y(
        n131) );
  OAI211X1 U291 ( .A0(n238), .A1(n277), .B0(n132), .C0(n133), .Y(n204) );
  AOI22X1 U292 ( .A0(N270), .A1(n128), .B0(N214), .B1(n273), .Y(n132) );
  AOI221XL U293 ( .A0(N228), .A1(n275), .B0(N312), .B1(n274), .C0(n420), .Y(
        n133) );
  OAI211X1 U294 ( .A0(n236), .A1(n277), .B0(n134), .C0(n135), .Y(n205) );
  AOI22X1 U295 ( .A0(N269), .A1(n128), .B0(N213), .B1(n273), .Y(n134) );
  AOI221XL U296 ( .A0(N227), .A1(n275), .B0(N311), .B1(n274), .C0(n420), .Y(
        n135) );
  OAI211X1 U297 ( .A0(n240), .A1(n277), .B0(n136), .C0(n137), .Y(n206) );
  AOI22X1 U298 ( .A0(N268), .A1(n128), .B0(N212), .B1(n273), .Y(n136) );
  AOI221XL U299 ( .A0(N226), .A1(n275), .B0(N310), .B1(n274), .C0(n420), .Y(
        n137) );
  OAI211X1 U300 ( .A0(n250), .A1(n277), .B0(n138), .C0(n139), .Y(n207) );
  AOI22X1 U301 ( .A0(N267), .A1(n128), .B0(N211), .B1(n273), .Y(n138) );
  AOI221XL U302 ( .A0(N225), .A1(n275), .B0(N309), .B1(n274), .C0(n420), .Y(
        n139) );
  OAI211X1 U303 ( .A0(n239), .A1(n277), .B0(n140), .C0(n141), .Y(n208) );
  AOI22X1 U304 ( .A0(N266), .A1(n276), .B0(N210), .B1(n273), .Y(n140) );
  AOI221XL U305 ( .A0(N224), .A1(n275), .B0(N308), .B1(n274), .C0(n420), .Y(
        n141) );
  OAI211X1 U306 ( .A0(n241), .A1(n277), .B0(n142), .C0(n143), .Y(n209) );
  AOI22X1 U307 ( .A0(N265), .A1(n276), .B0(N209), .B1(n273), .Y(n142) );
  AOI221XL U308 ( .A0(N223), .A1(n275), .B0(N307), .B1(n274), .C0(n420), .Y(
        n143) );
  OAI211X1 U309 ( .A0(n237), .A1(n277), .B0(n144), .C0(n145), .Y(n210) );
  AOI22X1 U310 ( .A0(N264), .A1(n276), .B0(N208), .B1(n273), .Y(n144) );
  AOI221XL U311 ( .A0(N222), .A1(n275), .B0(N306), .B1(n274), .C0(n420), .Y(
        n145) );
  OAI211X1 U312 ( .A0(n242), .A1(n277), .B0(n146), .C0(n147), .Y(n211) );
  AOI22X1 U313 ( .A0(N273), .A1(n276), .B0(N217), .B1(n273), .Y(n146) );
  AOI221XL U314 ( .A0(N231), .A1(n275), .B0(N315), .B1(n274), .C0(n420), .Y(
        n147) );
  OAI211X1 U315 ( .A0(n235), .A1(n277), .B0(n148), .C0(n149), .Y(n212) );
  AOI22X1 U316 ( .A0(N274), .A1(n276), .B0(N218), .B1(n273), .Y(n148) );
  AOI221XL U317 ( .A0(N232), .A1(n275), .B0(N316), .B1(n274), .C0(n420), .Y(
        n149) );
  OAI211X1 U318 ( .A0(n253), .A1(n277), .B0(n152), .C0(n153), .Y(n214) );
  AOI22X1 U319 ( .A0(n253), .A1(n276), .B0(N207), .B1(n273), .Y(n152) );
  AOI221XL U320 ( .A0(N221), .A1(n275), .B0(N305), .B1(n274), .C0(n420), .Y(
        n153) );
  OAI211X1 U321 ( .A0(n247), .A1(n277), .B0(n161), .C0(n162), .Y(n230) );
  AOI22X1 U322 ( .A0(res_addr[0]), .A1(n276), .B0(N206), .B1(n273), .Y(n161)
         );
  AOI221XL U323 ( .A0(n247), .A1(n275), .B0(N304), .B1(n274), .C0(n420), .Y(
        n162) );
  CLKBUFX3 U324 ( .A(n126), .Y(n275) );
  AOI211X1 U325 ( .A0(n245), .A1(n297), .B0(n164), .C0(n155), .Y(n126) );
  AOI21X1 U326 ( .A0(N188), .A1(n245), .B0(n297), .Y(n164) );
  CLKBUFX3 U327 ( .A(n123), .Y(n277) );
  OR4X1 U328 ( .A(n273), .B(n274), .C(n275), .D(n276), .Y(n123) );
  AOI211X1 U329 ( .A0(n270), .A1(n417), .B0(n47), .C0(n48), .Y(n39) );
  NOR3BXL U330 ( .AN(n49), .B(n50), .C(n423), .Y(n47) );
  AOI2BB2X1 U331 ( .B0(n293), .B1(n314), .A0N(n315), .A1N(n293), .Y(n270) );
  OAI2BB1X1 U332 ( .A0N(n37), .A1N(n38), .B0(n39), .Y(state_ns[2]) );
  OAI31XL U333 ( .A0(n418), .A1(n298), .A2(n244), .B0(n419), .Y(n37) );
  CLKINVX1 U334 ( .A(n42), .Y(n419) );
  CLKINVX1 U335 ( .A(n154), .Y(n414) );
  OAI31XL U336 ( .A0(n50), .A1(n423), .A2(n155), .B0(n81), .Y(n154) );
  NAND3X1 U337 ( .A(n297), .B(n50), .C(n49), .Y(n53) );
  CLKINVX1 U338 ( .A(n295), .Y(n345) );
  CLKINVX1 U339 ( .A(n296), .Y(n346) );
  CLKINVX1 U340 ( .A(n295), .Y(n361) );
  CLKINVX1 U341 ( .A(n294), .Y(n344) );
  OAI33X1 U342 ( .A0(n55), .A1(n56), .A2(n57), .B0(n58), .B1(n59), .B2(n60), 
        .Y(n48) );
  NAND4X1 U343 ( .A(res_addr[5]), .B(res_addr[4]), .C(res_addr[3]), .D(
        res_addr[2]), .Y(n59) );
  NAND4X1 U344 ( .A(res_addr[9]), .B(res_addr[8]), .C(res_addr[7]), .D(
        res_addr[6]), .Y(n60) );
  NAND4X1 U345 ( .A(n240), .B(n236), .C(n238), .D(n249), .Y(n56) );
  OAI21X1 U346 ( .A0(n244), .A1(n418), .B0(n155), .Y(n44) );
  NAND2X1 U347 ( .A(n298), .B(n244), .Y(n67) );
  NOR2BX1 U348 ( .AN(n160), .B(n296), .Y(n159) );
  NAND2X1 U349 ( .A(n416), .B(n298), .Y(n81) );
  XNOR2X1 U350 ( .A(n293), .B(n157), .Y(n226) );
  NOR2X1 U351 ( .A(n82), .B(n67), .Y(n78) );
  NOR2X1 U352 ( .A(n158), .B(n294), .Y(n157) );
  NOR3X1 U353 ( .A(n245), .B(n297), .C(n44), .Y(n160) );
  NAND2X1 U354 ( .A(n422), .B(n418), .Y(n122) );
  CLKINVX1 U355 ( .A(n35), .Y(n422) );
  NAND4X1 U356 ( .A(res_addr[10]), .B(res_addr[0]), .C(n61), .D(n62), .Y(n58)
         );
  NOR3X1 U357 ( .A(n67), .B(n297), .C(n418), .Y(n61) );
  NOR4X1 U358 ( .A(n242), .B(n235), .C(n252), .D(n253), .Y(n62) );
  CLKBUFX3 U359 ( .A(n128), .Y(n276) );
  INVX3 U360 ( .A(n297), .Y(n423) );
  INVX3 U361 ( .A(n279), .Y(n280) );
  CLKINVX1 U362 ( .A(n278), .Y(n279) );
  NOR2BX1 U363 ( .AN(n157), .B(n293), .Y(n278) );
  INVX3 U364 ( .A(n34), .Y(n420) );
  NAND2X1 U365 ( .A(n33), .B(n34), .Y(state_ns[3]) );
  OAI21XL U366 ( .A0(n35), .A1(n418), .B0(n297), .Y(n33) );
  AOI222XL U367 ( .A0(res_di[2]), .A1(n412), .B0(N433), .B1(n411), .C0(N480), 
        .C1(n413), .Y(n88) );
  NAND2X1 U368 ( .A(N471), .B(n92), .Y(n87) );
  AOI222XL U369 ( .A0(res_di[3]), .A1(n412), .B0(N434), .B1(n411), .C0(N481), 
        .C1(n413), .Y(n94) );
  NAND2X1 U370 ( .A(N472), .B(n92), .Y(n93) );
  AOI222XL U371 ( .A0(res_di[4]), .A1(n412), .B0(N435), .B1(n411), .C0(N482), 
        .C1(n413), .Y(n96) );
  NAND2X1 U372 ( .A(N473), .B(n92), .Y(n95) );
  AOI222XL U373 ( .A0(res_di[5]), .A1(n412), .B0(N436), .B1(n411), .C0(N483), 
        .C1(n413), .Y(n98) );
  NAND2X1 U374 ( .A(N474), .B(n92), .Y(n97) );
  AOI222XL U375 ( .A0(res_di[6]), .A1(n412), .B0(N437), .B1(n411), .C0(N484), 
        .C1(n413), .Y(n100) );
  NAND2X1 U376 ( .A(N475), .B(n92), .Y(n99) );
  NAND2X1 U377 ( .A(N470), .B(n92), .Y(n101) );
  AOI222XL U378 ( .A0(res_di[7]), .A1(n412), .B0(N438), .B1(n411), .C0(N485), 
        .C1(n413), .Y(n104) );
  NAND2X1 U379 ( .A(N476), .B(n92), .Y(n103) );
  AOI222XL U380 ( .A0(res_di[0]), .A1(n412), .B0(N431), .B1(n411), .C0(N478), 
        .C1(n413), .Y(n106) );
  NAND2X1 U381 ( .A(N469), .B(n92), .Y(n105) );
  AOI211X1 U382 ( .A0(state_cs[1]), .A1(n298), .B0(n422), .C0(n49), .Y(n115)
         );
  OAI211X1 U383 ( .A0(n252), .A1(n277), .B0(n150), .C0(n151), .Y(n213) );
  AOI22X1 U384 ( .A0(N275), .A1(n276), .B0(N219), .B1(n273), .Y(n150) );
  AOI221XL U385 ( .A0(N233), .A1(n275), .B0(N317), .B1(n274), .C0(n420), .Y(
        n151) );
  CLKINVX1 U386 ( .A(res_di[6]), .Y(n390) );
  OAI221XL U387 ( .A0(N171), .A1(n113), .B0(n42), .B1(n181), .C0(n414), .Y(
        n215) );
  OAI211X1 U388 ( .A0(n52), .A1(n270), .B0(n53), .C0(n54), .Y(state_ns[0]) );
  AOI2BB1X1 U389 ( .A0N(state_cs[0]), .A1N(n415), .B0(n48), .Y(n54) );
  OAI211X1 U390 ( .A0(n44), .A1(n83), .B0(n34), .C0(n84), .Y(n192) );
  NAND2X1 U391 ( .A(n297), .B(n298), .Y(n83) );
  AOI22X1 U392 ( .A0(N553), .A1(n417), .B0(res_rd), .B1(n414), .Y(n84) );
  NAND2X1 U393 ( .A(n168), .B(n169), .Y(n50) );
  NAND3BX1 U394 ( .AN(n110), .B(n53), .C(n166), .Y(n129) );
  AOI2BB2X1 U395 ( .B0(n167), .B1(n423), .A0N(n298), .A1N(n82), .Y(n166) );
  XOR2X1 U396 ( .A(state_cs[1]), .B(state_cs[0]), .Y(n167) );
  CLKBUFX3 U397 ( .A(n233), .Y(n295) );
  NAND2X1 U398 ( .A(n297), .B(state_cs[1]), .Y(n82) );
  OAI21X1 U399 ( .A0(state_cs[1]), .A1(n245), .B0(n67), .Y(n42) );
  OAI31XL U400 ( .A0(n182), .A1(n420), .A2(n417), .B0(n118), .Y(n201) );
  NAND4BX1 U401 ( .AN(n296), .B(n361), .C(n120), .D(n121), .Y(n118) );
  NOR3X1 U402 ( .A(n294), .B(n297), .C(n293), .Y(n121) );
  OAI21XL U403 ( .A0(n418), .A1(n67), .B0(n122), .Y(n120) );
  NAND2X1 U404 ( .A(n298), .B(state_cs[0]), .Y(n35) );
  XNOR2X1 U405 ( .A(n158), .B(n271), .Y(n227) );
  INVX3 U406 ( .A(state_cs[1]), .Y(n418) );
  NAND4X1 U407 ( .A(n247), .B(n251), .C(n78), .D(n79), .Y(n55) );
  NOR4X1 U408 ( .A(res_addr[1]), .B(res_addr[13]), .C(res_addr[12]), .D(
        res_addr[11]), .Y(n79) );
  OAI2BB2XL U409 ( .B0(n280), .B1(n180), .A0N(N166), .A1N(n280), .Y(n216) );
  OAI2BB2XL U410 ( .B0(n280), .B1(n179), .A0N(N165), .A1N(n278), .Y(n217) );
  OAI2BB2XL U411 ( .B0(n280), .B1(n178), .A0N(N164), .A1N(n280), .Y(n218) );
  OAI2BB2XL U412 ( .B0(n280), .B1(n177), .A0N(N163), .A1N(n278), .Y(n219) );
  OAI2BB2XL U413 ( .B0(n280), .B1(n176), .A0N(N162), .A1N(n280), .Y(n220) );
  OAI2BB2XL U414 ( .B0(n280), .B1(n175), .A0N(N161), .A1N(n278), .Y(n221) );
  OAI2BB2XL U415 ( .B0(n280), .B1(n174), .A0N(N160), .A1N(n280), .Y(n222) );
  OAI2BB2XL U416 ( .B0(n280), .B1(n173), .A0N(N159), .A1N(n280), .Y(n223) );
  OAI2BB2XL U417 ( .B0(n280), .B1(n172), .A0N(N157), .A1N(n280), .Y(n224) );
  OAI2BB2XL U418 ( .B0(n278), .B1(n171), .A0N(N158), .A1N(n278), .Y(n225) );
  AND4X1 U419 ( .A(state_cs[0]), .B(n163), .C(n82), .D(n245), .Y(n128) );
  NAND2X1 U420 ( .A(n418), .B(n423), .Y(n163) );
  CLKBUFX3 U421 ( .A(n231), .Y(n293) );
  CLKBUFX3 U422 ( .A(state_cs[2]), .Y(n298) );
  NAND3X1 U423 ( .A(n422), .B(n423), .C(state_cs[1]), .Y(n34) );
  XOR2X1 U424 ( .A(n160), .B(n272), .Y(n229) );
  OAI21XL U425 ( .A0(n35), .A1(n82), .B0(n170), .Y(n191) );
  CLKBUFX3 U426 ( .A(reset), .Y(n300) );
  CLKBUFX3 U427 ( .A(reset), .Y(n301) );
  XNOR2X1 U428 ( .A(res_addr[13]), .B(\r454/carry[13] ), .Y(N233) );
  OR2X1 U429 ( .A(res_addr[12]), .B(\r454/carry[12] ), .Y(\r454/carry[13] ) );
  XNOR2X1 U430 ( .A(\r454/carry[12] ), .B(res_addr[12]), .Y(N232) );
  OR2X1 U431 ( .A(res_addr[11]), .B(\r454/carry[11] ), .Y(\r454/carry[12] ) );
  XNOR2X1 U432 ( .A(\r454/carry[11] ), .B(res_addr[11]), .Y(N231) );
  OR2X1 U433 ( .A(res_addr[10]), .B(\r454/carry[10] ), .Y(\r454/carry[11] ) );
  XNOR2X1 U434 ( .A(\r454/carry[10] ), .B(res_addr[10]), .Y(N230) );
  OR2X1 U435 ( .A(res_addr[9]), .B(\r454/carry[9] ), .Y(\r454/carry[10] ) );
  XNOR2X1 U436 ( .A(\r454/carry[9] ), .B(res_addr[9]), .Y(N229) );
  OR2X1 U437 ( .A(res_addr[8]), .B(\r454/carry[8] ), .Y(\r454/carry[9] ) );
  XNOR2X1 U438 ( .A(\r454/carry[8] ), .B(res_addr[8]), .Y(N228) );
  AND2X1 U439 ( .A(\r454/carry[7] ), .B(res_addr[7]), .Y(\r454/carry[8] ) );
  XOR2X1 U440 ( .A(res_addr[7]), .B(\r454/carry[7] ), .Y(N227) );
  OR2X1 U441 ( .A(res_addr[6]), .B(\r454/carry[6] ), .Y(\r454/carry[7] ) );
  XNOR2X1 U442 ( .A(\r454/carry[6] ), .B(res_addr[6]), .Y(N226) );
  OR2X1 U443 ( .A(res_addr[5]), .B(\r454/carry[5] ), .Y(\r454/carry[6] ) );
  XNOR2X1 U444 ( .A(\r454/carry[5] ), .B(res_addr[5]), .Y(N225) );
  OR2X1 U445 ( .A(res_addr[4]), .B(\r454/carry[4] ), .Y(\r454/carry[5] ) );
  XNOR2X1 U446 ( .A(\r454/carry[4] ), .B(res_addr[4]), .Y(N224) );
  OR2X1 U447 ( .A(res_addr[3]), .B(\r454/carry[3] ), .Y(\r454/carry[4] ) );
  XNOR2X1 U448 ( .A(\r454/carry[3] ), .B(res_addr[3]), .Y(N223) );
  OR2X1 U449 ( .A(res_addr[2]), .B(\r454/carry[2] ), .Y(\r454/carry[3] ) );
  XNOR2X1 U450 ( .A(\r454/carry[2] ), .B(res_addr[2]), .Y(N222) );
  XOR2X1 U451 ( .A(res_addr[13]), .B(\r455/carry [13]), .Y(N275) );
  AND2X1 U452 ( .A(\r455/carry [12]), .B(res_addr[12]), .Y(\r455/carry [13])
         );
  XOR2X1 U453 ( .A(res_addr[12]), .B(\r455/carry [12]), .Y(N274) );
  AND2X1 U454 ( .A(\r455/carry [11]), .B(res_addr[11]), .Y(\r455/carry [12])
         );
  XOR2X1 U455 ( .A(res_addr[11]), .B(\r455/carry [11]), .Y(N273) );
  AND2X1 U456 ( .A(\r455/carry [10]), .B(res_addr[10]), .Y(\r455/carry [11])
         );
  XOR2X1 U457 ( .A(res_addr[10]), .B(\r455/carry [10]), .Y(N272) );
  AND2X1 U458 ( .A(\r455/carry [9]), .B(res_addr[9]), .Y(\r455/carry [10]) );
  XOR2X1 U459 ( .A(res_addr[9]), .B(\r455/carry [9]), .Y(N271) );
  AND2X1 U460 ( .A(\r455/carry [8]), .B(res_addr[8]), .Y(\r455/carry [9]) );
  XOR2X1 U461 ( .A(res_addr[8]), .B(\r455/carry [8]), .Y(N270) );
  AND2X1 U462 ( .A(\r455/carry [7]), .B(res_addr[7]), .Y(\r455/carry [8]) );
  XOR2X1 U463 ( .A(res_addr[7]), .B(\r455/carry [7]), .Y(N269) );
  OR2X1 U464 ( .A(res_addr[6]), .B(\r455/carry [6]), .Y(\r455/carry [7]) );
  XNOR2X1 U465 ( .A(\r455/carry [6]), .B(res_addr[6]), .Y(N268) );
  OR2X1 U466 ( .A(res_addr[5]), .B(\r455/carry [5]), .Y(\r455/carry [6]) );
  XNOR2X1 U467 ( .A(\r455/carry [5]), .B(res_addr[5]), .Y(N267) );
  OR2X1 U468 ( .A(res_addr[4]), .B(\r455/carry [4]), .Y(\r455/carry [5]) );
  XNOR2X1 U469 ( .A(\r455/carry [4]), .B(res_addr[4]), .Y(N266) );
  OR2X1 U470 ( .A(res_addr[3]), .B(\r455/carry [3]), .Y(\r455/carry [4]) );
  XNOR2X1 U471 ( .A(\r455/carry [3]), .B(res_addr[3]), .Y(N265) );
  OR2X1 U472 ( .A(res_addr[2]), .B(res_addr[1]), .Y(\r455/carry [3]) );
  XNOR2X1 U473 ( .A(res_addr[1]), .B(res_addr[2]), .Y(N264) );
  OR2X1 U474 ( .A(res_addr[1]), .B(res_addr[0]), .Y(\r454/carry[2] ) );
  XNOR2X1 U475 ( .A(res_addr[0]), .B(res_addr[1]), .Y(N221) );
  NOR2X1 U476 ( .A(n246), .B(n296), .Y(n311) );
  NOR2X1 U477 ( .A(n246), .B(n346), .Y(n310) );
  NOR2X1 U478 ( .A(n346), .B(n295), .Y(n308) );
  NOR2X1 U479 ( .A(n296), .B(n295), .Y(n307) );
  AO22X1 U480 ( .A0(sti_di[5]), .A1(n308), .B0(sti_di[4]), .B1(n307), .Y(n302)
         );
  AOI221XL U481 ( .A0(sti_di[6]), .A1(n311), .B0(sti_di[7]), .B1(n310), .C0(
        n302), .Y(n305) );
  AO22X1 U482 ( .A0(sti_di[1]), .A1(n308), .B0(sti_di[0]), .B1(n307), .Y(n303)
         );
  AOI221XL U483 ( .A0(sti_di[2]), .A1(n311), .B0(sti_di[3]), .B1(n310), .C0(
        n303), .Y(n304) );
  OA22X1 U484 ( .A0(n271), .A1(n305), .B0(n294), .B1(n304), .Y(n315) );
  AO22X1 U485 ( .A0(sti_di[13]), .A1(n308), .B0(sti_di[12]), .B1(n307), .Y(
        n306) );
  AOI221XL U486 ( .A0(sti_di[14]), .A1(n311), .B0(sti_di[15]), .B1(n310), .C0(
        n306), .Y(n313) );
  AO22X1 U487 ( .A0(sti_di[9]), .A1(n308), .B0(sti_di[8]), .B1(n307), .Y(n309)
         );
  AOI221XL U488 ( .A0(sti_di[10]), .A1(n311), .B0(sti_di[11]), .B1(n310), .C0(
        n309), .Y(n312) );
  OAI22XL U489 ( .A0(n313), .A1(n271), .B0(n294), .B1(n312), .Y(n314) );
  NOR2X1 U490 ( .A(n246), .B(n296), .Y(n325) );
  NOR2X1 U491 ( .A(n246), .B(n272), .Y(n324) );
  NOR2X1 U492 ( .A(n272), .B(n295), .Y(n322) );
  NOR2X1 U493 ( .A(n296), .B(n295), .Y(n321) );
  AO22X1 U494 ( .A0(sti_di[5]), .A1(n322), .B0(sti_di[4]), .B1(n321), .Y(n316)
         );
  AOI221XL U495 ( .A0(sti_di[6]), .A1(n325), .B0(sti_di[7]), .B1(n324), .C0(
        n316), .Y(n319) );
  AO22X1 U496 ( .A0(sti_di[1]), .A1(n322), .B0(sti_di[0]), .B1(n321), .Y(n317)
         );
  AOI221XL U497 ( .A0(sti_di[2]), .A1(n325), .B0(sti_di[3]), .B1(n324), .C0(
        n317), .Y(n318) );
  OA22X1 U498 ( .A0(n271), .A1(n319), .B0(n294), .B1(n318), .Y(n329) );
  AO22X1 U499 ( .A0(sti_di[13]), .A1(n322), .B0(sti_di[12]), .B1(n321), .Y(
        n320) );
  AOI221XL U500 ( .A0(sti_di[14]), .A1(n325), .B0(sti_di[15]), .B1(n324), .C0(
        n320), .Y(n327) );
  AO22X1 U501 ( .A0(sti_di[9]), .A1(n322), .B0(sti_di[8]), .B1(n321), .Y(n323)
         );
  AOI221XL U502 ( .A0(sti_di[10]), .A1(n325), .B0(sti_di[11]), .B1(n324), .C0(
        n323), .Y(n326) );
  OAI22XL U503 ( .A0(n327), .A1(n271), .B0(n294), .B1(n326), .Y(n328) );
  OAI2BB2XL U504 ( .B0(n329), .B1(n293), .A0N(n293), .A1N(n328), .Y(N171) );
  NOR2X1 U505 ( .A(n345), .B(n296), .Y(n339) );
  NOR2X1 U506 ( .A(n345), .B(n346), .Y(n338) );
  NOR2X1 U507 ( .A(n346), .B(n295), .Y(n336) );
  NOR2X1 U508 ( .A(n296), .B(n295), .Y(n335) );
  AO22X1 U509 ( .A0(sti_di[5]), .A1(n336), .B0(sti_di[4]), .B1(n335), .Y(n330)
         );
  AOI221XL U510 ( .A0(sti_di[6]), .A1(n339), .B0(sti_di[7]), .B1(n338), .C0(
        n330), .Y(n333) );
  AO22X1 U511 ( .A0(sti_di[1]), .A1(n336), .B0(sti_di[0]), .B1(n335), .Y(n331)
         );
  AOI221XL U512 ( .A0(sti_di[2]), .A1(n339), .B0(sti_di[3]), .B1(n338), .C0(
        n331), .Y(n332) );
  OA22X1 U513 ( .A0(n344), .A1(n333), .B0(n294), .B1(n332), .Y(n343) );
  AO22X1 U514 ( .A0(sti_di[13]), .A1(n336), .B0(sti_di[12]), .B1(n335), .Y(
        n334) );
  AOI221XL U515 ( .A0(sti_di[14]), .A1(n339), .B0(sti_di[15]), .B1(n338), .C0(
        n334), .Y(n341) );
  AO22X1 U516 ( .A0(sti_di[9]), .A1(n336), .B0(sti_di[8]), .B1(n335), .Y(n337)
         );
  AOI221XL U517 ( .A0(sti_di[10]), .A1(n339), .B0(sti_di[11]), .B1(n338), .C0(
        n337), .Y(n340) );
  OAI22XL U518 ( .A0(n341), .A1(n344), .B0(n294), .B1(n340), .Y(n342) );
  OAI2BB2XL U519 ( .B0(n343), .B1(n293), .A0N(n293), .A1N(n342), .Y(N188) );
  NOR2X1 U520 ( .A(n361), .B(n296), .Y(n356) );
  NOR2X1 U521 ( .A(n361), .B(n346), .Y(n355) );
  NOR2X1 U522 ( .A(n272), .B(n295), .Y(n353) );
  NOR2X1 U523 ( .A(n296), .B(n295), .Y(n352) );
  AO22X1 U524 ( .A0(sti_di[5]), .A1(n353), .B0(sti_di[4]), .B1(n352), .Y(n347)
         );
  AOI221XL U525 ( .A0(sti_di[6]), .A1(n356), .B0(sti_di[7]), .B1(n355), .C0(
        n347), .Y(n350) );
  AO22X1 U526 ( .A0(sti_di[1]), .A1(n353), .B0(sti_di[0]), .B1(n352), .Y(n348)
         );
  AOI221XL U527 ( .A0(sti_di[2]), .A1(n356), .B0(sti_di[3]), .B1(n355), .C0(
        n348), .Y(n349) );
  OA22X1 U528 ( .A0(n344), .A1(n350), .B0(n294), .B1(n349), .Y(n360) );
  AO22X1 U529 ( .A0(sti_di[13]), .A1(n353), .B0(sti_di[12]), .B1(n352), .Y(
        n351) );
  AOI221XL U530 ( .A0(sti_di[14]), .A1(n356), .B0(sti_di[15]), .B1(n355), .C0(
        n351), .Y(n358) );
  AO22X1 U531 ( .A0(sti_di[9]), .A1(n353), .B0(sti_di[8]), .B1(n352), .Y(n354)
         );
  AOI221XL U532 ( .A0(sti_di[10]), .A1(n356), .B0(sti_di[11]), .B1(n355), .C0(
        n354), .Y(n357) );
  OAI22XL U533 ( .A0(n358), .A1(n344), .B0(n294), .B1(n357), .Y(n359) );
  OAI2BB2XL U534 ( .B0(n360), .B1(n293), .A0N(n293), .A1N(n359), .Y(N421) );
  NOR2X1 U535 ( .A(n246), .B(n296), .Y(n371) );
  NOR2X1 U536 ( .A(n246), .B(n272), .Y(n370) );
  NOR2X1 U537 ( .A(n272), .B(n295), .Y(n368) );
  NOR2X1 U538 ( .A(n296), .B(n295), .Y(n367) );
  AO22X1 U539 ( .A0(sti_di[5]), .A1(n368), .B0(sti_di[4]), .B1(n367), .Y(n362)
         );
  AOI221XL U540 ( .A0(sti_di[6]), .A1(n371), .B0(sti_di[7]), .B1(n370), .C0(
        n362), .Y(n365) );
  AO22X1 U541 ( .A0(sti_di[1]), .A1(n368), .B0(sti_di[0]), .B1(n367), .Y(n363)
         );
  AOI221XL U542 ( .A0(sti_di[2]), .A1(n371), .B0(sti_di[3]), .B1(n370), .C0(
        n363), .Y(n364) );
  OA22X1 U543 ( .A0(n271), .A1(n365), .B0(n294), .B1(n364), .Y(n375) );
  AO22X1 U544 ( .A0(sti_di[13]), .A1(n368), .B0(sti_di[12]), .B1(n367), .Y(
        n366) );
  AOI221XL U545 ( .A0(sti_di[14]), .A1(n371), .B0(sti_di[15]), .B1(n370), .C0(
        n366), .Y(n373) );
  AO22X1 U546 ( .A0(sti_di[9]), .A1(n368), .B0(sti_di[8]), .B1(n367), .Y(n369)
         );
  AOI221XL U547 ( .A0(sti_di[10]), .A1(n371), .B0(sti_di[11]), .B1(n370), .C0(
        n369), .Y(n372) );
  OAI22XL U548 ( .A0(n373), .A1(n271), .B0(n294), .B1(n372), .Y(n374) );
  OAI2BB2XL U549 ( .B0(n375), .B1(n293), .A0N(n293), .A1N(n374), .Y(N553) );
  OAI221XL U550 ( .A0(res_do[5]), .A1(n389), .B0(res_do[6]), .B1(n390), .C0(
        n381), .Y(n382) );
  OAI2BB1X1 U551 ( .A0N(n390), .A1N(res_do[6]), .B0(n382), .Y(n383) );
  OAI2BB1X1 U552 ( .A0N(n184), .A1N(res_di[7]), .B0(n383), .Y(n384) );
  NOR2BX1 U553 ( .AN(res_do[2]), .B(N433), .Y(n396) );
  AOI2BB1X1 U554 ( .A0N(n406), .A1N(res_do[1]), .B0(N431), .Y(n391) );
  AO22X1 U555 ( .A0(n391), .A1(res_do[0]), .B0(res_do[1]), .B1(n406), .Y(n395)
         );
  NOR2BX1 U556 ( .AN(N433), .B(res_do[2]), .Y(n392) );
  OAI22XL U557 ( .A0(n392), .A1(n189), .B0(N434), .B1(n392), .Y(n394) );
  OAI22XL U558 ( .A0(N434), .A1(n189), .B0(N434), .B1(n407), .Y(n393) );
  AOI221XL U559 ( .A0(res_do[3]), .A1(n396), .B0(n395), .B1(n394), .C0(n393), 
        .Y(n403) );
  NOR2X1 U560 ( .A(n408), .B(res_do[4]), .Y(n397) );
  OAI22XL U561 ( .A0(n397), .A1(n187), .B0(N436), .B1(n397), .Y(n398) );
  AOI211X1 U562 ( .A0(n184), .A1(N438), .B0(N439), .C0(n404), .Y(n405) );
endmodule

