module ALU(
  input         clock,
  input         reset,
  input  [31:0] io_operand1,
  input  [31:0] io_operand2,
  input  [3:0]  io_sel,
  output [31:0] io_result,
  output        io_compResult
);
  wire  _T = 4'h1 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_3 = $signed(io_operand1) + $signed(io_operand2); // @[ALU.scala 33:32]
  wire  _T_4 = 4'h2 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_7 = $signed(io_operand1) - $signed(io_operand2); // @[ALU.scala 36:31]
  wire  _T_8 = $signed(_T_7) == 32'sh0; // @[ALU.scala 38:28]
  wire  _T_9 = 4'h3 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_11 = $signed(io_operand1) | $signed(io_operand2); // @[ALU.scala 41:32]
  wire  _T_12 = 4'h4 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_14 = $signed(io_operand1) & $signed(io_operand2); // @[ALU.scala 44:32]
  wire  _T_15 = 4'h5 == io_sel; // @[Conditional.scala 37:30]
  wire [63:0] _T_16 = $signed(io_operand1) * $signed(io_operand2); // @[ALU.scala 47:32]
  wire  _T_17 = 4'h6 == io_sel; // @[Conditional.scala 37:30]
  wire  _T_18 = 4'h7 == io_sel; // @[Conditional.scala 37:30]
  wire  _T_19 = 4'h8 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_22 = $signed(io_operand2) - $signed(io_operand1); // @[ALU.scala 56:31]
  wire  _T_23 = $signed(_T_22) > 32'sh0; // @[ALU.scala 58:29]
  wire  _T_24 = 4'h9 == io_sel; // @[Conditional.scala 37:30]
  wire  _T_28 = $signed(_T_7) != 32'sh0; // @[ALU.scala 63:28]
  wire [31:0] _GEN_0 = _T_24 ? $signed(_T_7) : $signed(32'sh0); // @[Conditional.scala 39:67]
  wire  _GEN_1 = _T_24 & _T_28; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_2 = _T_19 ? $signed(_T_22) : $signed(_GEN_0); // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_19 ? _T_23 : _GEN_1; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_4 = _T_18 ? $signed(io_operand2) : $signed(_GEN_2); // @[Conditional.scala 39:67]
  wire  _GEN_5 = _T_18 ? 1'h0 : _GEN_3; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_6 = _T_17 ? $signed(io_operand1) : $signed(_GEN_4); // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_17 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_8 = _T_15 ? $signed(_T_16) : $signed({{32{_GEN_6[31]}},_GEN_6}); // @[Conditional.scala 39:67]
  wire  _GEN_9 = _T_15 ? 1'h0 : _GEN_7; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_10 = _T_12 ? $signed({{32{_T_14[31]}},_T_14}) : $signed(_GEN_8); // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_12 ? 1'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_12 = _T_9 ? $signed({{32{_T_11[31]}},_T_11}) : $signed(_GEN_10); // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_9 ? 1'h0 : _GEN_11; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_14 = _T_4 ? $signed({{32{_T_7[31]}},_T_7}) : $signed(_GEN_12); // @[Conditional.scala 39:67]
  wire  _GEN_15 = _T_4 ? _T_8 : _GEN_13; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_16 = _T ? $signed({{32{_T_3[31]}},_T_3}) : $signed(_GEN_14); // @[Conditional.scala 40:58]
  assign io_result = _GEN_16[31:0]; // @[ALU.scala 28:13 ALU.scala 33:17 ALU.scala 37:17 ALU.scala 41:17 ALU.scala 44:17 ALU.scala 47:17 ALU.scala 50:17 ALU.scala 53:17 ALU.scala 57:17 ALU.scala 62:17]
  assign io_compResult = _T ? 1'h0 : _GEN_15; // @[ALU.scala 30:17 ALU.scala 38:21 ALU.scala 58:21 ALU.scala 63:21]
endmodule
