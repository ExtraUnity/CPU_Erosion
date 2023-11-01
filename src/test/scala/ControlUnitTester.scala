import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester

import java.util

class ControlUnitTester(dut: ControlUnit) extends PeekPokeTester(dut) {

    //Testing ADD
    // poke(dut.io.opcode,"b000001".U)
    // step(1)
    // expect(dut.io.ALUOpcode, "b001".U)
    // expect(dut.io.regDest, true.B)
    
    // //Testing SUB
    // poke(dut.io.opcode,"b000010".U)
    // step(1)
    // expect(dut.io.ALUOpcode, "b010".U)
    // expect(dut.io.regDest, true.B)

    // //Testing OR
    // poke(dut.io.opcode,"b000011".U)
    // step(1)
    // expect(dut.io.ALUOpcode, "b011".U)
    // expect(dut.io.regDest, true.B)

    // //Testing AND
    // poke(dut.io.opcode,"b000100".U)
    // step(1)
    // expect(dut.io.ALUOpcode, "b100".U)
    // expect(dut.io.regDest, true.B)

    // //TESTING MUL
    // poke(dut.io.opcode,"b000101".U)
    // step(1)
    // expect(dut.io.ALUOpcode, "b101".U)
    // expect(dut.io.regDest, true.B)

    // //TESTING ADDI
    // poke(dut.io.opcode,"b000110".U)
    // step(1)
    // expect(dut.io.ALUOpcode, "b001".U)
    // expect(dut.io.ALUSrc, true.B)

    // //TESTING SUBI
    // poke(dut.io.opcode,"b000111".U)
    // step(1)
    // expect(dut.io.ALUOpcode, "b010".U)
    // expect(dut.io.ALUSrc, true.B)

    // //TESTING MULI
    // poke(dut.io.opcode,"b001000".U)
    // step(1)
    // expect(dut.io.ALUOpcode, "b101".U)
    // expect(dut.io.ALUSrc, true.B)

    // //TESTING LI
    // poke(dut.io.opcode,"b001001".U)
    // step(1)
    // expect(dut.io.ALUSrc, true.B)
    // expect(dut.io.memToReg, true.B)
    // expect(dut.io.memRead, true.B)

    // //TESTING LD
    // poke(dut.io.opcode,"b001010".U)
    // step(1)
    // expect(dut.io.memToReg, true.B)
    // expect(dut.io.memRead, true.B)

    // //TESTING SD
    // poke(dut.io.opcode,"b001011".U)
    // step(1)
    // expect(dut.io.memWrite, true.B)

    // //TESTING JR
    // poke(dut.io.opcode,"b001100".U)
    // step(1)
    // expect(dut.io.jumpEnable, true.B)
    // expect(dut.io.regWrite, false.B)
    // expect(dut.io.JR, true.B)

    // //TESTING OTHER JUMPS
    // poke(dut.io.opcode,"b001101".U)
    // step(1)
    // expect(dut.io.jumpEnable, true.B)
    // expect(dut.io.regWrite, false.B)

    // poke(dut.io.opcode,"b001110".U)
    // step(1)
    // expect(dut.io.jumpEnable, true.B)
    // expect(dut.io.regWrite, false.B)

    // poke(dut.io.opcode,"b001111".U)
    // step(1)
    // expect(dut.io.jumpEnable, true.B)
    // expect(dut.io.regWrite, false.B)


}

object ControlUnitTester {
  def main(args: Array[String]): Unit = {
    println("Testing Control Unit")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "Control Unit"),
      () => new ControlUnit()) {
      c => new ControlUnitTester(c)
    }
  }
}