import chisel3._
import chisel3.util._

class ControlUnit extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val opcode = Input(UInt(6.W))

    val JR = Output(Bool()) //DONE
    val jumpEnable = Output(Bool()) //DONE
    val memToReg = Output(Bool()) //DONE
    val memWrite = Output(Bool()) //DONE
    val ALUOpcode = Output(UInt(4.W)) //DONE
    val ALUSrc = Output(Bool()) //DONE
    val regWrite = Output(Bool()) //DONE
    val regDest = Output(Bool()) //DONE
    val stop = Output(Bool()) //DONE
  })

  io.ALUOpcode := "b0000".U
  io.JR := false.B
  io.jumpEnable := false.B
  io.ALUSrc := false.B
  io.regWrite := true.B //True for all except jumps
  io.memToReg := false.B
  io.memWrite := false.B
  io.regDest := false.B
  io.stop := false.B
  
  switch(io.opcode) {
    is("b000000".U) { //NOP
      io.regWrite := false.B
    }
    is("b000001".U) { //ADD
      io.ALUOpcode := "b0001".U
      io.regDest := true.B
    }
    is("b000010".U) { //SUB
      io.ALUOpcode := "b0010".U
      io.regDest := true.B
    }
    is("b000011".U) { //OR
      io.ALUOpcode := "b0011".U
      io.regDest := true.B
    }
    is("b000100".U) { //AND
      io.ALUOpcode := "b0100".U
      io.regDest := true.B
    }
    is("b000101".U) { //MUL
      io.ALUOpcode := "b0101".U
      io.regDest := true.B
    }
    is("b000110".U) { //ADDI
      io.ALUOpcode := "b0001".U
      io.ALUSrc := true.B
    }
    is("b000111".U) { //SUBI
      io.ALUOpcode := "b0010".U
      io.ALUSrc := true.B
    }
    is("b001000".U) { //MULI
      io.ALUOpcode := "b0101".U
      io.ALUSrc := true.B
    }
    is("b001001".U) { //LI
      io.ALUOpcode := "b0111".U
      io.ALUSrc := true.B
    }
    is("b001010".U) { //LD
      io.ALUOpcode := "b0110".U
      io.memToReg := true.B
    }
    is("b001011".U) { //SD
      io.ALUOpcode := "b0110".U
      io.memWrite := true.B
      io.regWrite := false.B
    }
    is("b001100".U) { //JR
      io.jumpEnable := true.B
      io.regWrite := false.B
      io.JR := true.B
    }
    is("b001101".U) { //JGT
      io.ALUOpcode := "b1000".U
      io.jumpEnable := true.B
      io.regWrite := false.B
    }
    is("b001110".U) { //JNEQ
      io.ALUOpcode := "b1001".U
      io.jumpEnable := true.B
      io.regWrite := false.B
    }
    is("b001111".U) { //JEQ
      io.ALUOpcode := "b0010".U
      io.jumpEnable := true.B
      io.regWrite := false.B
    }
    is("b010000".U) { //END
      io.stop := true.B
    }
  }



}