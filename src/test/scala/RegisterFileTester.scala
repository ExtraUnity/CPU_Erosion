import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester

import java.util

class RegisterFileTester(dut: RegisterFile) extends PeekPokeTester(dut) {

        //Test case 1:
        poke(dut.io.readReg1, "b00001".U)
        poke(dut.io.readReg2, "b00010".U)
        poke(dut.io.regWrite, true.B)
        poke(dut.io.writeData, 20.U)
        poke(dut.io.writeReg, "b00001".U)
        step(1)
        expect(dut.io.readData1, 20.U)
        expect(dut.io.readData2, 0.U)
        
        //Test case 1:
        poke(dut.io.readReg1, "b00001".U)
        poke(dut.io.readReg2, "b00010".U)
        poke(dut.io.regWrite, false.B)
        poke(dut.io.writeData, 21.U)
        poke(dut.io.writeReg, "b00001".U)
        step(1)
        expect(dut.io.readData1, 20.U)
        expect(dut.io.readData2, 0.U)
        

}

object RegisterFileTester {
  def main(args: Array[String]): Unit = {
    println("Testing RegisterFile")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "RegisterFile"),
      () => new RegisterFile()) {
      c => new RegisterFileTester(c)
    }
  }
}