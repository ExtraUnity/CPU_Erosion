import chisel3._
import chisel3.util._

/*
NOP = 000
ADD = 001
SUB = 010
OR = 011
AND = 100
MUL = 101
x = 110
y = 111
JGT = 1000
JNEQ = 1001


*/
class ALU extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val operand1 = Input(SInt(32.W))
    val operand2 = Input(SInt(32.W))
    val sel = Input(UInt(4.W))
    val result = Output(SInt(32.W))
    val compResult = Output(Bool())
  })

  val reg = RegInit(0.S(32.W))
  //Implement this module here
  io.compResult := false.B
  switch(io.sel) {
    is("b0001".U) { //ADD
      reg := io.operand1 + io.operand2
    }
    is("b0010".U) { //SUB // JEQ
      reg := io.operand1 - io.operand2
      io.compResult := reg===0.S
    }
    is("b0011".U) { //OR
      reg := io.operand1 | io.operand2
    }
    is("b0100".U) { //AND
      reg := io.operand1 & io.operand2
    }
    is("b0101".U) { //MUL
      reg := io.operand1 * io.operand2
    }
    is("b0110".U) { //X
      reg := io.operand1
    }
    is("b0111".U) { //Y
      reg := io.operand2;
    }
    is("b1000".U) {//JGT
      reg := io.operand1 - io.operand2
      io.compResult := reg > 0.S
    }
    is("b1001".U) {//JNEQ
      reg := io.operand1 - io.operand2
      io.compResult := reg =/= 0.S
    }
  }
  io.result := reg
  
}