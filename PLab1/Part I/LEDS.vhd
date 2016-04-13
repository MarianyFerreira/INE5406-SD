LIBRARY ieee;
USE ieee.std_logic.1164.all;

- - Simple module that connects the SW switches to the LEDR lights
		
	ENTITY part1 IS PORT (
		SW   : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		LEDR : OUT  STD_LOGIC_VECTOR(17 DOWNTO 0)); -- red LEDs
	END part1;



ARCHITECTURE Behavior OF part1 IS

-- Inclusão dos componentes do Projeto

component multiplex2x1
    port(
        input0, input1: in std_logic_vector(7 downto 0);
        sel: in std_logic;
        output: out std_logic_vector(7 downto 0)
    );
end component;

component multiplex5x1
    port(
        input0, input1, input2, input3, input4 : in std_logic_vector(7 downto 0);
        sel: in std_logic_vector(2 downto 0);
        output: out std_logic_vector(7 downto 0)
    );
end component;


-- Declaração dos signals usados

	BEGIN
		-- Port map

			-- Parte II
		MUX2: multiplex2x1 port map( SW(7 downto 0), SW(15 downto 8), SW(17), LEDR (7 downto 0) );
			-- Parte III
		MUX5: multiplex5x1 port map(
			SW(2 downto 0),
			SW(5 downto 3),
			SW(8 downto 6), 
			SW(11 downto 9),
			SW(14 downto 12),

			SW(17 downto 15),

			LEDR (0 downto 14),
			LEDR (14 downto 17));


	
	END Behavior