/* Copyright(C) 2020 Cobac.Net All Rights Reserved. */
/* chapter: ��3��                          */
/* project: pattern                        */
/* outline: �p�^�[���\����H�̃e�X�g�x���` */

module pattern_tb;

/* �N���b�N������Sim�N���b�N�����` */
localparam STEP = 8;
localparam CLKNUM = (800*525+12000)*5;

/* �ڑ��M���̐錾 */
reg             CLK;
reg             RST;
wire    [7:0]   VGA_R,  VGA_G,  VGA_B;
wire            VGA_HS, VGA_VS, VGA_DE;
wire            PCK;

/* �p�^�[���\����H��ڑ� */
pattern pattern(
    .CLK    (CLK),
    .RST    (RST),
    .VGA_R  (VGA_R),
    .VGA_G  (VGA_G),
    .VGA_B  (VGA_B),
    .VGA_HS (VGA_HS),
    .VGA_VS (VGA_VS),
    .VGA_DE (VGA_DE),
    .PCK    (PCK)
);

/* �N���b�N�̐��� */
always begin
    CLK = 0; #(STEP/2);
    CLK = 1; #(STEP/2);
end

/* ���ؑΏۂւ̓��͂��쐬 */
initial begin
                RST = 0;
    #(STEP*600) RST = 1;
    #(STEP*20)  RST = 0;
    #(STEP*CLKNUM);
    $stop;
end

endmodule
