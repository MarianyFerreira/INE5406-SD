-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "06/16/2016 02:49:23"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_level IS
    PORT (
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(2 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0)
	);
END top_level;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[1]	=>  Location: PIN_V23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[2]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[3]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[4]	=>  Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[5]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[6]	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[0]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[1]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[2]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[3]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[4]	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[5]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[6]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SW[1]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF top_level IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL \KEY[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SW[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \FSM_PartIV|Selector2~4_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector3~1_combout\ : std_logic;
SIGNAL \FSM_PartIV|Add0~0_combout\ : std_logic;
SIGNAL \FSM_PartIV|Equal2~0_combout\ : std_logic;
SIGNAL \SW[0]~clkctrl_outclk\ : std_logic;
SIGNAL \FSM_PartIV|Equal0~0_combout\ : std_logic;
SIGNAL \FSM_PartIV|EA.E4~regout\ : std_logic;
SIGNAL \FSM_PartIV|EA.E1~feeder_combout\ : std_logic;
SIGNAL \FSM_PartIV|EA.E1~regout\ : std_logic;
SIGNAL \FSMstate_decod|F[0]~0_combout\ : std_logic;
SIGNAL \KEY[0]~clkctrl_outclk\ : std_logic;
SIGNAL \FSM_PartIV|Equal2~1_combout\ : std_logic;
SIGNAL \FSM_PartIV|EA.E2~regout\ : std_logic;
SIGNAL \FSM_PartIV|Equal2~2_combout\ : std_logic;
SIGNAL \FSM_PartIV|EA.E3~regout\ : std_logic;
SIGNAL \FSMstate_decod|F[4]~1_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector2~1_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector3~0_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector3~2_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector3~3_combout\ : std_logic;
SIGNAL \FSMcount_decod|Equal9~0_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector1~0_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector2~2_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector2~3_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector2~0_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector2~5_combout\ : std_logic;
SIGNAL \FSM_PartIV|Add2~0_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector4~0_combout\ : std_logic;
SIGNAL \FSM_PartIV|Selector4~1_combout\ : std_logic;
SIGNAL \FSMcount_decod|F[0]~0_combout\ : std_logic;
SIGNAL \FSMcount_decod|F[1]~1_combout\ : std_logic;
SIGNAL \FSMcount_decod|F[2]~2_combout\ : std_logic;
SIGNAL \FSMcount_decod|F[3]~3_combout\ : std_logic;
SIGNAL \FSMcount_decod|F[4]~4_combout\ : std_logic;
SIGNAL \FSMcount_decod|F[5]~5_combout\ : std_logic;
SIGNAL \FSMcount_decod|F[6]~6_combout\ : std_logic;
SIGNAL \FSM_PartIV|countA\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SW~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \KEY~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_SW[0]~clkctrl_outclk\ : std_logic;
SIGNAL \FSMcount_decod|ALT_INV_F[5]~5_combout\ : std_logic;
SIGNAL \FSMstate_decod|ALT_INV_F[0]~0_combout\ : std_logic;
SIGNAL \FSM_PartIV|ALT_INV_EA.E4~regout\ : std_logic;
SIGNAL \FSM_PartIV|ALT_INV_EA.E1~regout\ : std_logic;

BEGIN

ww_KEY <= KEY;
ww_SW <= SW;
HEX2 <= ww_HEX2;
HEX0 <= ww_HEX0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\KEY[0]~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \KEY~combout\(0));

\SW[0]~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \SW~combout\(0));
\ALT_INV_SW[0]~clkctrl_outclk\ <= NOT \SW[0]~clkctrl_outclk\;
\FSMcount_decod|ALT_INV_F[5]~5_combout\ <= NOT \FSMcount_decod|F[5]~5_combout\;
\FSMstate_decod|ALT_INV_F[0]~0_combout\ <= NOT \FSMstate_decod|F[0]~0_combout\;
\FSM_PartIV|ALT_INV_EA.E4~regout\ <= NOT \FSM_PartIV|EA.E4~regout\;
\FSM_PartIV|ALT_INV_EA.E1~regout\ <= NOT \FSM_PartIV|EA.E1~regout\;

-- Location: LCCOMB_X18_Y35_N20
\FSM_PartIV|Selector2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector2~4_combout\ = (\FSM_PartIV|Selector2~5_combout\ & ((\FSM_PartIV|Selector4~1_combout\) # ((\FSM_PartIV|countA\(0)) # (\FSM_PartIV|Selector3~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector4~1_combout\,
	datab => \FSM_PartIV|Selector2~5_combout\,
	datac => \FSM_PartIV|countA\(0),
	datad => \FSM_PartIV|Selector3~3_combout\,
	combout => \FSM_PartIV|Selector2~4_combout\);

-- Location: LCCOMB_X17_Y35_N14
\FSM_PartIV|Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector3~1_combout\ = \FSM_PartIV|Selector4~1_combout\ $ (\FSM_PartIV|Selector3~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FSM_PartIV|Selector4~1_combout\,
	datac => \FSM_PartIV|Selector3~3_combout\,
	combout => \FSM_PartIV|Selector3~1_combout\);

-- Location: LCCOMB_X18_Y35_N10
\FSM_PartIV|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Add0~0_combout\ = \FSM_PartIV|Selector3~3_combout\ $ (((\FSM_PartIV|Selector4~1_combout\ & \FSM_PartIV|countA\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector4~1_combout\,
	datac => \FSM_PartIV|countA\(0),
	datad => \FSM_PartIV|Selector3~3_combout\,
	combout => \FSM_PartIV|Add0~0_combout\);

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SW(1),
	combout => \SW~combout\(1));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SW(2),
	combout => \SW~combout\(2));

-- Location: LCCOMB_X19_Y35_N16
\FSM_PartIV|Equal2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Equal2~0_combout\ = (\SW~combout\(1) & \SW~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \FSM_PartIV|Equal2~0_combout\);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SW(0),
	combout => \SW~combout\(0));

-- Location: CLKCTRL_G1
\SW[0]~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \SW[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \SW[0]~clkctrl_outclk\);

-- Location: LCCOMB_X19_Y35_N30
\FSM_PartIV|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Equal0~0_combout\ = (\SW~combout\(1)) # (\SW~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \FSM_PartIV|Equal0~0_combout\);

-- Location: LCFF_X18_Y35_N5
\FSM_PartIV|EA.E4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \KEY[0]~clkctrl_outclk\,
	sdata => \FSM_PartIV|Equal2~0_combout\,
	aclr => \ALT_INV_SW[0]~clkctrl_outclk\,
	sload => VCC,
	ena => \FSM_PartIV|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \FSM_PartIV|EA.E4~regout\);

-- Location: LCCOMB_X19_Y35_N0
\FSM_PartIV|EA.E1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|EA.E1~feeder_combout\ = \FSM_PartIV|Equal0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \FSM_PartIV|Equal0~0_combout\,
	combout => \FSM_PartIV|EA.E1~feeder_combout\);

-- Location: LCFF_X19_Y35_N1
\FSM_PartIV|EA.E1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \KEY[0]~clkctrl_outclk\,
	datain => \FSM_PartIV|EA.E1~feeder_combout\,
	aclr => \ALT_INV_SW[0]~clkctrl_outclk\,
	ena => \FSM_PartIV|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \FSM_PartIV|EA.E1~regout\);

-- Location: LCCOMB_X19_Y35_N2
\FSMstate_decod|F[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSMstate_decod|F[0]~0_combout\ = (!\FSM_PartIV|EA.E4~regout\ & \FSM_PartIV|EA.E1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|EA.E4~regout\,
	datad => \FSM_PartIV|EA.E1~regout\,
	combout => \FSMstate_decod|F[0]~0_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_KEY(0),
	combout => \KEY~combout\(0));

-- Location: CLKCTRL_G3
\KEY[0]~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \KEY[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \KEY[0]~clkctrl_outclk\);

-- Location: LCCOMB_X19_Y35_N14
\FSM_PartIV|Equal2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Equal2~1_combout\ = (\SW~combout\(1) & !\SW~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \FSM_PartIV|Equal2~1_combout\);

-- Location: LCFF_X18_Y35_N9
\FSM_PartIV|EA.E2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \KEY[0]~clkctrl_outclk\,
	sdata => \FSM_PartIV|Equal2~1_combout\,
	aclr => \ALT_INV_SW[0]~clkctrl_outclk\,
	sload => VCC,
	ena => \FSM_PartIV|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \FSM_PartIV|EA.E2~regout\);

-- Location: LCCOMB_X19_Y35_N8
\FSM_PartIV|Equal2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Equal2~2_combout\ = (!\SW~combout\(1) & \SW~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \FSM_PartIV|Equal2~2_combout\);

-- Location: LCFF_X18_Y35_N27
\FSM_PartIV|EA.E3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \KEY[0]~clkctrl_outclk\,
	sdata => \FSM_PartIV|Equal2~2_combout\,
	aclr => \ALT_INV_SW[0]~clkctrl_outclk\,
	sload => VCC,
	ena => \FSM_PartIV|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \FSM_PartIV|EA.E3~regout\);

-- Location: LCCOMB_X19_Y35_N12
\FSMstate_decod|F[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSMstate_decod|F[4]~1_combout\ = (\FSM_PartIV|EA.E3~regout\) # ((\FSM_PartIV|EA.E4~regout\) # (!\FSM_PartIV|EA.E1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FSM_PartIV|EA.E3~regout\,
	datac => \FSM_PartIV|EA.E4~regout\,
	datad => \FSM_PartIV|EA.E1~regout\,
	combout => \FSMstate_decod|F[4]~1_combout\);

-- Location: LCCOMB_X18_Y35_N12
\FSM_PartIV|Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector2~1_combout\ = (!\FSM_PartIV|EA.E3~regout\ & (\FSM_PartIV|EA.E2~regout\ & !\FSM_PartIV|EA.E4~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FSM_PartIV|EA.E3~regout\,
	datac => \FSM_PartIV|EA.E2~regout\,
	datad => \FSM_PartIV|EA.E4~regout\,
	combout => \FSM_PartIV|Selector2~1_combout\);

-- Location: LCCOMB_X18_Y35_N24
\FSM_PartIV|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector3~0_combout\ = (\FSM_PartIV|Selector4~1_combout\ & (((\FSM_PartIV|Selector3~3_combout\)))) # (!\FSM_PartIV|Selector4~1_combout\ & ((\FSM_PartIV|countA\(0) & ((\FSM_PartIV|Selector3~3_combout\))) # (!\FSM_PartIV|countA\(0) & 
-- (\FSM_PartIV|Selector2~5_combout\ & !\FSM_PartIV|Selector3~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector4~1_combout\,
	datab => \FSM_PartIV|countA\(0),
	datac => \FSM_PartIV|Selector2~5_combout\,
	datad => \FSM_PartIV|Selector3~3_combout\,
	combout => \FSM_PartIV|Selector3~0_combout\);

-- Location: LCCOMB_X18_Y35_N14
\FSM_PartIV|Selector3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector3~2_combout\ = (\FSM_PartIV|EA.E4~regout\ & (((\FSM_PartIV|Selector3~0_combout\)))) # (!\FSM_PartIV|EA.E4~regout\ & (\FSM_PartIV|Selector3~1_combout\ & (\FSM_PartIV|EA.E3~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector3~1_combout\,
	datab => \FSM_PartIV|EA.E3~regout\,
	datac => \FSM_PartIV|Selector3~0_combout\,
	datad => \FSM_PartIV|EA.E4~regout\,
	combout => \FSM_PartIV|Selector3~2_combout\);

-- Location: LCCOMB_X18_Y35_N30
\FSM_PartIV|Selector3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector3~3_combout\ = (\FSM_PartIV|Selector3~2_combout\) # ((\FSM_PartIV|Add0~0_combout\ & \FSM_PartIV|Selector2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Add0~0_combout\,
	datab => \FSM_PartIV|Selector3~2_combout\,
	datac => \FSM_PartIV|Selector2~1_combout\,
	combout => \FSM_PartIV|Selector3~3_combout\);

-- Location: LCCOMB_X18_Y35_N22
\FSMcount_decod|Equal9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSMcount_decod|Equal9~0_combout\ = (!\FSM_PartIV|Selector4~1_combout\ & (!\FSM_PartIV|Selector2~5_combout\ & (!\FSM_PartIV|countA\(0) & !\FSM_PartIV|Selector3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector4~1_combout\,
	datab => \FSM_PartIV|Selector2~5_combout\,
	datac => \FSM_PartIV|countA\(0),
	datad => \FSM_PartIV|Selector3~3_combout\,
	combout => \FSMcount_decod|Equal9~0_combout\);

-- Location: LCCOMB_X18_Y35_N0
\FSM_PartIV|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector1~0_combout\ = (!\FSM_PartIV|countA\(0) & ((\FSM_PartIV|EA.E2~regout\) # ((\FSM_PartIV|EA.E4~regout\ & !\FSMcount_decod|Equal9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|countA\(0),
	datab => \FSM_PartIV|EA.E4~regout\,
	datac => \FSM_PartIV|EA.E2~regout\,
	datad => \FSMcount_decod|Equal9~0_combout\,
	combout => \FSM_PartIV|Selector1~0_combout\);

-- Location: LCCOMB_X18_Y35_N2
\FSM_PartIV|countA[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|countA\(0) = (\FSM_PartIV|EA.E3~regout\ & (\FSM_PartIV|countA\(0))) # (!\FSM_PartIV|EA.E3~regout\ & ((\FSM_PartIV|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FSM_PartIV|EA.E3~regout\,
	datac => \FSM_PartIV|countA\(0),
	datad => \FSM_PartIV|Selector1~0_combout\,
	combout => \FSM_PartIV|countA\(0));

-- Location: LCCOMB_X18_Y35_N16
\FSM_PartIV|Selector2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector2~2_combout\ = (\FSM_PartIV|Selector4~1_combout\ & (\FSM_PartIV|countA\(0) & \FSM_PartIV|Selector3~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector4~1_combout\,
	datac => \FSM_PartIV|countA\(0),
	datad => \FSM_PartIV|Selector3~3_combout\,
	combout => \FSM_PartIV|Selector2~2_combout\);

-- Location: LCCOMB_X18_Y35_N18
\FSM_PartIV|Selector2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector2~3_combout\ = (\FSM_PartIV|Selector2~1_combout\ & (\FSM_PartIV|Selector2~5_combout\ $ (\FSM_PartIV|Selector2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FSM_PartIV|Selector2~1_combout\,
	datac => \FSM_PartIV|Selector2~5_combout\,
	datad => \FSM_PartIV|Selector2~2_combout\,
	combout => \FSM_PartIV|Selector2~3_combout\);

-- Location: LCCOMB_X18_Y35_N26
\FSM_PartIV|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector2~0_combout\ = (\FSM_PartIV|EA.E3~regout\ & (\FSM_PartIV|Selector2~5_combout\ $ (((\FSM_PartIV|Selector4~1_combout\ & \FSM_PartIV|Selector3~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector4~1_combout\,
	datab => \FSM_PartIV|Selector2~5_combout\,
	datac => \FSM_PartIV|EA.E3~regout\,
	datad => \FSM_PartIV|Selector3~3_combout\,
	combout => \FSM_PartIV|Selector2~0_combout\);

-- Location: LCCOMB_X18_Y35_N6
\FSM_PartIV|Selector2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector2~5_combout\ = (\FSM_PartIV|Selector2~3_combout\) # ((\FSM_PartIV|EA.E4~regout\ & (\FSM_PartIV|Selector2~4_combout\)) # (!\FSM_PartIV|EA.E4~regout\ & ((\FSM_PartIV|Selector2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector2~4_combout\,
	datab => \FSM_PartIV|Selector2~3_combout\,
	datac => \FSM_PartIV|Selector2~0_combout\,
	datad => \FSM_PartIV|EA.E4~regout\,
	combout => \FSM_PartIV|Selector2~5_combout\);

-- Location: LCCOMB_X18_Y35_N28
\FSM_PartIV|Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Add2~0_combout\ = \FSM_PartIV|countA\(0) $ (\FSM_PartIV|Selector4~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \FSM_PartIV|countA\(0),
	datad => \FSM_PartIV|Selector4~1_combout\,
	combout => \FSM_PartIV|Add2~0_combout\);

-- Location: LCCOMB_X18_Y35_N8
\FSM_PartIV|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector4~0_combout\ = (\FSM_PartIV|EA.E3~regout\ & (!\FSM_PartIV|Selector4~1_combout\)) # (!\FSM_PartIV|EA.E3~regout\ & (\FSM_PartIV|EA.E2~regout\ & (\FSM_PartIV|Selector4~1_combout\ $ (\FSM_PartIV|countA\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector4~1_combout\,
	datab => \FSM_PartIV|countA\(0),
	datac => \FSM_PartIV|EA.E2~regout\,
	datad => \FSM_PartIV|EA.E3~regout\,
	combout => \FSM_PartIV|Selector4~0_combout\);

-- Location: LCCOMB_X18_Y35_N4
\FSM_PartIV|Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSM_PartIV|Selector4~1_combout\ = (\FSM_PartIV|EA.E4~regout\ & (!\FSMcount_decod|Equal9~0_combout\ & (!\FSM_PartIV|Add2~0_combout\))) # (!\FSM_PartIV|EA.E4~regout\ & (((\FSM_PartIV|Selector4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSMcount_decod|Equal9~0_combout\,
	datab => \FSM_PartIV|Add2~0_combout\,
	datac => \FSM_PartIV|EA.E4~regout\,
	datad => \FSM_PartIV|Selector4~0_combout\,
	combout => \FSM_PartIV|Selector4~1_combout\);

-- Location: LCCOMB_X17_Y35_N20
\FSMcount_decod|F[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSMcount_decod|F[0]~0_combout\ = (\FSM_PartIV|Selector4~1_combout\ & (\FSM_PartIV|Selector2~5_combout\)) # (!\FSM_PartIV|Selector4~1_combout\ & (\FSM_PartIV|Selector3~3_combout\ $ (((!\FSM_PartIV|Selector2~5_combout\ & \FSM_PartIV|countA\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector2~5_combout\,
	datab => \FSM_PartIV|Selector4~1_combout\,
	datac => \FSM_PartIV|Selector3~3_combout\,
	datad => \FSM_PartIV|countA\(0),
	combout => \FSMcount_decod|F[0]~0_combout\);

-- Location: LCCOMB_X17_Y35_N10
\FSMcount_decod|F[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSMcount_decod|F[1]~1_combout\ = (\FSM_PartIV|Selector2~5_combout\ & ((\FSM_PartIV|Selector4~1_combout\) # ((\FSM_PartIV|Selector3~3_combout\)))) # (!\FSM_PartIV|Selector2~5_combout\ & (\FSM_PartIV|Selector3~3_combout\ & (\FSM_PartIV|Selector4~1_combout\ 
-- $ (\FSM_PartIV|countA\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector2~5_combout\,
	datab => \FSM_PartIV|Selector4~1_combout\,
	datac => \FSM_PartIV|Selector3~3_combout\,
	datad => \FSM_PartIV|countA\(0),
	combout => \FSMcount_decod|F[1]~1_combout\);

-- Location: LCCOMB_X17_Y35_N28
\FSMcount_decod|F[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSMcount_decod|F[2]~2_combout\ = (\FSM_PartIV|Selector3~3_combout\ & (\FSM_PartIV|Selector2~5_combout\)) # (!\FSM_PartIV|Selector3~3_combout\ & (\FSM_PartIV|Selector4~1_combout\ & ((\FSM_PartIV|Selector2~5_combout\) # (!\FSM_PartIV|countA\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector2~5_combout\,
	datab => \FSM_PartIV|Selector4~1_combout\,
	datac => \FSM_PartIV|Selector3~3_combout\,
	datad => \FSM_PartIV|countA\(0),
	combout => \FSMcount_decod|F[2]~2_combout\);

-- Location: LCCOMB_X17_Y35_N22
\FSMcount_decod|F[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSMcount_decod|F[3]~3_combout\ = (\FSM_PartIV|Selector3~3_combout\ & ((\FSM_PartIV|Selector2~5_combout\) # (\FSM_PartIV|Selector4~1_combout\ $ (!\FSM_PartIV|countA\(0))))) # (!\FSM_PartIV|Selector3~3_combout\ & ((\FSM_PartIV|Selector4~1_combout\ & 
-- (\FSM_PartIV|Selector2~5_combout\)) # (!\FSM_PartIV|Selector4~1_combout\ & ((\FSM_PartIV|countA\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector2~5_combout\,
	datab => \FSM_PartIV|Selector4~1_combout\,
	datac => \FSM_PartIV|Selector3~3_combout\,
	datad => \FSM_PartIV|countA\(0),
	combout => \FSMcount_decod|F[3]~3_combout\);

-- Location: LCCOMB_X17_Y35_N0
\FSMcount_decod|F[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSMcount_decod|F[4]~4_combout\ = (\FSM_PartIV|countA\(0)) # ((\FSM_PartIV|Selector4~1_combout\ & (\FSM_PartIV|Selector2~5_combout\)) # (!\FSM_PartIV|Selector4~1_combout\ & ((\FSM_PartIV|Selector3~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector2~5_combout\,
	datab => \FSM_PartIV|Selector4~1_combout\,
	datac => \FSM_PartIV|Selector3~3_combout\,
	datad => \FSM_PartIV|countA\(0),
	combout => \FSMcount_decod|F[4]~4_combout\);

-- Location: LCCOMB_X17_Y35_N18
\FSMcount_decod|F[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSMcount_decod|F[5]~5_combout\ = (\FSM_PartIV|Selector3~3_combout\ & (!\FSM_PartIV|Selector2~5_combout\)) # (!\FSM_PartIV|Selector3~3_combout\ & (!\FSM_PartIV|Selector4~1_combout\ & ((\FSM_PartIV|Selector2~5_combout\) # (!\FSM_PartIV|countA\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001001010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector2~5_combout\,
	datab => \FSM_PartIV|Selector4~1_combout\,
	datac => \FSM_PartIV|Selector3~3_combout\,
	datad => \FSM_PartIV|countA\(0),
	combout => \FSMcount_decod|F[5]~5_combout\);

-- Location: LCCOMB_X17_Y35_N12
\FSMcount_decod|F[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \FSMcount_decod|F[6]~6_combout\ = (\FSM_PartIV|Selector4~1_combout\ & ((\FSM_PartIV|Selector2~5_combout\) # ((\FSM_PartIV|Selector3~3_combout\ & \FSM_PartIV|countA\(0))))) # (!\FSM_PartIV|Selector4~1_combout\ & (\FSM_PartIV|Selector2~5_combout\ $ 
-- ((!\FSM_PartIV|Selector3~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FSM_PartIV|Selector2~5_combout\,
	datab => \FSM_PartIV|Selector4~1_combout\,
	datac => \FSM_PartIV|Selector3~3_combout\,
	datad => \FSM_PartIV|countA\(0),
	combout => \FSMcount_decod|F[6]~6_combout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_KEY(1));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_KEY(2));

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_KEY(3));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSMstate_decod|ALT_INV_F[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(0));

-- Location: PIN_V23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(1));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSM_PartIV|EA.E2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(2));

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSMstate_decod|ALT_INV_F[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(3));

-- Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSMstate_decod|F[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(4));

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSM_PartIV|ALT_INV_EA.E4~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(5));

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSM_PartIV|ALT_INV_EA.E1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(6));

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSMcount_decod|F[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(0));

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSMcount_decod|F[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(1));

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSMcount_decod|F[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(2));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSMcount_decod|F[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(3));

-- Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSMcount_decod|F[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(4));

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSMcount_decod|ALT_INV_F[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(5));

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \FSMcount_decod|F[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(6));
END structure;


