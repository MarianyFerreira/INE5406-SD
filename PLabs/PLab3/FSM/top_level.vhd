library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.std_logic_unsigned.ALL;

entity top_level is
-- top_level
 port(-- Entradas		
		KEY: in std_logic_vector (3 downto 0);		-- Clock
		
		SW: in std_logic_vector (1 downto 0);	-- Reset -- Entrada W
		
		-- Saidas
		
		LEDG: out std_logic_vector (1 downto 0);
		LEDR : out std_logic_vector (8 downto 0)
		
);  
end top_level; 

--------------------------------------------------------------------------

architecture ARCH of top_level is

component FSM_Control -- FSM para a Part I
 port(	
		CLOCK: in std_logic;
		RST: in std_logic;
		
		W: in std_logic;
		
		-- Saidas
		Z: out std_logic;
		State: out std_logic_vector(8 downto 0)
		);  
end component; 
	
	begin

	FSM_PartI : FSM_Control port map (KEY(0), SW(0), SW(1), LEDG(0), LEDR (8 downto 0));

end ARCH;
