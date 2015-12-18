library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- aluに関連する型の情報はcommon.vhdにあるのでそちらを参照のこと。
library work;
use work.common.all;

entity alu is

  port (
    alu_in  : in  alu_in_t;
    alu_out : out alu_out_t);

end entity alu;


architecture behavior of alu is
begin

  -- 非同期回路は入力が変化した時に逐次的に実行される。
  -- この場合はalu_inをsensitivity listに入れておく。
  cmb: process (alu_in) is

    -- 一回のプロセス文実行でsignal代入が起きないとラッチが発生する可能性があるので
    -- 必ず何らかの値(don't careでもいい)を出力としてsignalに代入する必要がある。
    -- default_outputはそのデフォルト値。レコードのおかげで簡潔に書ける。
    constant default_output : alu_out_t := (
      data => (others => '-'));

    -- プロセス文の中で同じsignalに複数回代入するとエラーになる(multiple drivers)。
    -- variableは複数回代入しても大丈夫なのでalu_out_t型のvariableを用意して
    -- それに出力を突っこんでいきprocess文の最後でシグナルに代入するということをする。
    -- このvariableの初期値は先ほどのdefault_outputになる。ただしvariableは
    -- 「process文実行毎に初期化されるわけではなく」「シミュレーション開始時だけ初期化される」
    -- 点に注意。だからprocess文の最初に初期値を設定しないといけない。さもないとラッチが生える。
    variable o : alu_out_t := default_output;

  begin

    -- 先に述べた理由で出力を最初にデフォルト値に代入する。
    o := default_output;

    -- ここがaluが行う処理のロジック。入力はalu_in、出力はoに与える(alu_outではない!)
    -- oはvariableだから読み出すこともできるのだが行儀が良くない気がする。好みの問題かもしれない
    case alu_in.op is
      when ALU_OP_ADD => o.data := alu_in.data1 + alu_in.data2;
      when ALU_OP_SUB => o.data := alu_in.data1 - alu_in.data2;
    end case;

    -- そんでもって最後にoをalu_outに代入。
    alu_out <= o;

  end process;

end architecture behavior;
