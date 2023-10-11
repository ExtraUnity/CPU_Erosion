;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ALU : 
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip operand1 : SInt<32>, flip operand2 : SInt<32>, flip sel : UInt<3>, result : SInt<32>, compResult : UInt<1>}
    
    reg reg : SInt<32>, clock with : (reset => (reset, asSInt(UInt<32>("h00")))) @[ALU.scala 24:20]
    node _T = eq(UInt<1>("h01"), io.sel) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      node _T_1 = add(io.operand1, io.operand2) @[ALU.scala 29:26]
      node _T_2 = tail(_T_1, 1) @[ALU.scala 29:26]
      node _T_3 = asSInt(_T_2) @[ALU.scala 29:26]
      reg <= _T_3 @[ALU.scala 29:11]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_4 = eq(UInt<2>("h02"), io.sel) @[Conditional.scala 37:30]
      when _T_4 : @[Conditional.scala 39:67]
        node _T_5 = sub(io.operand1, io.operand2) @[ALU.scala 32:26]
        node _T_6 = tail(_T_5, 1) @[ALU.scala 32:26]
        node _T_7 = asSInt(_T_6) @[ALU.scala 32:26]
        reg <= _T_7 @[ALU.scala 32:11]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_8 = eq(UInt<2>("h03"), io.sel) @[Conditional.scala 37:30]
        when _T_8 : @[Conditional.scala 39:67]
          node _T_9 = or(io.operand1, io.operand2) @[ALU.scala 35:26]
          node _T_10 = asSInt(_T_9) @[ALU.scala 35:26]
          reg <= _T_10 @[ALU.scala 35:11]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_11 = eq(UInt<3>("h04"), io.sel) @[Conditional.scala 37:30]
          when _T_11 : @[Conditional.scala 39:67]
            node _T_12 = and(io.operand1, io.operand2) @[ALU.scala 38:26]
            node _T_13 = asSInt(_T_12) @[ALU.scala 38:26]
            reg <= _T_13 @[ALU.scala 38:11]
            skip @[Conditional.scala 39:67]
    io.result <= reg @[ALU.scala 41:13]
    node _T_14 = eq(io.result, asSInt(UInt<1>("h00"))) @[ALU.scala 42:29]
    io.compResult <= _T_14 @[ALU.scala 42:17]
    
