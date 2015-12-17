library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.common.all;

entity alu is

  port (
    alu_in  : in  alu_in_t;
    alu_out : out alu_out_t);

end entity alu;


architecture behavior of alu is

  constant default_output : alu_out_t := (
    data => (others => '-'));

begin

  cmb: process (alu_in) is

    variable o : alu_out_t := default_output;

  begin

    o := default_output;

    case alu_in.op is
      when ALU_OP_ADD => o.data := alu_in.data1 + alu_in.data2;
      when ALU_OP_SUB => o.data := alu_in.data1 - alu_in.data2;
    end case;

    alu_out <= o;

  end process;

end architecture behavior;
