module ControlUnit(
  input        clock,
  input        reset,
  input  [5:0] io_opcode,
  output       io_jumpEnable,
  output       io_memToReg,
  output       io_memRead,
  output       io_memWrite,
  output [2:0] io_ALUOpcode,
  output       io_ALUSrc,
  output       io_regWrite,
  output       io_regDest,
  output       io_stop
);
  wire  _T = 6'h1 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_1 = 6'h2 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_2 = 6'h3 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_3 = 6'h4 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_4 = 6'h5 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_5 = 6'h6 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_6 = 6'h7 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_7 = 6'h8 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_8 = 6'h9 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_9 = 6'ha == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_10 = 6'hb == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_11 = 6'hc == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_12 = 6'hd == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_13 = 6'he == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_14 = 6'hf == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_15 = 6'h10 == io_opcode; // @[Conditional.scala 37:30]
  wire  _GEN_2 = _T_14 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_14 ? 1'h0 : _T_15; // @[Conditional.scala 39:67]
  wire  _GEN_4 = _T_13 | _T_14; // @[Conditional.scala 39:67]
  wire  _GEN_5 = _T_13 ? 1'h0 : _GEN_2; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_13 ? 1'h0 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_12 | _GEN_4; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_12 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_9 = _T_12 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_11 | _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_11 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_11 ? 1'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_14 = _T_10 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_15 = _T_10 | _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_10 ? 1'h0 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_9 ? 1'h0 : _T_10; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_9 ? 1'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_9 | _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_9 ? 1'h0 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_8 | _T_9; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_8 ? 1'h0 : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_8 ? 1'h0 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_8 | _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_8 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_28 = _T_7 ? 3'h5 : 3'h0; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_7 | _T_8; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_7 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_7 ? 1'h0 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_7 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_7 | _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_7 ? 1'h0 : _GEN_27; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_35 = _T_6 ? 3'h2 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_6 | _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_6 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_6 ? 1'h0 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_6 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_6 | _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_6 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_42 = _T_5 ? 3'h1 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_5 | _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_5 ? 1'h0 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_5 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_5 ? 1'h0 : _GEN_39; // @[Conditional.scala 39:67]
  wire  _GEN_47 = _T_5 | _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_5 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_49 = _T_4 ? 3'h5 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_4 ? 1'h0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_4 ? 1'h0 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_4 ? 1'h0 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_4 ? 1'h0 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_4 | _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_4 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_57 = _T_3 ? 3'h4 : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3 | _T_4; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3 ? 1'h0 : _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_3 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3 ? 1'h0 : _GEN_54; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_3 | _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_65 = _T_2 ? 3'h3 : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_2 | _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_2 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_2 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_2 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_2 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_2 | _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_2 ? 1'h0 : _GEN_64; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_73 = _T_1 ? 3'h2 : _GEN_65; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_1 | _GEN_66; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_1 ? 1'h0 : _GEN_67; // @[Conditional.scala 39:67]
  wire  _GEN_76 = _T_1 ? 1'h0 : _GEN_68; // @[Conditional.scala 39:67]
  wire  _GEN_77 = _T_1 ? 1'h0 : _GEN_69; // @[Conditional.scala 39:67]
  wire  _GEN_78 = _T_1 ? 1'h0 : _GEN_70; // @[Conditional.scala 39:67]
  wire  _GEN_79 = _T_1 | _GEN_71; // @[Conditional.scala 39:67]
  wire  _GEN_80 = _T_1 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  assign io_jumpEnable = _T ? 1'h0 : _GEN_78; // @[ControlUnit.scala 21:17 ControlUnit.scala 76:21 ControlUnit.scala 80:21 ControlUnit.scala 84:21 ControlUnit.scala 88:21]
  assign io_memToReg = _T ? 1'h0 : _GEN_76; // @[ControlUnit.scala 24:15 ControlUnit.scala 65:19 ControlUnit.scala 69:19]
  assign io_memRead = _T ? 1'h0 : _GEN_76; // @[ControlUnit.scala 25:14 ControlUnit.scala 66:18 ControlUnit.scala 70:18]
  assign io_memWrite = _T ? 1'h0 : _GEN_77; // @[ControlUnit.scala 26:15 ControlUnit.scala 73:19]
  assign io_ALUOpcode = _T ? 3'h1 : _GEN_73; // @[ControlUnit.scala 20:16 ControlUnit.scala 32:20 ControlUnit.scala 36:20 ControlUnit.scala 40:20 ControlUnit.scala 44:20 ControlUnit.scala 48:20 ControlUnit.scala 52:20 ControlUnit.scala 56:20 ControlUnit.scala 60:20]
  assign io_ALUSrc = _T ? 1'h0 : _GEN_75; // @[ControlUnit.scala 22:13 ControlUnit.scala 53:17 ControlUnit.scala 57:17 ControlUnit.scala 61:17 ControlUnit.scala 64:17]
  assign io_regWrite = _T | _GEN_79; // @[ControlUnit.scala 23:15 ControlUnit.scala 77:19 ControlUnit.scala 81:19 ControlUnit.scala 85:19 ControlUnit.scala 89:19]
  assign io_regDest = _T | _GEN_74; // @[ControlUnit.scala 27:14 ControlUnit.scala 33:18 ControlUnit.scala 37:18 ControlUnit.scala 41:18 ControlUnit.scala 45:18 ControlUnit.scala 49:18]
  assign io_stop = _T ? 1'h0 : _GEN_80; // @[ControlUnit.scala 28:11 ControlUnit.scala 92:15]
endmodule
