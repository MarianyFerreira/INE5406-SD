transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Henrique/VHDL_Projects/Delay_audio/db {D:/Henrique/VHDL_Projects/Delay_audio/db/pll1_altpll.v}
vlog -vlog01compat -work work +incdir+D:/Henrique/VHDL_Projects/Delay_audio/db {D:/Henrique/VHDL_Projects/Delay_audio/db/pll2_altpll.v}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/TESTE_LCD.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/RESET_DELAY.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/LCD_CONTROLADOR.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/I2C_Controller.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/DISPLAY7SEG.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/delayCounter.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/Controla_delay.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/audio_codec_controller.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/Delay_audio.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/FIFO_test.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/PLL1.vhd}
vcom -93 -work work {D:/Henrique/VHDL_Projects/Delay_audio/PLL2.vhd}

