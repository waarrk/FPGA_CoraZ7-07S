/* Copyright(C) 2020 Cobac.Net All Rights Reserved.   */
/* chapter: ��3��                                     */
/* project: pattern                                   */
/* outline: �p�^�[���\����H��Sim���ʂ��t�@�C���ɏo�� */

module pattern_tb2;

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

integer fd;  /* �t�@�C���ϐ� */

/* ���ؑΏۂւ̓��͂��쐬 */
initial begin
                RST = 0;
    fd = $fopen("imagedata.raw", "wb");
    #(STEP*600) RST = 1;
    #(STEP*20)  RST = 0;
    #(STEP*CLKNUM);
    $fclose(fd);
    $stop;
end

/* �t�@�C���o�� */
always @(posedge PCK) begin
    if ( VGA_DE ) begin
        $fwrite(fd, "%c", VGA_R);
        $fwrite(fd, "%c", VGA_G);
        $fwrite(fd, "%c", VGA_B);
    end
end

endmodule
