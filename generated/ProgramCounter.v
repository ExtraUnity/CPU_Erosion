module ProgramCounter(
  input         clock,
  input         reset,
  input         io_stop,
  input         io_jump,
  input         io_run,
  input  [15:0] io_programCounterJump,
  output [15:0] io_programCounter
);
  wire  _T = ~io_run; // @[ProgramCounter.scala 20:40]
  wire  _T_1 = io_stop | _T; // @[ProgramCounter.scala 20:36]
  wire [15:0] _T_4 = io_jump ? io_programCounterJump : 16'h1; // @[ProgramCounter.scala 20:61]
  assign io_programCounter = _T_1 ? 16'h0 : _T_4; // @[ProgramCounter.scala 20:21]
endmodule
