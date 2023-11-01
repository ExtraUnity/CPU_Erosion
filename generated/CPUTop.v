module ProgramCounter(
  input         clock,
  input         reset,
  input         io_stop,
  input         io_jump,
  input         io_run,
  input  [15:0] io_programCounterJump,
  output [15:0] io_programCounter
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] finReg; // @[ProgramCounter.scala 15:23]
  wire  _T = ~io_run; // @[ProgramCounter.scala 17:29]
  wire  _T_1 = io_stop | _T; // @[ProgramCounter.scala 17:25]
  wire [15:0] _T_3 = finReg + 16'h1; // @[ProgramCounter.scala 17:90]
  assign io_programCounter = finReg; // @[ProgramCounter.scala 18:21]
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
  finReg = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      finReg <= 16'h0;
    end else if (!(_T_1)) begin
      if (io_jump) begin
        finReg <= io_programCounterJump;
      end else begin
        finReg <= _T_3;
      end
    end
  end
endmodule
module DataMemory(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_dataRead,
  input         io_writeEnable,
  input  [31:0] io_dataWrite,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_2_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_2_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_1_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_1_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_1_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_1_en; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_3_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_3_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_3_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_3_en; // @[DataMemory.scala 18:20]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[DataMemory.scala 24:32]
  wire [31:0] _GEN_11 = io_writeEnable ? io_dataWrite : memory__T_2_data; // @[DataMemory.scala 32:26]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign memory__T_3_data = io_dataWrite;
  assign memory__T_3_addr = io_address;
  assign memory__T_3_mask = 1'h1;
  assign memory__T_3_en = io_testerEnable ? 1'h0 : io_writeEnable;
  assign io_dataRead = io_testerEnable ? 32'h0 : _GEN_11; // @[DataMemory.scala 23:17 DataMemory.scala 30:17 DataMemory.scala 34:19]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[DataMemory.scala 22:23 DataMemory.scala 26:25 DataMemory.scala 31:23]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[DataMemory.scala 18:20]
    end
    if(memory__T_3_en & memory__T_3_mask) begin
      memory[memory__T_3_addr] <= memory__T_3_data; // @[DataMemory.scala 18:20]
    end
  end
endmodule
module ProgramMemory(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_instructionRead,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_addr; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_2_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_2_addr; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_1_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_1_addr; // @[ProgramMemory.scala 16:20]
  wire  memory__T_1_mask; // @[ProgramMemory.scala 16:20]
  wire  memory__T_1_en; // @[ProgramMemory.scala 16:20]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[ProgramMemory.scala 22:32]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[ProgramMemory.scala 16:20]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[ProgramMemory.scala 16:20]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign io_instructionRead = io_testerEnable ? 32'h0 : memory__T_2_data; // @[ProgramMemory.scala 21:24 ProgramMemory.scala 28:24]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[ProgramMemory.scala 20:23 ProgramMemory.scala 24:25 ProgramMemory.scala 29:23]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[ProgramMemory.scala 16:20]
    end
  end
endmodule
module RegisterFile(
  input         clock,
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
module ControlUnit(
  input  [5:0] io_opcode,
  output       io_JR,
  output       io_jumpEnable,
  output       io_memToReg,
  output       io_memWrite,
  output [3:0] io_ALUOpcode,
  output       io_ALUSrc,
  output       io_regWrite,
  output       io_regDest,
  output       io_stop
);
  wire  _T = 6'h0 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_1 = 6'h1 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_2 = 6'h2 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_3 = 6'h3 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_4 = 6'h4 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_5 = 6'h5 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_6 = 6'h6 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_7 = 6'h7 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_8 = 6'h8 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_9 = 6'h9 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_10 = 6'ha == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_11 = 6'hb == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_12 = 6'hc == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_13 = 6'hd == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_14 = 6'he == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_15 = 6'hf == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_16 = 6'h10 == io_opcode; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_1 = _T_15 ? 2'h2 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_15 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_4 = _T_15 ? 1'h0 : _T_16; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_5 = _T_14 ? 4'h9 : {{2'd0}, _GEN_1}; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_14 | _T_15; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_14 ? 1'h0 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_14 ? 1'h0 : _GEN_4; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_9 = _T_13 ? 4'h8 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_13 | _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_13 ? 1'h0 : _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_13 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_12 | _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_14 = _T_12 ? 1'h0 : _GEN_11; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_16 = _T_12 ? 4'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_12 ? 1'h0 : _GEN_12; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_18 = _T_11 ? 4'h7 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_11 ? 1'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_11 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_11 ? 1'h0 : _T_12; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_11 ? 1'h0 : _GEN_17; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_24 = _T_10 ? 4'h6 : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_10 ? 1'h0 : _T_11; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_10 | _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_10 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_10 ? 1'h0 : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_10 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_31 = _T_9 ? 4'h7 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_9 ? 1'h0 : _T_10; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_9 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_9 | _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_9 ? 1'h0 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_9 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_9 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_39 = _T_8 ? 4'h5 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_8 | _T_9; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_8 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_8 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_8 | _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_8 ? 1'h0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_8 ? 1'h0 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_8 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_47 = _T_7 ? 4'h2 : _GEN_39; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_7 | _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_7 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_7 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_7 | _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_7 ? 1'h0 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_7 ? 1'h0 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_7 ? 1'h0 : _GEN_46; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_55 = _T_6 ? 4'h1 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_6 | _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_57 = _T_6 ? 1'h0 : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_6 ? 1'h0 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_6 | _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_6 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_6 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_6 ? 1'h0 : _GEN_54; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_63 = _T_5 ? 4'h5 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_5 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_5 ? 1'h0 : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_5 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_5 | _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_5 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_5 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_5 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_72 = _T_4 ? 4'h4 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_4 | _T_5; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_4 ? 1'h0 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_4 ? 1'h0 : _GEN_66; // @[Conditional.scala 39:67]
  wire  _GEN_76 = _T_4 ? 1'h0 : _GEN_67; // @[Conditional.scala 39:67]
  wire  _GEN_77 = _T_4 | _GEN_68; // @[Conditional.scala 39:67]
  wire  _GEN_78 = _T_4 ? 1'h0 : _GEN_69; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_4 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_80 = _T_4 ? 1'h0 : _GEN_71; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_81 = _T_3 ? 4'h3 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_82 = _T_3 | _GEN_73; // @[Conditional.scala 39:67]
  wire  _GEN_83 = _T_3 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_3 ? 1'h0 : _GEN_75; // @[Conditional.scala 39:67]
  wire  _GEN_85 = _T_3 ? 1'h0 : _GEN_76; // @[Conditional.scala 39:67]
  wire  _GEN_86 = _T_3 | _GEN_77; // @[Conditional.scala 39:67]
  wire  _GEN_87 = _T_3 ? 1'h0 : _GEN_78; // @[Conditional.scala 39:67]
  wire  _GEN_88 = _T_3 ? 1'h0 : _GEN_79; // @[Conditional.scala 39:67]
  wire  _GEN_89 = _T_3 ? 1'h0 : _GEN_80; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_90 = _T_2 ? 4'h2 : _GEN_81; // @[Conditional.scala 39:67]
  wire  _GEN_91 = _T_2 | _GEN_82; // @[Conditional.scala 39:67]
  wire  _GEN_92 = _T_2 ? 1'h0 : _GEN_83; // @[Conditional.scala 39:67]
  wire  _GEN_93 = _T_2 ? 1'h0 : _GEN_84; // @[Conditional.scala 39:67]
  wire  _GEN_94 = _T_2 ? 1'h0 : _GEN_85; // @[Conditional.scala 39:67]
  wire  _GEN_95 = _T_2 | _GEN_86; // @[Conditional.scala 39:67]
  wire  _GEN_96 = _T_2 ? 1'h0 : _GEN_87; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_2 ? 1'h0 : _GEN_88; // @[Conditional.scala 39:67]
  wire  _GEN_98 = _T_2 ? 1'h0 : _GEN_89; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_99 = _T_1 ? 4'h1 : _GEN_90; // @[Conditional.scala 39:67]
  wire  _GEN_100 = _T_1 | _GEN_91; // @[Conditional.scala 39:67]
  wire  _GEN_101 = _T_1 ? 1'h0 : _GEN_92; // @[Conditional.scala 39:67]
  wire  _GEN_102 = _T_1 ? 1'h0 : _GEN_93; // @[Conditional.scala 39:67]
  wire  _GEN_103 = _T_1 ? 1'h0 : _GEN_94; // @[Conditional.scala 39:67]
  wire  _GEN_104 = _T_1 | _GEN_95; // @[Conditional.scala 39:67]
  wire  _GEN_105 = _T_1 ? 1'h0 : _GEN_96; // @[Conditional.scala 39:67]
  wire  _GEN_106 = _T_1 ? 1'h0 : _GEN_97; // @[Conditional.scala 39:67]
  wire  _GEN_107 = _T_1 ? 1'h0 : _GEN_98; // @[Conditional.scala 39:67]
  assign io_JR = _T ? 1'h0 : _GEN_106; // @[ControlUnit.scala 21:9 ControlUnit.scala 82:13]
  assign io_jumpEnable = _T ? 1'h0 : _GEN_105; // @[ControlUnit.scala 22:17 ControlUnit.scala 80:21 ControlUnit.scala 86:21 ControlUnit.scala 91:21 ControlUnit.scala 96:21]
  assign io_memToReg = _T ? 1'h0 : _GEN_102; // @[ControlUnit.scala 25:15 ControlUnit.scala 72:19]
  assign io_memWrite = _T ? 1'h0 : _GEN_103; // @[ControlUnit.scala 26:15 ControlUnit.scala 76:19]
  assign io_ALUOpcode = _T ? 4'h0 : _GEN_99; // @[ControlUnit.scala 20:16 ControlUnit.scala 35:20 ControlUnit.scala 39:20 ControlUnit.scala 43:20 ControlUnit.scala 47:20 ControlUnit.scala 51:20 ControlUnit.scala 55:20 ControlUnit.scala 59:20 ControlUnit.scala 63:20 ControlUnit.scala 67:20 ControlUnit.scala 71:20 ControlUnit.scala 75:20 ControlUnit.scala 85:20 ControlUnit.scala 90:20 ControlUnit.scala 95:20]
  assign io_ALUSrc = _T ? 1'h0 : _GEN_101; // @[ControlUnit.scala 23:13 ControlUnit.scala 56:17 ControlUnit.scala 60:17 ControlUnit.scala 64:17 ControlUnit.scala 68:17]
  assign io_regWrite = _T ? 1'h0 : _GEN_104; // @[ControlUnit.scala 24:15 ControlUnit.scala 32:19 ControlUnit.scala 77:19 ControlUnit.scala 81:19 ControlUnit.scala 87:19 ControlUnit.scala 92:19 ControlUnit.scala 97:19]
  assign io_regDest = _T ? 1'h0 : _GEN_100; // @[ControlUnit.scala 27:14 ControlUnit.scala 36:18 ControlUnit.scala 40:18 ControlUnit.scala 44:18 ControlUnit.scala 48:18 ControlUnit.scala 52:18]
  assign io_stop = _T ? 1'h0 : _GEN_107; // @[ControlUnit.scala 28:11 ControlUnit.scala 100:15]
endmodule
module ALU(
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
module CPUTop(
  input         clock,
  input         reset,
  output        io_done,
  input         io_run,
  input         io_testerDataMemEnable,
  input  [15:0] io_testerDataMemAddress,
  output [31:0] io_testerDataMemDataRead,
  input         io_testerDataMemWriteEnable,
  input  [31:0] io_testerDataMemDataWrite,
  input         io_testerProgMemEnable,
  input  [15:0] io_testerProgMemAddress,
  output [31:0] io_testerProgMemDataRead,
  input         io_testerProgMemWriteEnable,
  input  [31:0] io_testerProgMemDataWrite
);
  wire  programCounter_clock; // @[CPUTop.scala 23:30]
  wire  programCounter_reset; // @[CPUTop.scala 23:30]
  wire  programCounter_io_stop; // @[CPUTop.scala 23:30]
  wire  programCounter_io_jump; // @[CPUTop.scala 23:30]
  wire  programCounter_io_run; // @[CPUTop.scala 23:30]
  wire [15:0] programCounter_io_programCounterJump; // @[CPUTop.scala 23:30]
  wire [15:0] programCounter_io_programCounter; // @[CPUTop.scala 23:30]
  wire  dataMemory_clock; // @[CPUTop.scala 24:26]
  wire [15:0] dataMemory_io_address; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_dataRead; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_writeEnable; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_dataWrite; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_testerEnable; // @[CPUTop.scala 24:26]
  wire [15:0] dataMemory_io_testerAddress; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_testerDataRead; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_testerWriteEnable; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_testerDataWrite; // @[CPUTop.scala 24:26]
  wire  programMemory_clock; // @[CPUTop.scala 25:29]
  wire [15:0] programMemory_io_address; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_instructionRead; // @[CPUTop.scala 25:29]
  wire  programMemory_io_testerEnable; // @[CPUTop.scala 25:29]
  wire [15:0] programMemory_io_testerAddress; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_testerDataRead; // @[CPUTop.scala 25:29]
  wire  programMemory_io_testerWriteEnable; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_testerDataWrite; // @[CPUTop.scala 25:29]
  wire  registerFile_clock; // @[CPUTop.scala 26:28]
  wire [4:0] registerFile_io_readReg1; // @[CPUTop.scala 26:28]
  wire [4:0] registerFile_io_readReg2; // @[CPUTop.scala 26:28]
  wire  registerFile_io_regWrite; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_writeData; // @[CPUTop.scala 26:28]
  wire [4:0] registerFile_io_writeReg; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_readData1; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_readData2; // @[CPUTop.scala 26:28]
  wire [5:0] controlUnit_io_opcode; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_JR; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_jumpEnable; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_memToReg; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_memWrite; // @[CPUTop.scala 27:27]
  wire [3:0] controlUnit_io_ALUOpcode; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_ALUSrc; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_regWrite; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_regDest; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_stop; // @[CPUTop.scala 27:27]
  wire [31:0] alu_io_operand1; // @[CPUTop.scala 28:19]
  wire [31:0] alu_io_operand2; // @[CPUTop.scala 28:19]
  wire [3:0] alu_io_sel; // @[CPUTop.scala 28:19]
  wire [31:0] alu_io_result; // @[CPUTop.scala 28:19]
  wire  alu_io_compResult; // @[CPUTop.scala 28:19]
  wire  _T = controlUnit_io_jumpEnable & alu_io_compResult; // @[CPUTop.scala 33:77]
  wire [31:0] _T_14 = {{16'd0}, programMemory_io_instructionRead[15:0]}; // @[CPUTop.scala 58:88]
  wire [31:0] _T_17 = alu_io_result; // @[CPUTop.scala 62:42]
  ProgramCounter programCounter ( // @[CPUTop.scala 23:30]
    .clock(programCounter_clock),
    .reset(programCounter_reset),
    .io_stop(programCounter_io_stop),
    .io_jump(programCounter_io_jump),
    .io_run(programCounter_io_run),
    .io_programCounterJump(programCounter_io_programCounterJump),
    .io_programCounter(programCounter_io_programCounter)
  );
  DataMemory dataMemory ( // @[CPUTop.scala 24:26]
    .clock(dataMemory_clock),
    .io_address(dataMemory_io_address),
    .io_dataRead(dataMemory_io_dataRead),
    .io_writeEnable(dataMemory_io_writeEnable),
    .io_dataWrite(dataMemory_io_dataWrite),
    .io_testerEnable(dataMemory_io_testerEnable),
    .io_testerAddress(dataMemory_io_testerAddress),
    .io_testerDataRead(dataMemory_io_testerDataRead),
    .io_testerWriteEnable(dataMemory_io_testerWriteEnable),
    .io_testerDataWrite(dataMemory_io_testerDataWrite)
  );
  ProgramMemory programMemory ( // @[CPUTop.scala 25:29]
    .clock(programMemory_clock),
    .io_address(programMemory_io_address),
    .io_instructionRead(programMemory_io_instructionRead),
    .io_testerEnable(programMemory_io_testerEnable),
    .io_testerAddress(programMemory_io_testerAddress),
    .io_testerDataRead(programMemory_io_testerDataRead),
    .io_testerWriteEnable(programMemory_io_testerWriteEnable),
    .io_testerDataWrite(programMemory_io_testerDataWrite)
  );
  RegisterFile registerFile ( // @[CPUTop.scala 26:28]
    .clock(registerFile_clock),
    .io_readReg1(registerFile_io_readReg1),
    .io_readReg2(registerFile_io_readReg2),
    .io_regWrite(registerFile_io_regWrite),
    .io_writeData(registerFile_io_writeData),
    .io_writeReg(registerFile_io_writeReg),
    .io_readData1(registerFile_io_readData1),
    .io_readData2(registerFile_io_readData2)
  );
  ControlUnit controlUnit ( // @[CPUTop.scala 27:27]
    .io_opcode(controlUnit_io_opcode),
    .io_JR(controlUnit_io_JR),
    .io_jumpEnable(controlUnit_io_jumpEnable),
    .io_memToReg(controlUnit_io_memToReg),
    .io_memWrite(controlUnit_io_memWrite),
    .io_ALUOpcode(controlUnit_io_ALUOpcode),
    .io_ALUSrc(controlUnit_io_ALUSrc),
    .io_regWrite(controlUnit_io_regWrite),
    .io_regDest(controlUnit_io_regDest),
    .io_stop(controlUnit_io_stop)
  );
  ALU alu ( // @[CPUTop.scala 28:19]
    .io_operand1(alu_io_operand1),
    .io_operand2(alu_io_operand2),
    .io_sel(alu_io_sel),
    .io_result(alu_io_result),
    .io_compResult(alu_io_compResult)
  );
  assign io_done = controlUnit_io_stop; // @[CPUTop.scala 68:11]
  assign io_testerDataMemDataRead = dataMemory_io_testerDataRead; // @[CPUTop.scala 78:28]
  assign io_testerProgMemDataRead = programMemory_io_testerDataRead; // @[CPUTop.scala 72:28]
  assign programCounter_clock = clock;
  assign programCounter_reset = reset;
  assign programCounter_io_stop = controlUnit_io_stop; // @[CPUTop.scala 32:26]
  assign programCounter_io_jump = controlUnit_io_JR | _T; // @[CPUTop.scala 33:26]
  assign programCounter_io_run = io_run; // @[CPUTop.scala 31:25]
  assign programCounter_io_programCounterJump = programMemory_io_instructionRead[15:0]; // @[CPUTop.scala 34:40]
  assign dataMemory_clock = clock;
  assign dataMemory_io_address = _T_17[15:0]; // @[CPUTop.scala 62:25]
  assign dataMemory_io_writeEnable = controlUnit_io_memWrite; // @[CPUTop.scala 64:29]
  assign dataMemory_io_dataWrite = registerFile_io_readData1; // @[CPUTop.scala 63:27]
  assign dataMemory_io_testerEnable = io_testerDataMemEnable; // @[CPUTop.scala 80:30]
  assign dataMemory_io_testerAddress = io_testerDataMemAddress; // @[CPUTop.scala 77:31]
  assign dataMemory_io_testerWriteEnable = io_testerDataMemWriteEnable; // @[CPUTop.scala 81:35]
  assign dataMemory_io_testerDataWrite = io_testerDataMemDataWrite; // @[CPUTop.scala 79:33]
  assign programMemory_clock = clock;
  assign programMemory_io_address = programCounter_io_programCounter; // @[CPUTop.scala 42:28]
  assign programMemory_io_testerEnable = io_testerProgMemEnable; // @[CPUTop.scala 74:33]
  assign programMemory_io_testerAddress = io_testerProgMemAddress; // @[CPUTop.scala 71:34]
  assign programMemory_io_testerWriteEnable = io_testerProgMemWriteEnable; // @[CPUTop.scala 75:38]
  assign programMemory_io_testerDataWrite = io_testerProgMemDataWrite; // @[CPUTop.scala 73:36]
  assign registerFile_clock = clock;
  assign registerFile_io_readReg1 = programMemory_io_instructionRead[20:16]; // @[CPUTop.scala 51:28]
  assign registerFile_io_readReg2 = controlUnit_io_regDest ? programMemory_io_instructionRead[15:11] : programMemory_io_instructionRead[25:21]; // @[CPUTop.scala 52:28]
  assign registerFile_io_regWrite = controlUnit_io_regWrite; // @[CPUTop.scala 54:28]
  assign registerFile_io_writeData = controlUnit_io_memToReg ? $signed(dataMemory_io_dataRead) : $signed(alu_io_result); // @[CPUTop.scala 53:29]
  assign registerFile_io_writeReg = programMemory_io_instructionRead[25:21]; // @[CPUTop.scala 50:28]
  assign controlUnit_io_opcode = programMemory_io_instructionRead[31:26]; // @[CPUTop.scala 46:25]
  assign alu_io_operand1 = registerFile_io_readData1; // @[CPUTop.scala 57:19]
  assign alu_io_operand2 = controlUnit_io_ALUSrc ? _T_14 : registerFile_io_readData2; // @[CPUTop.scala 58:19]
  assign alu_io_sel = controlUnit_io_ALUOpcode; // @[CPUTop.scala 59:14]
endmodule
