;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit RegisterFile : 
  module RegisterFile : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip readReg1 : UInt<5>, flip readReg2 : UInt<5>, flip regWrite : UInt<1>, flip writeData : UInt<32>, flip writeReg : UInt<5>, readData1 : UInt<32>, readData2 : UInt<32>}
    
    reg registerFile : UInt<32>[16], clock @[RegisterFile.scala 20:27]
    node _T = bits(io.readReg1, 3, 0)
    io.readData1 <= registerFile[_T] @[RegisterFile.scala 22:16]
    node _T_1 = bits(io.readReg2, 3, 0)
    io.readData2 <= registerFile[_T_1] @[RegisterFile.scala 23:16]
    when io.regWrite : @[RegisterFile.scala 24:22]
      node _T_2 = bits(io.writeReg, 3, 0)
      registerFile[_T_2] <= io.writeData @[RegisterFile.scala 25:31]
      skip @[RegisterFile.scala 24:22]
    
