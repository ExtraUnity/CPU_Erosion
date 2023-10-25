import chisel3._
import chisel3.util._

class RegisterFile extends Module {
  val io = IO(new Bundle {
    //Module Inputs
    val aSel = Input(UInt(5.W))
    val bSel = Input(UInt(5.W))
    val writeData = Input(UInt(32.W))
    val writeSel = Input(UInt(5.W))
    val writeEnable = Input(Bool())

    //Module Outputs
    val a = Output(UInt(32.W))
    val b = Output(UInt(32.W))

    //Array of 15 Register
    val registerFile = Reg(Vec(15, UInt(15.W)))
  })

  //Implement this module here
  when (writeEnable) {
    
    

  }
  

}