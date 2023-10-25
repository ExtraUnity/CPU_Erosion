import chisel3._
import chisel3.util._

class ControlUnit extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val opcode = Input(UInt(6.W))

    val jumpEnable = Output(Bool()) //DONE
    val memToReg = Output(Bool()) //DONE
    val memRead = Output(Bool()) //DONE
    val memWrite = Output(Bool()) //DONE
    val ALUOpcode = Output(UInt(3.W)) //DONE
    val ALUSrc = Output(Bool()) //DONE
    val regWrite = Ouput(Bool()) //DONE
    val regDest = Output(Bool()) //DONE
    val stop = Output(Bool()) //DONE
  })

  io.ALUOpcode := "b000".U
  io.branch := false.B
  io.ALUSrc := false.B
  io.RegWrite := true.B //True for all except jumps
  io.memToReg := false.B
  io.memRead := false.B
  io.memWrite := false.B
  io.regDest := false.B
  
  switch(io.opcode) {
    is("b000001".U) { //ADD
      io.ALUOpcode := "b001".U
      io.regDest := true.B
    }
    is("b000010".U) { //SUB
      io.ALUOpcode := "b010".U
      io.regDest := true.B
    }
    is("b000011".U) { //OR
      io.ALUOpcode := "b011".U
      io.regDest := true.B
    }
    is("b000100".U) { //AND
      io.ALUOpcode := "b100".U
      io.regDest := true.B
    }
    is("b000101".U) { //MUL
      io.ALUOpcode := "b101".U
      io.regDest := true.B
    }
    is("b000110".U) { //ADDI
      io.ALUOpcode := "b001".U
      io.ALUSrc := true.B
    }
    is("b000111".U) { //SUBI
      io.ALUOpcode := "b010".U
      io.ALUSrc := true.B
    }
    is("b001000".U) { //MULI
      io.ALUOpcode := "b101".U
      io.ALUSrc := true.B
    }
    is("b001001".U) { //LI
      io.ALUSrc := true.B
      io.memToReg := true.B
      io.memRead := true.B
    }
    is("b001010".U) { //LD
      io.memToReg := true.B
      io.memRead := true.B
    }
    is("b001011".U) { //SD
      io.memWrite := true.B
    }
    is("b001100".U || "b001101".U || "b001110".U || "b001111".U ||) { //Jumps
      io.jumpEnable := true.B
      io.regWrite := false.B
    }
    is("b010000".U) { //END
      io.stop := true.B
    }
  }



}