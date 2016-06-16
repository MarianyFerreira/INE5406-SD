library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.std_logic_unsigned.ALL;

entity top_level is
-- top_level
 port(-- Entradas		
		KEY: in std_logic_vector (3 downto 0);		-- Clock
		
		SW: in std_logic_vector (2 downto 0);	-- Reset -- Entrada W1 W0
		
		-- Saidas
		
		HEX2 : out std_logic_vector (6 downto 0);	-- estado
		HEX0 : out std_logic_vector (6 downto 0)	-- count
		
);  
end top_level; 

--------------------------------------------------------------------------

architecture ARCH of top_level is
	
	SIGNAL count_decod, states_decod: std_logic_vector (3 downto 0);

component FSM_Control -- FSM para a Part IV
 port(	
		CLOCK: in std_logic;
		RST: in std_logic;
		
		W0, W1: in std_logic;
		
		-- Saidas
		count: out  std_logic_vector(3 downto 0);
		state: out std_logic_vector(3 downto 0)
		);  
end component;

component decod
	port (  A: in std_logic_vector (3 downto 0);
			  F: out std_logic_vector(6 downto 0)
      	);
end component;
	
	begin

	FSM_PartIV : FSM_Control port map (KEY(0), SW(0), SW(2), SW(1), count_decod, states_decod);
	
	FSMcount_decod  : decod port map (count_decod, HEX0);
	FSMstate_decod  : decod port map (states_decod, HEX2);

end ARCH;
