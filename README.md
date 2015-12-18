# Modern VHDL with twoproc
## 目的
twoprocはVHDLのコーディングスタイルの一つです。これがどういうものかについては以下のページで解説されています。

* [A Strucctured VHDL Design Method](https://www.google.co.jp/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0ahUKEwjkq8K9hO3JAhXBMKYKHWwtBtkQFggiMAE&url=http%3A%2F%2Fwww.gaisler.com%2Fdoc%2Fstructdes.pdf&usg=AFQjCNGRNWXkIDXbdBE28U5aTm8ACqi0uQ&sig2=dpdUOLqdFJtnLJxdazrWAQ)
  - これが初出？
* [twoprocの書き方](http://wasabiz.hatenablog.com/entry/2015/03/18/173921)

twoprocの中心となるアイデアは

* VHDLの書き方を制限することでVHDLの「闇」を極力避けるくる
* 逐次実行文だけでロジックを記述するようにすることでソフトウェアプログラマに馴染みのあるコードを書く/読む
* レコードを積極的に使うことでコードの見通しをよくする

というものです。ここでは実際にtwoprocで書いたVHDLのコードを示し、「どういう理由でこういうコードになるのか」あるいは「どういう書き方ができるか」ということを説明していく予定です。

## 構成
以下の順で見ていけばtwoprocがどういうものかわかることが期待されます。全然書けてませんすみません

* common.vhd
  - 他の全てのコンポーネントの情報について
  - 目次として使って
* alu.vhd
  - 入出力をレコードにまとめる
  - 非同期process文の使い方
* TODO
  - ラッチをつくる(twoproc)
  - combinational loopを作らない
  - パイプライン処理
  - デバッグプリント
