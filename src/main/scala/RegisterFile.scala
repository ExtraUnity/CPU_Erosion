import chisel3._
import chisel3.util._

class RegisterFile extends Module {
  val io = IO(new Bundle {
    //Module Inputs
    val readReg1 = Input(UInt(5.W))
    val readReg2 = Input(UInt(5.W))
    val regWrite = Input(Bool())
    val writeData = Input(UInt(32.W))
    val writeReg = Input(UInt(5.W))

    //Module Outputs
    val readData1 = Output(UInt(32.W))
    val readData2 = Output(UInt(32.W))


  })
      //Array of 16 Register
    val registerFile = Reg(Vec(16, UInt(32.W)))
  //Implement this module here
  io.readData1 := registerFile(io.readReg1)
  io.readData2 := registerFile(io.readReg2)
  when (io.regWrite) {
    registerFile(io.writeReg) := io.writeData
  }

}