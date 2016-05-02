LIBRARY ieee;
USE ieee.std_logic_1164.all;
		
entity plab1 is
port (
	SW   : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
	HEX0  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
     );
end plab1;

architecture Behavior of plab1 is

component multiplex2x1
    port(
        input0, input1: in std_logic_vector(7 downto 0);
        sel: in std_logic;
        output: out std_logic_vector(7 downto 0)
	 );
end component;

component multiplex5x1
    port(
        input0, input1, input2, input3, input4 : in std_logic_vector(2 downto 0);
        sel: in std_logic_vector(2 downto 0);
        output: out std_logic_vector(2 downto 0)
    	);
end component;

component decod
     port(	
	inC1, inC2,inC3: in std_logic;
	outDecod: out std_logic_vector(6 downto 0)
	 );
end component;

	signal M : std_logic_vector(2 downto 0);

BEGIN
		-- Port map
		-- Parte I
		-- LEDR <= SW;
		
		-- Parte II
		-- MUX2: multiplex2x1 port map( SW(7 downto 0), SW(15 downto 8), SW(17), LEDR (7 downto 0) );
		
		-- Parte III
		-- MUX5: multiplex5x1 port map(SW(2 downto 0), SW(5 downto 3), SW(8 downto 6), SW(11 downto 9), SW(14 downto 12), SW(17 downto 15), M);
		
		-- Parte IV
		-- DECODIFICADOR: decod port map(SW(0), SW(1), SW(2), HEX0(6 downto 0));
		
		-- Parte V
		MUX5: multiplex5x1 port map(SW(2 downto 0), SW(5 downto 3), SW(8 downto 6), SW(11 downto 9), SW(14 downto 12), SW(17 downto 15), M);
		DECODIFICADOR: decod port map(M(0), M(1), M(2), HEX(6 downto 0));
		
END Behavior;
