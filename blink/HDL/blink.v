/* 入出力モジュールを定義 */
module blink (
    input           CLK,
    input           RST,
    output  [1:0]   LED
);

/* reg文で 25bitレジスタを宣言 */
reg [24:0] cnt25;

/* always文　レジスタ型をトリガとして後の文順次処理 複数書くと並列動作*/
/* posedge（立ち上がりエッジ）negedge（立ち下がりエッジ）*/
/* <= ノンブロッキング代入 それぞれの行の代入が同時に実行される*/
always @( posedge CLK )
    begin
        if ( RST ) // RST == 1
            cnt25 <= 25'h0; //cnt25レジスタに25bitのh(16進)0を代入
        else
            cnt25 <= cnt25 + 1'h1; //cnt25レジスタをカウントアップ
    end

/* 論理式1行で記述できるものはassign文を使う */
assign LED[0] = ~cnt25[24];
assign LED[1] =  cnt25[24]; //cnt25の最高位ビットが1

endmodule