LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY toplevel IS
	PORT(
		SW : in std_logic_vector (17 downto 0);
		KEY : in std_logic_vector (3 downto 0);
		
		HEX0, HEX1, HEX4, HEX5, HEX6, HEX7  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		LEDG : out std_logic_vector (7 downto 0);
		LEDR : out std_logic_vector (17 downto 0)
	);
END toplevel;

ARCHITECTURE behavior of toplevel is

	component ramlpm
		PORT(
			address  : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END component;
	
	signal data_mem : std_logic_vector (7 downto 0);
	
		
	Begin
	
	mem_map: ramlpm port map (SW(15 downto 11), KEY(0), SW(7 downto 0), SW(17), data_mem);	
	
	LEDG(0) <= SW(17);						  								  -- wren
	HEX7 & HEX6 <= (others => '0' & SW(15 downto 11));		  -- address
	HEX5 & HEX4 <= (others => '0' & data_mem(7 downto 0));	  -- input
	HEX1 & HEX0 <= (others => '0' & data_mem);					  -- output mem
	
	end;