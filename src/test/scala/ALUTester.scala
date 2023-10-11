import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester

import java.util

class ALUTester(dut: ALU) extends PeekPokeTester(dut) {

        //TEST ADD
        poke(dut.io.operand1,2)
        poke(dut.io.operand2,4)
        poke(dut.io.sel,"b001".U)
        step(1)
        expect(dut.io.result,6)


        //TEST SUB
        poke(dut.io.operand1,2)
        poke(dut.io.operand2,4)
        poke(dut.io.sel,"b010".U)
        step(1)
        expect(dut.io.result,-2)

        //TEST OR
        poke(dut.io.operand1,"b001".U)
        poke(dut.io.operand2,"b011".U)
        poke(dut.io.sel,"b011".U)
        step(1)
        expect(dut.io.result,"b011".U)

        //TEST OR
        poke(dut.io.operand1,"b001".U)
        poke(dut.io.operand2,"b011".U)
        poke(dut.io.sel,"b100".U)
        step(1)
        expect(dut.io.result,"b001".U)

        //TEST MULT
        poke(dut.io.operand1,5)
        poke(dut.io.operand2,4)
        poke(dut.io.sel,"b101".U)
        step(1)
        expect(dut.io.result,20)
}

object ALUTester {
  def main(args: Array[String]): Unit = {
    println("Testing ALU")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "ALU"),
      () => new ALU()) {
      c => new ALUTester(c)
    }
  }
}