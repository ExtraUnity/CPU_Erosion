;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ProgramCounter : 
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip stop : UInt<1>, flip jump : UInt<1>, flip run : UInt<1>, flip programCounterJump : UInt<16>, programCounter : UInt<16>}
    
    reg finReg : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[ProgramCounter.scala 15:23]
    node _T = eq(io.run, UInt<1>("h00")) @[ProgramCounter.scala 17:29]
    node _T_1 = or(io.stop, _T) @[ProgramCounter.scala 17:25]
    node _T_2 = add(finReg, UInt<1>("h01")) @[ProgramCounter.scala 17:90]
    node _T_3 = tail(_T_2, 1) @[ProgramCounter.scala 17:90]
    node _T_4 = mux(io.jump, io.programCounterJump, _T_3) @[ProgramCounter.scala 17:50]
    node _T_5 = mux(_T_1, finReg, _T_4) @[ProgramCounter.scala 17:16]
    finReg <= _T_5 @[ProgramCounter.scala 17:10]
    io.programCounter <= finReg @[ProgramCounter.scala 18:21]
    
