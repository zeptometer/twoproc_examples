library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package common is

  -------------------------------------------------------------------------------
  -- ALU
  -------------------------------------------------------------------------------

  type alu_op_t is (
    ALU_OP_ADD,
    ALU_OP_SUB,
    ALU_OP_AND,
    ALU_OP_OR,
    ALU_OP_NOT,
    ALU_OP_EQ);

  type alu_in_t is record
    op    : alu_op_t;
    data1 : unsigned(31 downto 0);
    data2 : unsigned(31 downto 0);
  end record alu_in_t;

  type alu_out_t is record
    data : unsigned(31 downto 0);
  end record alu_out_t;

  component alu is
    port (
      alu_in  : in  alu_in_t;
      alu_out : out alu_out_t);
  end component alu;

end package common;
