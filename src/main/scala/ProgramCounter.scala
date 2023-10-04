import chisel3._
import chisel3.util._

class ProgramCounter extends Module {
  val io = IO(new Bundle {
    val stop = Input(Bool())
    val jump = Input(Bool())
    val run = Input(Bool())
    val programCounterJump = Input(UInt(16.W))
    val programCounter = Output(UInt(16.W))
  })

  //Implement this module here (respect the provided interface, since it used by the tester)

  val finReg = RegInit(0.U(16.W))

  finReg := Mux(io.stop || (!io.run), finReg, Mux(io.jump, io.programCounterJump, finReg + 1.U))
  io.programCounter := finReg

  //io.programCounter := Mux(io.stop || (!io.run), finReg, Mux(io.jump, io.programCounterJump, finReg + 1.U))

}
