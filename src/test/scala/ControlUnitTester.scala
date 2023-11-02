import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester

import java.util

class ControlUnitTester(dut: ControlUnit) extends PeekPokeTester(dut) {

    //TESTING NOP
    poke(dut.io.opcode,"b000000".U)
    step(1)
    expect(dut.io.regWrite, false.B)

    //Testing ADD
    poke(dut.io.opcode,"b000001".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0001".U)
    expect(dut.io.regDest, true.B)
    
    //Testing SUB
    poke(dut.io.opcode,"b000010".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0010".U)
    expect(dut.io.regDest, true.B)

    //Testing OR
    poke(dut.io.opcode,"b000011".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0011".U)
    expect(dut.io.regDest, true.B)

    //Testing AND
    poke(dut.io.opcode,"b000100".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0100".U)
    expect(dut.io.regDest, true.B)

    //TESTING MUL
    poke(dut.io.opcode,"b000101".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0101".U)
    expect(dut.io.regDest, true.B)

    //TESTING ADDI
    poke(dut.io.opcode,"b000110".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0001".U)
    expect(dut.io.ALUSrc, true.B)

    //TESTING SUBI
    poke(dut.io.opcode,"b000111".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0010".U)
    expect(dut.io.ALUSrc, true.B)

    //TESTING MULI
    poke(dut.io.opcode,"b001000".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0101".U)
    expect(dut.io.ALUSrc, true.B)

    //TESTING LI
    poke(dut.io.opcode,"b001001".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0111".U)
    expect(dut.io.ALUSrc, true.B)

    //TESTING LD
    poke(dut.io.opcode,"b001010".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0110".U)
    expect(dut.io.memToReg, true.B)

    //TESTING SD
    poke(dut.io.opcode,"b001011".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0111".U)
    expect(dut.io.memWrite, true.B)
    expect(dut.io.regWrite, false.B)

    //TESTING JR
    poke(dut.io.opcode,"b001100".U)
    step(1)
    expect(dut.io.jumpEnable, true.B)
    expect(dut.io.regWrite, false.B)
    expect(dut.io.JR, true.B)

    //TESTING JGT
    poke(dut.io.opcode,"b001101".U)
    step(1)
    expect(dut.io.ALUOpcode, "b1000".U)
    expect(dut.io.jumpEnable, true.B)
    expect(dut.io.regWrite, false.B)

    //TESTING JNEQ
    poke(dut.io.opcode,"b001110".U)
    step(1)
    expect(dut.io.ALUOpcode, "b1001".U)
    expect(dut.io.jumpEnable, true.B)
    expect(dut.io.regWrite, false.B)

    //TESTING JEQ
    poke(dut.io.opcode,"b001111".U)
    step(1)
    expect(dut.io.ALUOpcode, "b0010".U)
    expect(dut.io.jumpEnable, true.B)
    expect(dut.io.regWrite, false.B)

    //TESTING END
    poke(dut.io.opcode,"b010000".U)
    step(1)
    expect(dut.io.stop, true.B)


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