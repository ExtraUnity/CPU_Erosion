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
  reg [31:0] reg_; // @[ALU.scala 24:20]
  wire  _T = 3'h1 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_3 = $signed(io_operand1) + $signed(io_operand2); // @[ALU.scala 29:26]
  wire  _T_4 = 3'h2 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_7 = $signed(io_operand1) - $signed(io_operand2); // @[ALU.scala 32:26]
  wire  _T_8 = 3'h3 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_10 = $signed(io_operand1) | $signed(io_operand2); // @[ALU.scala 35:26]
  wire  _T_11 = 3'h4 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_13 = $signed(io_operand1) & $signed(io_operand2); // @[ALU.scala 38:26]
  assign io_result = reg_; // @[ALU.scala 41:13]
  assign io_compResult = $signed(io_result) == 32'sh0; // @[ALU.scala 42:17]
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
    end else if (_T) begin
      reg_ <= _T_3;
    end else if (_T_4) begin
      reg_ <= _T_7;
    end else if (_T_8) begin
      reg_ <= _T_10;
    end else if (_T_11) begin
      reg_ <= _T_13;
    end
  end
endmodule
