import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester

import java.util

class RegisterFileTester(dut: RegisterFile) extends PeekPokeTester(dut) {

        // Test case 0 - Check if all registers by default is 0 (trivial test case)
        poke(dut.io.readReg1, "b00001".U)
        poke(dut.io.readReg2, "b00010".U)
        poke(dut.io.regWrite, true.B)
        step(1)
        expect(dut.io.readData1, 0.U)
        expect(dut.io.readData2, 0.U)
        step(1)
        poke(dut.io.regWrite, false.B)
        step(1)
        expect(dut.io.readData1, 0.U)
        expect(dut.io.readData2, 0.U)


        //Test case 1 - Write Enabled: Expects write 20 to first register, and the other register is by default 0:
        poke(dut.io.readReg1, "b00001".U)
        poke(dut.io.readReg2, "b00010".U)
        poke(dut.io.regWrite, true.B)
        poke(dut.io.writeData, 20.U)
        poke(dut.io.writeReg, "b00001".U)
        step(1)
        expect(dut.io.readData1, 20.U)
        expect(dut.io.readData2, 0.U)

        //Test case 2 - Write Enabled: Expects write 10 to second register, and the other register is still 20:
        poke(dut.io.readReg1, "b00001".U)
        poke(dut.io.readReg2, "b00010".U)
        poke(dut.io.regWrite, true.B)
        poke(dut.io.writeData, 10.U)
        poke(dut.io.writeReg, "b00010".U)
        step(1)
        expect(dut.io.readData1, 20.U)
        expect(dut.io.readData2, 10.U)


        //Test case 3 - Write Enabled: Expects changes in both registers, write 6 and 7 to register 1 and 2, respectively:
        poke(dut.io.readReg1, "b00001".U)
        poke(dut.io.readReg2, "b00010".U)
        poke(dut.io.regWrite, true.B)
        poke(dut.io.writeData, 6.U)
        poke(dut.io.writeReg, "b00001".U)
        step(1)
        poke(dut.io.writeData, 7.U)
        poke(dut.io.writeReg, "b00010".U)
        step(1)
        expect(dut.io.readData1, 6.U)
        expect(dut.io.readData2, 7.U)
        

        //Test case 4 - Write disabled: Expects no write or changes (R1, R2 is still 6 and 7, respectively)
        poke(dut.io.readReg1, "b00001".U)
        poke(dut.io.readReg2, "b00010".U)
        poke(dut.io.regWrite, false.B)
        poke(dut.io.writeData, 12.U)
        poke(dut.io.writeReg, "b00001".U)
        step(1)
        poke(dut.io.writeData, 14.U)
        poke(dut.io.writeReg, "b00010".U)
        step(1)
        expect(dut.io.readData1, 6.U)
        expect(dut.io.readData2, 7.U)



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