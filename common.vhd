library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package common is

  -------------------------------------------------------------------------------
  -- ALU(alu.vhd)
  --   * 入出力をレコードにまとめる
  --   * process文だけで非同期処理を書く
  -------------------------------------------------------------------------------

  -- enumは便利
  type alu_op_t is (
    ALU_OP_ADD,
    ALU_OP_SUB,
    ALU_OP_AND,
    ALU_OP_OR,
    ALU_OP_NOT,
    ALU_OP_EQ);

  -- IOをレコードにまとめると以下の点で便利
  -- * process文のsensitivity listにalu_inだけ入れればいい
  --   - 後で入出力を変更した時に変更が必要な箇所を減らせる
  -- * シグナルが何由来かがわかりやすい
  -- * 代入をまとめて行なえる
  -- (重要)入出力ポートにネストしたレコードを使うとxstがinternal error
  -- を起こすことが知られているので避けるように。
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
