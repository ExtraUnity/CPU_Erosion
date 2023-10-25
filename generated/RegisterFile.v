module RegisterFile(
  input         clock,
  input         reset,
  input  [4:0]  io_readReg1,
  input  [4:0]  io_readReg2,
  input         io_regWrite,
  input  [31:0] io_writeData,
  input  [4:0]  io_writeReg,
  output [31:0] io_readData1,
  output [31:0] io_readData2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] registerFile_0; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_1; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_2; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_3; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_4; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_5; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_6; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_7; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_8; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_9; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_10; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_11; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_12; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_13; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_14; // @[RegisterFile.scala 20:27]
  reg [31:0] registerFile_15; // @[RegisterFile.scala 20:27]
  wire [31:0] _GEN_1 = 4'h1 == io_readReg1[3:0] ? registerFile_1 : registerFile_0; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_2 = 4'h2 == io_readReg1[3:0] ? registerFile_2 : _GEN_1; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_3 = 4'h3 == io_readReg1[3:0] ? registerFile_3 : _GEN_2; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_4 = 4'h4 == io_readReg1[3:0] ? registerFile_4 : _GEN_3; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_5 = 4'h5 == io_readReg1[3:0] ? registerFile_5 : _GEN_4; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_6 = 4'h6 == io_readReg1[3:0] ? registerFile_6 : _GEN_5; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_7 = 4'h7 == io_readReg1[3:0] ? registerFile_7 : _GEN_6; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_8 = 4'h8 == io_readReg1[3:0] ? registerFile_8 : _GEN_7; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_9 = 4'h9 == io_readReg1[3:0] ? registerFile_9 : _GEN_8; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_10 = 4'ha == io_readReg1[3:0] ? registerFile_10 : _GEN_9; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_11 = 4'hb == io_readReg1[3:0] ? registerFile_11 : _GEN_10; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_12 = 4'hc == io_readReg1[3:0] ? registerFile_12 : _GEN_11; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_13 = 4'hd == io_readReg1[3:0] ? registerFile_13 : _GEN_12; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_14 = 4'he == io_readReg1[3:0] ? registerFile_14 : _GEN_13; // @[RegisterFile.scala 22:16]
  wire [31:0] _GEN_17 = 4'h1 == io_readReg2[3:0] ? registerFile_1 : registerFile_0; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_18 = 4'h2 == io_readReg2[3:0] ? registerFile_2 : _GEN_17; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_19 = 4'h3 == io_readReg2[3:0] ? registerFile_3 : _GEN_18; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_20 = 4'h4 == io_readReg2[3:0] ? registerFile_4 : _GEN_19; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_21 = 4'h5 == io_readReg2[3:0] ? registerFile_5 : _GEN_20; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_22 = 4'h6 == io_readReg2[3:0] ? registerFile_6 : _GEN_21; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_23 = 4'h7 == io_readReg2[3:0] ? registerFile_7 : _GEN_22; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_24 = 4'h8 == io_readReg2[3:0] ? registerFile_8 : _GEN_23; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_25 = 4'h9 == io_readReg2[3:0] ? registerFile_9 : _GEN_24; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_26 = 4'ha == io_readReg2[3:0] ? registerFile_10 : _GEN_25; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_27 = 4'hb == io_readReg2[3:0] ? registerFile_11 : _GEN_26; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_28 = 4'hc == io_readReg2[3:0] ? registerFile_12 : _GEN_27; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_29 = 4'hd == io_readReg2[3:0] ? registerFile_13 : _GEN_28; // @[RegisterFile.scala 23:16]
  wire [31:0] _GEN_30 = 4'he == io_readReg2[3:0] ? registerFile_14 : _GEN_29; // @[RegisterFile.scala 23:16]
  assign io_readData1 = 4'hf == io_readReg1[3:0] ? registerFile_15 : _GEN_14; // @[RegisterFile.scala 22:16]
  assign io_readData2 = 4'hf == io_readReg2[3:0] ? registerFile_15 : _GEN_30; // @[RegisterFile.scala 23:16]
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
  registerFile_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  registerFile_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  registerFile_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  registerFile_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  registerFile_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  registerFile_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  registerFile_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  registerFile_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  registerFile_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  registerFile_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  registerFile_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  registerFile_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  registerFile_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  registerFile_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  registerFile_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  registerFile_15 = _RAND_15[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_regWrite) begin
      if (4'h0 == io_writeReg[3:0]) begin
        registerFile_0 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'h1 == io_writeReg[3:0]) begin
        registerFile_1 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'h2 == io_writeReg[3:0]) begin
        registerFile_2 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'h3 == io_writeReg[3:0]) begin
        registerFile_3 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'h4 == io_writeReg[3:0]) begin
        registerFile_4 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'h5 == io_writeReg[3:0]) begin
        registerFile_5 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'h6 == io_writeReg[3:0]) begin
        registerFile_6 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'h7 == io_writeReg[3:0]) begin
        registerFile_7 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'h8 == io_writeReg[3:0]) begin
        registerFile_8 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'h9 == io_writeReg[3:0]) begin
        registerFile_9 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'ha == io_writeReg[3:0]) begin
        registerFile_10 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'hb == io_writeReg[3:0]) begin
        registerFile_11 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'hc == io_writeReg[3:0]) begin
        registerFile_12 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'hd == io_writeReg[3:0]) begin
        registerFile_13 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'he == io_writeReg[3:0]) begin
        registerFile_14 <= io_writeData;
      end
    end
    if (io_regWrite) begin
      if (4'hf == io_writeReg[3:0]) begin
        registerFile_15 <= io_writeData;
      end
    end
  end
endmodule
