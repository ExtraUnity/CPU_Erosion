import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester

import java.util

class RegisterFileTester(dut: RegisterFile) extends PeekPokeTester(dut) {

        //Test case 1:
        poke(dut.io.aSel, "b00001".U)
        poke(dut.io.bSel, "b00002".U)
        poke(dut.io.writeEnable, true)
        poke(dut.io.writeData, ?)
        poke(dut.io.writeSel, ?)
        step(1)
        expect(d)

        // Test case 2:
        poke(dut.io.aSel, Reg(UInt(5.W)))
        poke(dut.io.bSel, Reg(UInt(5.W)))
        poke(dut.io.writeEnable, false)
        poke(dut.io.)


        //TEST ADD
        poke(dut.io.operand1, 2)
        poke(dut.io.operand2,4)
        poke(dut.io.sel,"b001".U)
        step(1)
        expect(dut.io.result,6)

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