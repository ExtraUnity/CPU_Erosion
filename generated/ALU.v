module ALU(
  input         clock,
  input         reset,
  input  [31:0] io_operand1,
  input  [31:0] io_operand2,
  input  [2:0]  io_sel,
  output [31:0] io_result,
  output        io_compResult
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_; // @[ALU.scala 25:20]
  wire  _T = 3'h1 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_3 = $signed(io_operand1) + $signed(io_operand2); // @[ALU.scala 30:26]
  wire  _T_4 = 3'h2 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_7 = $signed(io_operand1) - $signed(io_operand2); // @[ALU.scala 33:26]
  wire  _T_8 = 3'h3 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_10 = $signed(io_operand1) | $signed(io_operand2); // @[ALU.scala 36:26]
  wire  _T_11 = 3'h4 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_13 = $signed(io_operand1) & $signed(io_operand2); // @[ALU.scala 39:26]
  wire  _T_14 = 3'h5 == io_sel; // @[Conditional.scala 37:30]
  wire [63:0] _T_15 = $signed(io_operand1) * $signed(io_operand2); // @[ALU.scala 42:26]
  wire  _T_16 = 3'h6 == io_sel; // @[Conditional.scala 37:30]
  wire  _T_17 = 3'h7 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_0 = _T_17 ? $signed(io_operand2) : $signed(reg_); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_1 = _T_16 ? $signed(io_operand1) : $signed(_GEN_0); // @[Conditional.scala 39:67]
  wire [63:0] _GEN_2 = _T_14 ? $signed(_T_15) : $signed({{32{_GEN_1[31]}},_GEN_1}); // @[Conditional.scala 39:67]
  wire [63:0] _GEN_3 = _T_11 ? $signed({{32{_T_13[31]}},_T_13}) : $signed(_GEN_2); // @[Conditional.scala 39:67]
  wire [63:0] _GEN_4 = _T_8 ? $signed({{32{_T_10[31]}},_T_10}) : $signed(_GEN_3); // @[Conditional.scala 39:67]
  wire [63:0] _GEN_5 = _T_4 ? $signed({{32{_T_7[31]}},_T_7}) : $signed(_GEN_4); // @[Conditional.scala 39:67]
  wire [63:0] _GEN_6 = _T ? $signed({{32{_T_3[31]}},_T_3}) : $signed(_GEN_5); // @[Conditional.scala 40:58]
  assign io_result = reg_; // @[ALU.scala 51:13]
  assign io_compResult = $signed(io_result) == 32'sh0; // @[ALU.scala 52:17]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      reg_ <= 32'sh0;
    end else begin
      reg_ <= _GEN_6[31:0];
    end
  end
endmodule
