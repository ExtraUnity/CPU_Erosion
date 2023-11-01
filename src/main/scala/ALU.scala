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

  io.result := 0.S
  //Implement this module here
  io.compResult := false.B
  switch(io.sel) {
    is("b0001".U) { //ADD
      io.result := io.operand1 + io.operand2
    }
    is("b0010".U) { //SUB // JEQ
      val temp =  io.operand1 - io.operand2
      io.result := temp
      io.compResult := temp===0.S
    }
    is("b0011".U) { //OR
      io.result := io.operand1 | io.operand2
    }
    is("b0100".U) { //AND
      io.result := io.operand1 & io.operand2
    }
    is("b0101".U) { //MUL
      io.result := io.operand1 * io.operand2
    }
    is("b0110".U) { //X
      io.result := io.operand1
    }
    is("b0111".U) { //Y
      io.result := io.operand2;
    }
    is("b1000".U) {//JGT
      val temp =  io.operand2 - io.operand1
      io.result := temp
      io.compResult := temp > 0.S
    }
    is("b1001".U) {//JNEQ
      val temp =  io.operand1 - io.operand2
      io.result := temp
      io.compResult := temp=/=0.S
    }
  }
  
  
}