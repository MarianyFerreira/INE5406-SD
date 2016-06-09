LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY mem IS
	PORT (
		clock: IN STD_LOGIC  := '1';
		data: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
		wraddress: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren: IN STD_LOGIC  := '0';
		q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END mem;

ARCHITECTURE SYN OF mem IS

	SIGNAL sub_wire0: STD_LOGIC_VECTOR (15 DOWNTO 0);

COMPONENT altsyncram
	GENERIC (
		address_reg_b: STRING;
		clock_enable_input_a: STRING;
		clock_enable_input_b: STRING;
		clock_enable_output_a: STRING;
		clock_enable_output_b: STRING;
		init_file: STRING;
		init_file_layout: STRING;
		intended_device_family: STRING;
		lpm_type: STRING;
		numwords_a: NATURAL;
		numwords_b: NATURAL;
		operation_mode: STRING;
		outdata_aclr_b: STRING;
		outdata_reg_b: STRING;
		power_up_uninitialized: STRING;
		read_during_write_mode_mixed_ports: STRING;
		widthad_a: NATURAL;
		widthad_b: NATURAL;
		width_a: NATURAL;
		width_b: NATURAL;
		width_byteena_a: NATURAL
	);
	PORT (
			address_a: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			clock0: IN STD_LOGIC ;
			data_a: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			q_b: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			wren_a: IN STD_LOGIC ;
			address_b: IN STD_LOGIC_VECTOR (14 DOWNTO 0)
	);
END COMPONENT;

BEGIN
	q <= sub_wire0(15 DOWNTO 0);

	altsyncram_component : altsyncram
	GENERIC MAP (
		address_reg_b => "CLOCK0",
		clock_enable_input_a => "BYPASS",
		clock_enable_input_b => "BYPASS",
		clock_enable_output_a => "BYPASS",
		clock_enable_output_b => "BYPASS",
		init_file => "../odd-giant-rubber-duck.mif",
		init_file_layout => "PORT_B",
		intended_device_family => "Cyclone II",
		lpm_type => "altsyncram",
		numwords_a => 50688,
		numwords_b => 25344,
		operation_mode => "DUAL_PORT",
		outdata_aclr_b => "NONE",
		outdata_reg_b => "UNREGISTERED",
		power_up_uninitialized => "FALSE",
		read_during_write_mode_mixed_ports => "OLD_DATA",
		widthad_a => 16,
		widthad_b => 15,
		width_a => 8,
		width_b => 16,
		width_byteena_a => 1
	)
	PORT MAP (address_a => wraddress, clock0 => clock, data_a => data, wren_a => wren, address_b => rdaddress, q_b => sub_wire0);

END SYN;