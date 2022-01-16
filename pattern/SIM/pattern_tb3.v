/* Copyright(C) 2020 Cobac.Net All Rights Reserved.        */
/* chapter: ��3��                                          */
/* project: pattern                                        */
/* outline: �p�^�[���\����H�̃^�C�~���O���ؗp�e�X�g�x���` */
/*          Cora Z7�p                                      */

`timescale 1ns/1fs

module pattern_tb3;

/* �N���b�N������Sim�N���b�N�����` */
localparam STEP = 8;
localparam CLKNUM = (800*525+12000)*5;

/* �ڑ��M���̐錾 */
reg             CLK;
reg             RST;
wire    [3:0]   VGA_R,  VGA_G,  VGA_B;
wire            VGA_HS, VGA_VS;

/* �p�^�[���\����H�̍ŏ�ʊK�w��ڑ� */
pattern_vga pattern_vga(
    .CLK    (CLK),
    .RST    (RST),
    .VGA_R  (VGA_R),
    .VGA_G  (VGA_G),
    .VGA_B  (VGA_B),
    .VGA_HS (VGA_HS),
    .VGA_VS (VGA_VS)
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
