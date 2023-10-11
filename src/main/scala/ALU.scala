import chisel3._
import chisel3.util._

/*
ADD = 001
SUB = 010
OR = 011
AND = 100
MULT = 101



*/
class ALU extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val operand1 = Input(SInt(32.W))
    val operand2 = Input(SInt(32.W))
    val sel = Input(UInt(3.W))
    val result = Output(SInt(32.W))
    val compResult = Output(Bool())
  })

  val reg = RegInit(0.S(32.W))
  //Implement this module here
  
  switch(io.sel) {
    is("b001".U) { //ADD
      reg := io.operand1 + io.operand2
    }
    is("b010".U) {
      reg := io.operand1 - io.operand2
    }
    is("b011".U) {
      reg := io.operand1 | io.operand2
    }
    is("b100".U) {
      reg := io.operand1 & io.operand2
    }
    is("b101".U) {
      reg := io.operand1 * io.operand2
    }
  }
  io.result := reg
  io.compResult := io.result===0.S
}