/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Apr 21 00:59:04 2018
/////////////////////////////////////////////////////////////


module BON_DW01_inc_0 ( A, SUM );
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


module BON_DW01_inc_1 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module BON ( clk, rst, start, data, en, addr, flag, fin, result );
  input [9:0] data;
  output [9:0] addr;
  output [9:0] result;
  input clk, rst, start;
  output en, flag, fin;
  wire   N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N55, N57, N69, N70,
         N71, N72, N73, N74, N75, N76, N77, N78, N87, N88, N89, N95, N96, N97,
         N98, N105, N106, N120, N121, N122, N123, N124, N125, N126, N127, N128,
         N129, N130, N131, N132, N133, N134, N135, N136, N137, N138, N139,
         N140, N141, N142, N143, n5, n8, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n25, n26, n27, n28, n29, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, N215, N214, N213, N212,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n218, n219, n220, n221, n222, n223, n224;
  wire   [3:0] state;
  wire   [9:0] ans;
  wire   [9:0] next_idx;
  assign en = 1'b1;

  BON_DW01_inc_0 add_80 ( .A(ans), .SUM({N129, N128, N127, N126, N125, N124, 
        N123, N122, N121, N120}) );
  BON_DW01_inc_1 r322 ( .A(addr), .SUM({N24, N23, N22, N21, N20, N19, N18, N17, 
        N16, N15}) );
  DFFRX1 \ans_reg[9]  ( .D(n86), .CK(clk), .RN(n216), .Q(ans[9]), .QN(n64) );
  DFFRX1 \leng_reg[9]  ( .D(n85), .CK(clk), .RN(n216), .QN(n63) );
  DFFRX1 \leng_reg[8]  ( .D(n84), .CK(clk), .RN(n216), .QN(n62) );
  DFFRX1 \leng_reg[7]  ( .D(n83), .CK(clk), .RN(n216), .QN(n61) );
  DFFRX1 \leng_reg[1]  ( .D(n77), .CK(clk), .RN(n216), .QN(n55) );
  DFFRX1 \leng_reg[6]  ( .D(n82), .CK(clk), .RN(n216), .QN(n60) );
  DFFRX1 \leng_reg[5]  ( .D(n81), .CK(clk), .RN(n216), .QN(n59) );
  DFFRX1 \leng_reg[4]  ( .D(n80), .CK(clk), .RN(n216), .QN(n58) );
  DFFRX1 \leng_reg[3]  ( .D(n79), .CK(clk), .RN(n216), .QN(n57) );
  DFFRX1 \leng_reg[2]  ( .D(n78), .CK(clk), .RN(n216), .QN(n56) );
  DFFRX1 \leng_reg[0]  ( .D(n76), .CK(clk), .RN(n216), .QN(n54) );
  DFFRX1 \idx_reg[9]  ( .D(next_idx[9]), .CK(clk), .RN(n216), .Q(addr[9]), 
        .QN(n53) );
  DFFRX1 \idx_reg[4]  ( .D(next_idx[4]), .CK(clk), .RN(n216), .Q(addr[4]), 
        .QN(n46) );
  DFFRX1 \idx_reg[5]  ( .D(next_idx[5]), .CK(clk), .RN(n216), .Q(addr[5]), 
        .QN(n47) );
  DFFRX1 \idx_reg[6]  ( .D(next_idx[6]), .CK(clk), .RN(n216), .Q(addr[6]), 
        .QN(n49) );
  DFFRX1 \idx_reg[7]  ( .D(next_idx[7]), .CK(clk), .RN(n216), .Q(addr[7]), 
        .QN(n44) );
  DFFRX1 \idx_reg[8]  ( .D(next_idx[8]), .CK(clk), .RN(n216), .Q(addr[8]), 
        .QN(n52) );
  DFFRX1 \ans_reg[2]  ( .D(n93), .CK(clk), .RN(n216), .Q(ans[2]), .QN(n71) );
  DFFRX1 \ans_reg[3]  ( .D(n92), .CK(clk), .RN(n216), .Q(ans[3]), .QN(n70) );
  DFFRX1 \ans_reg[4]  ( .D(n91), .CK(clk), .RN(n216), .Q(ans[4]), .QN(n69) );
  DFFRX1 \ans_reg[5]  ( .D(n90), .CK(clk), .RN(n216), .Q(ans[5]), .QN(n68) );
  DFFRX1 \ans_reg[6]  ( .D(n89), .CK(clk), .RN(n216), .Q(ans[6]), .QN(n67) );
  DFFRX1 \ans_reg[7]  ( .D(n88), .CK(clk), .RN(n216), .Q(ans[7]), .QN(n66) );
  DFFRX1 \ans_reg[8]  ( .D(n87), .CK(clk), .RN(n216), .Q(ans[8]), .QN(n65) );
  DFFRX1 \state_reg[3]  ( .D(n99), .CK(clk), .RN(n216), .Q(state[3]), .QN(n173) );
  DFFRX1 \idx_reg[1]  ( .D(next_idx[1]), .CK(clk), .RN(n216), .Q(addr[1]), 
        .QN(n48) );
  DFFRX1 \idx_reg[2]  ( .D(next_idx[2]), .CK(clk), .RN(n216), .Q(addr[2]), 
        .QN(n51) );
  DFFRX1 \idx_reg[3]  ( .D(next_idx[3]), .CK(clk), .RN(n216), .Q(addr[3]), 
        .QN(n45) );
  DFFRX1 \ans_reg[1]  ( .D(n94), .CK(clk), .RN(n216), .Q(ans[1]), .QN(n72) );
  DFFRX1 \idx_reg[0]  ( .D(next_idx[0]), .CK(clk), .RN(n216), .Q(addr[0]), 
        .QN(n50) );
  DFFRX1 \ans_reg[0]  ( .D(n95), .CK(clk), .RN(n216), .Q(ans[0]), .QN(n73) );
  DFFRX1 \state_reg[1]  ( .D(n98), .CK(clk), .RN(n216), .Q(state[1]), .QN(n174) );
  DFFRX1 \state_reg[2]  ( .D(n97), .CK(clk), .RN(n216), .Q(state[2]), .QN(n175) );
  DFFRX1 cont_reg ( .D(n96), .CK(clk), .RN(n216), .QN(n74) );
  DFFRX1 \state_reg[0]  ( .D(n100), .CK(clk), .RN(n216), .Q(state[0]), .QN(
        n178) );
  OAI211X1 U182 ( .A0(state[1]), .A1(n175), .B0(n173), .C0(n18), .Y(n13) );
  OA21XL U183 ( .A0(state[2]), .A1(n8), .B0(n173), .Y(n5) );
  CLKINVX1 U184 ( .A(data[0]), .Y(n219) );
  CLKINVX1 U185 ( .A(n211), .Y(fin) );
  NOR2X1 U186 ( .A(n174), .B(n178), .Y(n20) );
  CLKINVX1 U187 ( .A(n191), .Y(n208) );
  NOR2X1 U188 ( .A(n178), .B(n208), .Y(n190) );
  NAND2X1 U189 ( .A(N213), .B(N212), .Y(n224) );
  AO22X1 U190 ( .A0(n215), .A1(N22), .B0(N141), .B1(n173), .Y(next_idx[7]) );
  NOR2BX1 U191 ( .AN(N22), .B(n212), .Y(N76) );
  OAI2BB2XL U192 ( .B0(n5), .B1(n175), .A0N(N132), .A1N(n5), .Y(n97) );
  XNOR2X1 U193 ( .A(N214), .B(n224), .Y(N88) );
  NOR2BX1 U194 ( .AN(N214), .B(n224), .Y(n223) );
  CLKINVX1 U195 ( .A(n203), .Y(n210) );
  NAND2X1 U196 ( .A(n14), .B(n29), .Y(N57) );
  OAI21XL U197 ( .A0(n175), .A1(n221), .B0(n215), .Y(n29) );
  CLKINVX1 U198 ( .A(n20), .Y(n221) );
  AO22X1 U199 ( .A0(N24), .A1(n215), .B0(N143), .B1(n173), .Y(next_idx[9]) );
  NOR2BX1 U200 ( .AN(N24), .B(n212), .Y(N78) );
  AO22X1 U201 ( .A0(n215), .A1(N23), .B0(N142), .B1(n173), .Y(next_idx[8]) );
  NOR2BX1 U202 ( .AN(N23), .B(n212), .Y(N77) );
  AO21X1 U203 ( .A0(N133), .A1(n5), .B0(n215), .Y(n99) );
  CLKINVX1 U204 ( .A(n207), .Y(N133) );
  XOR2X1 U205 ( .A(N215), .B(n223), .Y(N89) );
  XNOR2X1 U206 ( .A(N213), .B(n218), .Y(N87) );
  AO22X1 U207 ( .A0(n215), .A1(N20), .B0(N139), .B1(n173), .Y(next_idx[5]) );
  NOR2BX1 U208 ( .AN(N20), .B(n212), .Y(N74) );
  AO22X1 U209 ( .A0(n215), .A1(N19), .B0(N138), .B1(n173), .Y(next_idx[4]) );
  NOR2BX1 U210 ( .AN(N19), .B(n212), .Y(N73) );
  AO22X1 U211 ( .A0(n215), .A1(N18), .B0(N137), .B1(n173), .Y(next_idx[3]) );
  NOR2BX1 U212 ( .AN(N18), .B(n212), .Y(N72) );
  AO22X1 U213 ( .A0(n215), .A1(N17), .B0(N136), .B1(n173), .Y(next_idx[2]) );
  NOR2BX1 U214 ( .AN(N17), .B(n212), .Y(N71) );
  AO22X1 U215 ( .A0(n215), .A1(N16), .B0(N135), .B1(n173), .Y(next_idx[1]) );
  NOR2BX1 U216 ( .AN(N16), .B(n212), .Y(N70) );
  CLKINVX1 U217 ( .A(N212), .Y(n218) );
  CLKINVX1 U218 ( .A(n206), .Y(n209) );
  XOR2X1 U219 ( .A(n20), .B(n175), .Y(n176) );
  CLKINVX1 U220 ( .A(N55), .Y(n220) );
  AO22X1 U221 ( .A0(n215), .A1(N21), .B0(N140), .B1(n173), .Y(next_idx[6]) );
  NOR2BX1 U222 ( .AN(N21), .B(n212), .Y(N75) );
  AO22X1 U223 ( .A0(n215), .A1(N15), .B0(N134), .B1(n173), .Y(next_idx[0]) );
  NOR2BX1 U224 ( .AN(N15), .B(n212), .Y(N69) );
  CLKINVX1 U225 ( .A(n10), .Y(n222) );
  NAND2X1 U226 ( .A(n220), .B(n219), .Y(N96) );
  CLKBUFX3 U227 ( .A(n11), .Y(n211) );
  NAND4X1 U228 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n11) );
  NOR3X1 U229 ( .A(n41), .B(n42), .C(n43), .Y(n33) );
  NOR4X1 U230 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n34) );
  NAND3X1 U231 ( .A(state[2]), .B(n173), .C(n20), .Y(n14) );
  OAI2BB2XL U232 ( .B0(n178), .B1(n5), .A0N(N130), .A1N(n5), .Y(n100) );
  OAI2BB2XL U233 ( .B0(n64), .B1(n214), .A0N(N129), .A1N(n213), .Y(n86) );
  OAI2BB2XL U234 ( .B0(n5), .B1(n174), .A0N(N131), .A1N(n5), .Y(n98) );
  AND2X2 U235 ( .A(N57), .B(n219), .Y(N98) );
  CLKBUFX3 U236 ( .A(state[3]), .Y(n215) );
  NOR4X1 U237 ( .A(n13), .B(n219), .C(n178), .D(n74), .Y(n214) );
  NOR4X1 U238 ( .A(n13), .B(n219), .C(n178), .D(n74), .Y(n21) );
  NOR4X1 U239 ( .A(n13), .B(n219), .C(n178), .D(n74), .Y(n213) );
  NAND4BBXL U240 ( .AN(n13), .BN(n10), .C(start), .D(n178), .Y(n177) );
  CLKINVX1 U241 ( .A(n177), .Y(n12) );
  OAI21XL U242 ( .A0(state[1]), .A1(n178), .B0(n222), .Y(N55) );
  NAND3BX1 U243 ( .AN(start), .B(n178), .C(n191), .Y(n188) );
  AOI32X1 U244 ( .A0(n219), .A1(n174), .A2(state[0]), .B0(n10), .B1(data[0]), 
        .Y(n8) );
  NOR2X1 U245 ( .A(n174), .B(state[0]), .Y(n10) );
  OAI22XL U246 ( .A0(n74), .A1(n15), .B0(n219), .B1(n14), .Y(n96) );
  AOI211X1 U247 ( .A0(n16), .A1(n175), .B0(n17), .C0(n215), .Y(n15) );
  AO21X1 U248 ( .A0(n174), .A1(n178), .B0(N95), .Y(n16) );
  OAI22XL U249 ( .A0(n219), .A1(n18), .B0(n19), .B1(n175), .Y(n17) );
  NOR2X1 U250 ( .A(data[0]), .B(n176), .Y(N97) );
  NAND2X1 U251 ( .A(n176), .B(n219), .Y(N106) );
  AOI2BB2X1 U252 ( .B0(n175), .B1(state[0]), .A0N(n222), .A1N(n175), .Y(n18)
         );
  AOI2BB1X1 U253 ( .A0N(state[1]), .A1N(data[0]), .B0(n20), .Y(n19) );
  OAI2BB2XL U254 ( .B0(n67), .B1(n214), .A0N(N126), .A1N(n213), .Y(n89) );
  OAI2BB2XL U255 ( .B0(n70), .B1(n214), .A0N(N123), .A1N(n213), .Y(n92) );
  OAI2BB2XL U256 ( .B0(n73), .B1(n214), .A0N(N120), .A1N(n213), .Y(n95) );
  OAI2BB2XL U257 ( .B0(n65), .B1(n21), .A0N(N128), .A1N(n21), .Y(n87) );
  OAI2BB2XL U258 ( .B0(n66), .B1(n213), .A0N(N127), .A1N(n21), .Y(n88) );
  OAI2BB2XL U259 ( .B0(n68), .B1(n21), .A0N(N125), .A1N(n214), .Y(n90) );
  OAI2BB2XL U260 ( .B0(n69), .B1(n213), .A0N(N124), .A1N(n21), .Y(n91) );
  OAI2BB2XL U261 ( .B0(n71), .B1(n21), .A0N(N122), .A1N(n214), .Y(n93) );
  OAI2BB2XL U262 ( .B0(n72), .B1(n213), .A0N(N121), .A1N(n21), .Y(n94) );
  OAI2BB2XL U263 ( .B0(n54), .B1(n12), .A0N(data[0]), .A1N(n12), .Y(n76) );
  OAI2BB2XL U264 ( .B0(n55), .B1(n12), .A0N(data[1]), .A1N(n12), .Y(n77) );
  OAI2BB2XL U265 ( .B0(n56), .B1(n12), .A0N(data[2]), .A1N(n12), .Y(n78) );
  OAI2BB2XL U266 ( .B0(n57), .B1(n12), .A0N(data[3]), .A1N(n12), .Y(n79) );
  OAI2BB2XL U267 ( .B0(n58), .B1(n12), .A0N(data[4]), .A1N(n12), .Y(n80) );
  OAI2BB2XL U268 ( .B0(n59), .B1(n12), .A0N(data[5]), .A1N(n12), .Y(n81) );
  OAI2BB2XL U269 ( .B0(n60), .B1(n12), .A0N(data[6]), .A1N(n12), .Y(n82) );
  OAI2BB2XL U270 ( .B0(n61), .B1(n12), .A0N(data[7]), .A1N(n12), .Y(n83) );
  OAI2BB2XL U271 ( .B0(n62), .B1(n12), .A0N(data[8]), .A1N(n12), .Y(n84) );
  OAI2BB2XL U272 ( .B0(n63), .B1(n12), .A0N(data[9]), .A1N(n12), .Y(n85) );
  NOR2X1 U273 ( .A(data[0]), .B(state[0]), .Y(N95) );
  OR2X1 U274 ( .A(n48), .B(n47), .Y(n28) );
  CLKBUFX3 U275 ( .A(n25), .Y(n212) );
  NOR4BBX1 U276 ( .AN(n26), .BN(n27), .C(n53), .D(n52), .Y(n25) );
  NOR3X1 U277 ( .A(n51), .B(n49), .C(n50), .Y(n26) );
  NOR4X1 U278 ( .A(n28), .B(n46), .C(n44), .D(n45), .Y(n27) );
  NOR2X1 U279 ( .A(data[0]), .B(n220), .Y(N105) );
  INVX3 U280 ( .A(rst), .Y(n216) );
  XNOR2X1 U281 ( .A(n55), .B(n48), .Y(n31) );
  XNOR2X1 U282 ( .A(n61), .B(n44), .Y(n32) );
  NAND3X1 U283 ( .A(n39), .B(start), .C(n40), .Y(n35) );
  XNOR2X1 U284 ( .A(n62), .B(n52), .Y(n39) );
  XNOR2X1 U285 ( .A(n63), .B(n53), .Y(n40) );
  NOR3X1 U286 ( .A(n14), .B(n74), .C(n219), .Y(flag) );
  XOR2X1 U287 ( .A(n45), .B(n57), .Y(n38) );
  XOR2X1 U288 ( .A(n51), .B(n56), .Y(n37) );
  XOR2X1 U289 ( .A(n46), .B(n58), .Y(n36) );
  XOR2X1 U290 ( .A(n49), .B(n60), .Y(n41) );
  XOR2X1 U291 ( .A(n47), .B(n59), .Y(n42) );
  XOR2X1 U292 ( .A(n50), .B(n54), .Y(n43) );
  NOR2X1 U293 ( .A(n73), .B(n211), .Y(result[0]) );
  NOR2X1 U294 ( .A(n72), .B(n211), .Y(result[1]) );
  NOR2X1 U295 ( .A(n71), .B(n211), .Y(result[2]) );
  NOR2X1 U296 ( .A(n70), .B(n211), .Y(result[3]) );
  NOR2X1 U297 ( .A(n69), .B(n211), .Y(result[4]) );
  NOR2X1 U298 ( .A(n68), .B(n211), .Y(result[5]) );
  NOR2X1 U299 ( .A(n67), .B(n211), .Y(result[6]) );
  NOR2X1 U300 ( .A(n66), .B(n211), .Y(result[7]) );
  NOR2X1 U301 ( .A(n65), .B(n211), .Y(result[8]) );
  NOR2X1 U302 ( .A(n64), .B(n211), .Y(result[9]) );
  NOR2X1 U303 ( .A(state[1]), .B(state[2]), .Y(n191) );
  AOI22X1 U304 ( .A0(N69), .A1(n190), .B0(N15), .B1(n208), .Y(n179) );
  NAND2X1 U305 ( .A(n179), .B(n188), .Y(N134) );
  AOI22X1 U306 ( .A0(N70), .A1(n190), .B0(N16), .B1(n208), .Y(n180) );
  NAND2X1 U307 ( .A(n180), .B(n188), .Y(N135) );
  AOI22X1 U308 ( .A0(N71), .A1(n190), .B0(N17), .B1(n208), .Y(n181) );
  NAND2X1 U309 ( .A(n181), .B(n188), .Y(N136) );
  AOI22X1 U310 ( .A0(N72), .A1(n190), .B0(N18), .B1(n208), .Y(n182) );
  NAND2X1 U311 ( .A(n182), .B(n188), .Y(N137) );
  AOI22X1 U312 ( .A0(N73), .A1(n190), .B0(N19), .B1(n208), .Y(n183) );
  NAND2X1 U313 ( .A(n183), .B(n188), .Y(N138) );
  AOI22X1 U314 ( .A0(N74), .A1(n190), .B0(N20), .B1(n208), .Y(n184) );
  NAND2X1 U315 ( .A(n184), .B(n188), .Y(N139) );
  AOI22X1 U316 ( .A0(N75), .A1(n190), .B0(N21), .B1(n208), .Y(n185) );
  NAND2X1 U317 ( .A(n185), .B(n188), .Y(N140) );
  AOI22X1 U318 ( .A0(N76), .A1(n190), .B0(N22), .B1(n208), .Y(n186) );
  NAND2X1 U319 ( .A(n186), .B(n188), .Y(N141) );
  AOI22X1 U320 ( .A0(N77), .A1(n190), .B0(N23), .B1(n208), .Y(n187) );
  NAND2X1 U321 ( .A(n187), .B(n188), .Y(N142) );
  AOI22X1 U322 ( .A0(N78), .A1(n190), .B0(N24), .B1(n208), .Y(n189) );
  NAND2X1 U323 ( .A(n189), .B(n188), .Y(N143) );
  XOR2X1 U324 ( .A(state[2]), .B(n178), .Y(n193) );
  AOI31X1 U325 ( .A0(state[1]), .A1(n175), .A2(n193), .B0(n190), .Y(n203) );
  NAND2X1 U326 ( .A(n178), .B(n210), .Y(n196) );
  NAND3X1 U327 ( .A(n193), .B(state[2]), .C(state[1]), .Y(n198) );
  NAND2BX1 U328 ( .AN(n198), .B(n219), .Y(n202) );
  NOR2X1 U329 ( .A(n175), .B(state[1]), .Y(n206) );
  AO22X1 U330 ( .A0(start), .A1(n191), .B0(N95), .B1(n206), .Y(n192) );
  AOI32X1 U331 ( .A0(n206), .A1(state[0]), .A2(N95), .B0(n192), .B1(n178), .Y(
        n195) );
  NOR2BX1 U332 ( .AN(state[1]), .B(n193), .Y(n204) );
  NAND2X1 U333 ( .A(n218), .B(n204), .Y(n194) );
  NAND4X1 U334 ( .A(n196), .B(n202), .C(n195), .D(n194), .Y(N130) );
  AOI22X1 U335 ( .A0(N96), .A1(n178), .B0(N105), .B1(state[0]), .Y(n199) );
  AOI22X1 U336 ( .A0(N87), .A1(n204), .B0(N55), .B1(n210), .Y(n197) );
  OAI221XL U337 ( .A0(n209), .A1(n199), .B0(n219), .B1(n198), .C0(n197), .Y(
        N131) );
  AOI22X1 U338 ( .A0(N97), .A1(n178), .B0(N106), .B1(state[0]), .Y(n200) );
  AOI2BB2X1 U339 ( .B0(N88), .B1(n204), .A0N(n209), .A1N(n200), .Y(n201) );
  OAI211X1 U340 ( .A0(n203), .A1(n176), .B0(n202), .C0(n201), .Y(N132) );
  AO22X1 U341 ( .A0(N98), .A1(state[0]), .B0(N98), .B1(n178), .Y(n205) );
  AOI222XL U342 ( .A0(N57), .A1(n210), .B0(n206), .B1(n205), .C0(N89), .C1(
        n204), .Y(n207) );
  AND2X1 U343 ( .A(state[0]), .B(data[0]), .Y(N212) );
  AND2X1 U344 ( .A(state[1]), .B(data[0]), .Y(N213) );
  AND2X1 U345 ( .A(state[2]), .B(data[0]), .Y(N214) );
  AND2X1 U346 ( .A(data[0]), .B(n215), .Y(N215) );
endmodule

