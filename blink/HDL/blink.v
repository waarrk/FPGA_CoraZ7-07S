/* ���o�̓��W���[�����` */
module blink (
    input           CLK,
    input           RST,
    output  [1:0]   LED
);

/* reg���� 25bit���W�X�^��錾 */
reg [24:0] cnt25;

/* always���@���W�X�^�^���g���K�Ƃ��Č�̕��������� ���������ƕ��񓮍�*/
/* posedge�i�����オ��G�b�W�jnegedge�i����������G�b�W�j*/
/* <= �m���u���b�L���O��� ���ꂼ��̍s�̑���������Ɏ��s�����*/
always @( posedge CLK )
    begin
        if ( RST ) // RST == 1
            cnt25 <= 25'h0; //cnt25���W�X�^��25bit��h(16�i)0����
        else
            cnt25 <= cnt25 + 1'h1; //cnt25���W�X�^���J�E���g�A�b�v
    end

/* �_����1�s�ŋL�q�ł�����̂�assign�����g�� */
assign LED[0] = ~cnt25[24];
assign LED[1] =  cnt25[24]; //cnt25�̍ō��ʃr�b�g��1

endmodule