import chisel3._
import chisel3.util._

class CPUTop extends Module {
  val io = IO(new Bundle {
    val done = Output(Bool ())
    val run = Input(Bool ())
    //This signals are used by the tester for loading and dumping the memory content, do not touch
    val testerDataMemEnable = Input(Bool ())
    val testerDataMemAddress = Input(UInt (16.W))
    val testerDataMemDataRead = Output(UInt (32.W))
    val testerDataMemWriteEnable = Input(Bool ())
    val testerDataMemDataWrite = Input(UInt (32.W))
    //This signals are used by the tester for loading and dumping the memory content, do not touch
    val testerProgMemEnable = Input(Bool ())
    val testerProgMemAddress = Input(UInt (16.W))
    val testerProgMemDataRead = Output(UInt (32.W))
    val testerProgMemWriteEnable = Input(Bool ())
    val testerProgMemDataWrite = Input(UInt (32.W))
  })

  //Creating components
  val programCounter = Module(new ProgramCounter())
  val dataMemory = Module(new DataMemory())
  val programMemory = Module(new ProgramMemory())
  val registerFile = Module(new RegisterFile())
  val controlUnit = Module(new ControlUnit())
  val alu = Module(new ALU())

  //ProgramCounter
  programCounter.io.run := io.run
  programCounter.io.stop := controlUnit.io.stop
  programCounter.io.jump := controlUnit.io.JR || (controlUnit.io.jumpEnable && alu.io.compResult)
  programCounter.io.programCounterJump := programMemory.io.instructionRead(15,0)
  





  //ProgramMemory
  programMemory.io.address := programCounter.io.programCounter


  //ControlUnit
  controlUnit.io.opcode := programMemory.io.instructionRead(31,26)
  

  //RegisterFile
  registerFile.io.writeReg := programMemory.io.instructionRead(25,21)
  registerFile.io.readReg1 := programMemory.io.instructionRead(20,16)
  registerFile.io.readReg2 := Mux(controlUnit.io.regDest, programMemory.io.instructionRead(15,11), programMemory.io.instructionRead(25,21))
  registerFile.io.writeData := Mux(controlUnit.io.memToReg, dataMemory.io.dataRead.asSInt(), alu.io.result).asUInt() 
  registerFile.io.regWrite := controlUnit.io.regWrite

  //ALU
  alu.io.operand1 := registerFile.io.readData1.asSInt()
  alu.io.operand2 := Mux(controlUnit.io.ALUSrc, programMemory.io.instructionRead(15,0) | 0.U(32.W), registerFile.io.readData2).asSInt
  alu.io.sel := controlUnit.io.ALUOpcode

  //DataMemory
  dataMemory.io.address := alu.io.result.asUInt
  dataMemory.io.dataWrite := registerFile.io.readData1
  dataMemory.io.writeEnable := controlUnit.io.memWrite


  //DONE
  io.done := controlUnit.io.stop

  //This signals are used by the tester for loading the program to the program memory, do not touch
  programMemory.io.testerAddress := io.testerProgMemAddress
  io.testerProgMemDataRead := programMemory.io.testerDataRead
  programMemory.io.testerDataWrite := io.testerProgMemDataWrite
  programMemory.io.testerEnable := io.testerProgMemEnable
  programMemory.io.testerWriteEnable := io.testerProgMemWriteEnable
  //This signals are used by the tester for loading and dumping the data memory content, do not touch
  dataMemory.io.testerAddress := io.testerDataMemAddress
  io.testerDataMemDataRead := dataMemory.io.testerDataRead
  dataMemory.io.testerDataWrite := io.testerDataMemDataWrite
  dataMemory.io.testerEnable := io.testerDataMemEnable
  dataMemory.io.testerWriteEnable := io.testerDataMemWriteEnable
}