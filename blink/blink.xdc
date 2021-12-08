#クロック信号
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { CLK }];
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { CLK }];

#リセット信号
set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS33   PULLDOWN TRUE } \
                    [get_ports { RST }]; #user_dio[1]

#LED
# LD0 RGB - N15 - G17 - L15
# LD1 RGB - M15 - L14 - G14
# IO規格の時はIOSTANDARD ピン番号の時はPACKAGE_PIN
# LVCMOS33 FPGAのIO規格の指定　電圧とか
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]; #LED0_B
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]; #LED1_B