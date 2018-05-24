/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Apr 21 00:04:44 2018
/////////////////////////////////////////////////////////////


module PTM_DW01_inc_0 ( A, SUM );
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


module PTM_DW01_inc_1 ( A, SUM );
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


module PTM ( clk, rst, start, data, en, addr, flag, fin, result );
  input [9:0] data;
  output [9:0] addr;
  output [9:0] result;
  input clk, rst, start;
  output en, flag, fin;
  wire   N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N51, N64, N65, N66,
         N67, N68, N69, N70, N71, N72, N73, N81, N82, N88, N89, N94, N95, N96,
         N105, N106, N107, N108, N109, N110, N111, N112, N113, N114, n5, n6,
         n9, n10, n11, n12, n13, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, N154, N153, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n203, n204, n205,
         n206;
  wire   [2:0] state;
  wire   [9:0] ans;
  wire   [2:0] next_state;
  wire   [9:0] next_idx;
  assign en = 1'b1;

  PTM_DW01_inc_0 add_89 ( .A(ans), .SUM({N114, N113, N112, N111, N110, N109, 
        N108, N107, N106, N105}) );
  PTM_DW01_inc_1 r319 ( .A(addr), .SUM({N22, N21, N20, N19, N18, N17, N16, N15, 
        N14, N13}) );
  DFFRX1 \ans_reg[9]  ( .D(n74), .CK(clk), .RN(n200), .Q(ans[9]), .QN(n53) );
  DFFRX1 \leng_reg[9]  ( .D(n73), .CK(clk), .RN(n200), .QN(n52) );
  DFFRX1 \leng_reg[1]  ( .D(n71), .CK(clk), .RN(n200), .QN(n50) );
  DFFRX1 \leng_reg[7]  ( .D(n65), .CK(clk), .RN(n200), .QN(n44) );
  DFFRX1 \leng_reg[8]  ( .D(n64), .CK(clk), .RN(n200), .QN(n43) );
  DFFRX1 \leng_reg[0]  ( .D(n72), .CK(clk), .RN(n200), .QN(n51) );
  DFFRX1 \leng_reg[2]  ( .D(n70), .CK(clk), .RN(n200), .QN(n49) );
  DFFRX1 \leng_reg[3]  ( .D(n69), .CK(clk), .RN(n200), .QN(n48) );
  DFFRX1 \leng_reg[4]  ( .D(n68), .CK(clk), .RN(n200), .QN(n47) );
  DFFRX1 \leng_reg[5]  ( .D(n67), .CK(clk), .RN(n200), .QN(n46) );
  DFFRX1 \leng_reg[6]  ( .D(n66), .CK(clk), .RN(n200), .QN(n45) );
  DFFRX1 \idx_reg[9]  ( .D(next_idx[9]), .CK(clk), .RN(n200), .Q(addr[9]), 
        .QN(n42) );
  DFFRX1 \idx_reg[8]  ( .D(next_idx[8]), .CK(clk), .RN(n200), .Q(addr[8]), 
        .QN(n41) );
  DFFRX1 \idx_reg[7]  ( .D(next_idx[7]), .CK(clk), .RN(n200), .Q(addr[7]), 
        .QN(n33) );
  DFFRX1 \idx_reg[6]  ( .D(next_idx[6]), .CK(clk), .RN(n200), .Q(addr[6]), 
        .QN(n38) );
  DFFRX1 \idx_reg[5]  ( .D(next_idx[5]), .CK(clk), .RN(n200), .Q(addr[5]), 
        .QN(n36) );
  DFFRX1 \idx_reg[4]  ( .D(next_idx[4]), .CK(clk), .RN(n200), .Q(addr[4]), 
        .QN(n35) );
  DFFRX1 \idx_reg[3]  ( .D(next_idx[3]), .CK(clk), .RN(n200), .Q(addr[3]), 
        .QN(n34) );
  DFFRX1 \ans_reg[2]  ( .D(n81), .CK(clk), .RN(n200), .Q(ans[2]), .QN(n60) );
  DFFRX1 \ans_reg[3]  ( .D(n80), .CK(clk), .RN(n200), .Q(ans[3]), .QN(n59) );
  DFFRX1 \ans_reg[4]  ( .D(n79), .CK(clk), .RN(n200), .Q(ans[4]), .QN(n58) );
  DFFRX1 \ans_reg[5]  ( .D(n78), .CK(clk), .RN(n200), .Q(ans[5]), .QN(n57) );
  DFFRX1 \ans_reg[6]  ( .D(n77), .CK(clk), .RN(n200), .Q(ans[6]), .QN(n56) );
  DFFRX1 \ans_reg[7]  ( .D(n76), .CK(clk), .RN(n200), .Q(ans[7]), .QN(n55) );
  DFFRX1 \ans_reg[8]  ( .D(n75), .CK(clk), .RN(n200), .Q(ans[8]), .QN(n54) );
  DFFRX1 \state_reg[0]  ( .D(n86), .CK(clk), .RN(n200), .Q(state[0]), .QN(n157) );
  DFFRX1 \idx_reg[2]  ( .D(next_idx[2]), .CK(clk), .RN(n200), .Q(addr[2]), 
        .QN(n40) );
  DFFRX1 \idx_reg[1]  ( .D(next_idx[1]), .CK(clk), .RN(n200), .Q(addr[1]), 
        .QN(n37) );
  DFFRX1 \ans_reg[1]  ( .D(n82), .CK(clk), .RN(n200), .Q(ans[1]), .QN(n61) );
  DFFRX1 \idx_reg[0]  ( .D(next_idx[0]), .CK(clk), .RN(n200), .Q(addr[0]), 
        .QN(n39) );
  DFFRX1 \ans_reg[0]  ( .D(n83), .CK(clk), .RN(n200), .Q(ans[0]), .QN(n62) );
  DFFRX1 \state_reg[2]  ( .D(n85), .CK(clk), .RN(n200), .Q(state[2]), .QN(n158) );
  DFFRX1 \state_reg[1]  ( .D(n84), .CK(clk), .RN(n200), .Q(state[1]), .QN(n159) );
  CLKINVX1 U155 ( .A(data[0]), .Y(n204) );
  CLKINVX1 U156 ( .A(n172), .Y(n191) );
  CLKINVX1 U157 ( .A(n193), .Y(fin) );
  CLKINVX1 U158 ( .A(n183), .Y(n192) );
  NOR2BX1 U159 ( .AN(N14), .B(n194), .Y(N65) );
  NOR2BX1 U160 ( .AN(N15), .B(n194), .Y(N66) );
  NOR2BX1 U161 ( .AN(N16), .B(n194), .Y(N67) );
  NOR2BX1 U162 ( .AN(N17), .B(n194), .Y(N68) );
  NOR2BX1 U163 ( .AN(N18), .B(n194), .Y(N69) );
  NOR2BX1 U164 ( .AN(N19), .B(n194), .Y(N70) );
  NOR2BX1 U165 ( .AN(N20), .B(n194), .Y(N71) );
  NOR2BX1 U166 ( .AN(N21), .B(n194), .Y(N72) );
  OAI2BB1X1 U167 ( .A0N(next_state[1]), .A1N(n9), .B0(n10), .Y(n84) );
  OAI2BB1X1 U168 ( .A0N(next_state[0]), .A1N(n10), .B0(n9), .Y(n86) );
  NOR4X1 U169 ( .A(n158), .B(n159), .C(n204), .D(n157), .Y(n195) );
  NOR4X1 U170 ( .A(n158), .B(n159), .C(n204), .D(n157), .Y(n196) );
  NOR4X1 U171 ( .A(n158), .B(n159), .C(n204), .D(n157), .Y(flag) );
  XNOR2X1 U172 ( .A(n159), .B(n199), .Y(N51) );
  XNOR2X1 U173 ( .A(N154), .B(n203), .Y(N81) );
  CLKINVX1 U174 ( .A(n173), .Y(n189) );
  NAND4X1 U175 ( .A(n199), .B(n204), .C(n159), .D(n158), .Y(n9) );
  CLKINVX1 U176 ( .A(n184), .Y(n190) );
  NAND2X1 U177 ( .A(n13), .B(n204), .Y(N96) );
  AND2X2 U178 ( .A(N154), .B(N153), .Y(n206) );
  CLKINVX1 U179 ( .A(N153), .Y(n203) );
  CLKBUFX3 U180 ( .A(n11), .Y(n193) );
  NAND4X1 U181 ( .A(n20), .B(n21), .C(n22), .D(n23), .Y(n11) );
  NOR3X1 U182 ( .A(n30), .B(n31), .C(n32), .Y(n22) );
  NOR4X1 U183 ( .A(n24), .B(n25), .C(n26), .D(n27), .Y(n23) );
  OA21XL U184 ( .A0(n5), .A1(n6), .B0(next_state[2]), .Y(n85) );
  OAI22XL U185 ( .A0(state[1]), .A1(n199), .B0(n157), .B1(n204), .Y(n6) );
  OAI21XL U186 ( .A0(data[0]), .A1(n159), .B0(n158), .Y(n5) );
  NOR2BX1 U187 ( .AN(N13), .B(n194), .Y(N64) );
  NOR2BX1 U188 ( .AN(N22), .B(n194), .Y(N73) );
  CLKBUFX3 U189 ( .A(state[0]), .Y(n199) );
  OAI2BB2XL U190 ( .B0(n196), .B1(n53), .A0N(N114), .A1N(n195), .Y(n74) );
  NOR4X1 U191 ( .A(n201), .B(n199), .C(state[1]), .D(state[2]), .Y(n198) );
  NOR4X1 U192 ( .A(n201), .B(n199), .C(state[1]), .D(state[2]), .Y(n12) );
  NOR4X1 U193 ( .A(n201), .B(n199), .C(state[1]), .D(state[2]), .Y(n197) );
  NAND3BX1 U194 ( .AN(start), .B(n157), .C(n173), .Y(n170) );
  NAND4X1 U195 ( .A(state[1]), .B(data[0]), .C(n157), .D(n158), .Y(n10) );
  XNOR2X1 U196 ( .A(n160), .B(n206), .Y(N82) );
  NAND2X1 U197 ( .A(data[0]), .B(state[2]), .Y(n160) );
  NAND2X1 U198 ( .A(n205), .B(n204), .Y(N88) );
  NOR2X1 U199 ( .A(data[0]), .B(n205), .Y(N95) );
  CLKINVX1 U200 ( .A(N51), .Y(n205) );
  XOR2X1 U201 ( .A(n19), .B(state[2]), .Y(n13) );
  NAND2X1 U202 ( .A(state[1]), .B(n199), .Y(n19) );
  OAI2BB2XL U203 ( .B0(n45), .B1(n198), .A0N(data[6]), .A1N(n197), .Y(n66) );
  OAI2BB2XL U204 ( .B0(n48), .B1(n198), .A0N(data[3]), .A1N(n197), .Y(n69) );
  OAI2BB2XL U205 ( .B0(n51), .B1(n198), .A0N(data[0]), .A1N(n197), .Y(n72) );
  OAI2BB2XL U206 ( .B0(n52), .B1(n198), .A0N(data[9]), .A1N(n197), .Y(n73) );
  OAI2BB2XL U207 ( .B0(n43), .B1(n12), .A0N(data[8]), .A1N(n12), .Y(n64) );
  OAI2BB2XL U208 ( .B0(n44), .B1(n197), .A0N(data[7]), .A1N(n12), .Y(n65) );
  OAI2BB2XL U209 ( .B0(n46), .B1(n12), .A0N(data[5]), .A1N(n198), .Y(n67) );
  OAI2BB2XL U210 ( .B0(n47), .B1(n197), .A0N(data[4]), .A1N(n12), .Y(n68) );
  OAI2BB2XL U211 ( .B0(n49), .B1(n12), .A0N(data[2]), .A1N(n198), .Y(n70) );
  OAI2BB2XL U212 ( .B0(n50), .B1(n197), .A0N(data[1]), .A1N(n12), .Y(n71) );
  OAI2BB2XL U213 ( .B0(n195), .B1(n55), .A0N(N112), .A1N(flag), .Y(n76) );
  OAI2BB2XL U214 ( .B0(n195), .B1(n58), .A0N(N109), .A1N(flag), .Y(n79) );
  OAI2BB2XL U215 ( .B0(n195), .B1(n61), .A0N(N106), .A1N(flag), .Y(n82) );
  OAI2BB2XL U216 ( .B0(n196), .B1(n56), .A0N(N111), .A1N(n195), .Y(n77) );
  OAI2BB2XL U217 ( .B0(n196), .B1(n59), .A0N(N108), .A1N(n195), .Y(n80) );
  OAI2BB2XL U218 ( .B0(n196), .B1(n62), .A0N(N105), .A1N(n195), .Y(n83) );
  OAI2BB2XL U219 ( .B0(flag), .B1(n54), .A0N(N113), .A1N(flag), .Y(n75) );
  OAI2BB2XL U220 ( .B0(flag), .B1(n57), .A0N(N110), .A1N(n195), .Y(n78) );
  OAI2BB2XL U221 ( .B0(flag), .B1(n60), .A0N(N107), .A1N(n196), .Y(n81) );
  AND2X2 U222 ( .A(n199), .B(data[0]), .Y(N153) );
  OR2X1 U223 ( .A(n37), .B(n36), .Y(n18) );
  CLKBUFX3 U224 ( .A(n15), .Y(n194) );
  NOR4BBX1 U225 ( .AN(n16), .BN(n17), .C(n42), .D(n41), .Y(n15) );
  NOR3X1 U226 ( .A(n40), .B(n38), .C(n39), .Y(n16) );
  NOR4X1 U227 ( .A(n18), .B(n35), .C(n33), .D(n34), .Y(n17) );
  AND2X2 U228 ( .A(state[1]), .B(data[0]), .Y(N154) );
  NOR2X1 U229 ( .A(n199), .B(data[0]), .Y(N94) );
  NOR2X1 U230 ( .A(data[0]), .B(n13), .Y(N89) );
  XNOR2X1 U231 ( .A(n50), .B(n37), .Y(n20) );
  XNOR2X1 U232 ( .A(n44), .B(n33), .Y(n21) );
  INVX3 U233 ( .A(rst), .Y(n200) );
  NAND3X1 U234 ( .A(n28), .B(start), .C(n29), .Y(n24) );
  XNOR2X1 U235 ( .A(n43), .B(n41), .Y(n28) );
  XNOR2X1 U236 ( .A(n52), .B(n42), .Y(n29) );
  CLKINVX1 U237 ( .A(start), .Y(n201) );
  XOR2X1 U238 ( .A(n34), .B(n48), .Y(n27) );
  XOR2X1 U239 ( .A(n40), .B(n49), .Y(n26) );
  XOR2X1 U240 ( .A(n35), .B(n47), .Y(n25) );
  XOR2X1 U241 ( .A(n38), .B(n45), .Y(n30) );
  XOR2X1 U242 ( .A(n36), .B(n46), .Y(n31) );
  XOR2X1 U243 ( .A(n39), .B(n51), .Y(n32) );
  NOR2X1 U244 ( .A(n62), .B(n193), .Y(result[0]) );
  NOR2X1 U245 ( .A(n61), .B(n193), .Y(result[1]) );
  NOR2X1 U246 ( .A(n60), .B(n193), .Y(result[2]) );
  NOR2X1 U247 ( .A(n59), .B(n193), .Y(result[3]) );
  NOR2X1 U248 ( .A(n58), .B(n193), .Y(result[4]) );
  NOR2X1 U249 ( .A(n57), .B(n193), .Y(result[5]) );
  NOR2X1 U250 ( .A(n56), .B(n193), .Y(result[6]) );
  NOR2X1 U251 ( .A(n55), .B(n193), .Y(result[7]) );
  NOR2X1 U252 ( .A(n54), .B(n193), .Y(result[8]) );
  NOR2X1 U253 ( .A(n53), .B(n193), .Y(result[9]) );
  NOR2X1 U254 ( .A(state[1]), .B(state[2]), .Y(n173) );
  NAND2X1 U255 ( .A(n199), .B(n173), .Y(n172) );
  AOI22X1 U256 ( .A0(N64), .A1(n191), .B0(N13), .B1(n189), .Y(n161) );
  NAND2X1 U257 ( .A(n161), .B(n170), .Y(next_idx[0]) );
  AOI22X1 U258 ( .A0(N65), .A1(n191), .B0(N14), .B1(n189), .Y(n162) );
  NAND2X1 U259 ( .A(n162), .B(n170), .Y(next_idx[1]) );
  AOI22X1 U260 ( .A0(N66), .A1(n191), .B0(N15), .B1(n189), .Y(n163) );
  NAND2X1 U261 ( .A(n163), .B(n170), .Y(next_idx[2]) );
  AOI22X1 U262 ( .A0(N67), .A1(n191), .B0(N16), .B1(n189), .Y(n164) );
  NAND2X1 U263 ( .A(n164), .B(n170), .Y(next_idx[3]) );
  AOI22X1 U264 ( .A0(N68), .A1(n191), .B0(N17), .B1(n189), .Y(n165) );
  NAND2X1 U265 ( .A(n165), .B(n170), .Y(next_idx[4]) );
  AOI22X1 U266 ( .A0(N69), .A1(n191), .B0(N18), .B1(n189), .Y(n166) );
  NAND2X1 U267 ( .A(n166), .B(n170), .Y(next_idx[5]) );
  AOI22X1 U268 ( .A0(N70), .A1(n191), .B0(N19), .B1(n189), .Y(n167) );
  NAND2X1 U269 ( .A(n167), .B(n170), .Y(next_idx[6]) );
  AOI22X1 U270 ( .A0(N71), .A1(n191), .B0(N20), .B1(n189), .Y(n168) );
  NAND2X1 U271 ( .A(n168), .B(n170), .Y(next_idx[7]) );
  AOI22X1 U272 ( .A0(N72), .A1(n191), .B0(N21), .B1(n189), .Y(n169) );
  NAND2X1 U273 ( .A(n169), .B(n170), .Y(next_idx[8]) );
  AOI22X1 U274 ( .A0(N73), .A1(n191), .B0(N22), .B1(n189), .Y(n171) );
  NAND2X1 U275 ( .A(n171), .B(n170), .Y(next_idx[9]) );
  XOR2X1 U276 ( .A(state[2]), .B(n199), .Y(n175) );
  OAI31XL U277 ( .A0(n159), .A1(state[2]), .A2(n175), .B0(n172), .Y(n183) );
  NAND2X1 U278 ( .A(n157), .B(n183), .Y(n178) );
  NAND3BX1 U279 ( .AN(n175), .B(state[2]), .C(state[1]), .Y(n182) );
  NAND2BX1 U280 ( .AN(n182), .B(n204), .Y(n188) );
  NAND2X1 U281 ( .A(state[2]), .B(n159), .Y(n184) );
  AO22X1 U282 ( .A0(start), .A1(n173), .B0(N94), .B1(n190), .Y(n174) );
  AOI32X1 U283 ( .A0(n190), .A1(n199), .A2(N94), .B0(n174), .B1(n157), .Y(n177) );
  NOR2BX1 U284 ( .AN(n175), .B(n159), .Y(n186) );
  NAND2X1 U285 ( .A(n203), .B(n186), .Y(n176) );
  NAND4X1 U286 ( .A(n178), .B(n188), .C(n177), .D(n176), .Y(next_state[0]) );
  NAND2X1 U287 ( .A(N51), .B(n183), .Y(n181) );
  AOI22X1 U288 ( .A0(N88), .A1(n157), .B0(N95), .B1(n199), .Y(n179) );
  AOI2BB2X1 U289 ( .B0(N81), .B1(n186), .A0N(n184), .A1N(n179), .Y(n180) );
  OAI211X1 U290 ( .A0(n204), .A1(n182), .B0(n181), .C0(n180), .Y(next_state[1]) );
  AOI22X1 U291 ( .A0(N89), .A1(n157), .B0(N96), .B1(n199), .Y(n185) );
  AOI2BB2X1 U292 ( .B0(N82), .B1(n186), .A0N(n185), .A1N(n184), .Y(n187) );
  OAI211X1 U293 ( .A0(n192), .A1(n13), .B0(n188), .C0(n187), .Y(next_state[2])
         );
endmodule

