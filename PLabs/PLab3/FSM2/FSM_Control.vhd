library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.std_logic_unsigned.ALL;

entity FSM_Control is
-- FSM para a Part IV
 port(-- Entradas		
		CLOCK: in std_logic;
		RST: in std_logic;
		
		W0, W1: in std_logic;
		
		-- Saidas
		
		count: out  std_logic_vector(3 downto 0);
		State: out std_logic_vector(3 downto 0)
);  
end FSM_Control; 

--------------------------------------------------------------------------

architecture ARCH of FSM_Control is

	type STATES is (E1, E2, E3, E4);
	
	signal EA, PE : STATES;
	signal W : std_logic_vector (1 downto 0);
	signal countA: std_logic_vector(3 downto 0);
	
	begin
	
	W <= W0 & W1;
		
		-- Logica de Clock e reset para os estados
		process(CLOCK, RST)
			begin
				if RST = '0' then
					EA <= E1;

				elsif rising_edge(CLOCK) then
					EA <= PE;
				end if;
		end process;

		-- Logica de proximo estado
		process(EA, W)
			
			begin
				case EA is
					when E1 =>
																	
						countA <= "0000";
						State <= "0001";
						
						if (W = "00") then PE <= EA;
						
						elsif (W = "01") then PE <= E2;
						
						elsif (W = "10") then PE <= E3;
						
						elsif (W = "11") then PE <= E4;
						
						else PE <= E1;
						
						end if;		
				
					when E2 =>

						countA <= std_logic_vector(unsigned(countA) + 1);
						State <= "0010";
						
						if (W = "11") then PE <= E4;
						
						else PE <= E1;	
						end if;						
				
					when E3 =>
				
						countA <= std_logic_vector(unsigned(countA) + 2);
						State <= "0011";
						
						if (W = "11") then PE <= E4;
						
						else PE <= E1;
						end if;					
					
					when E4 =>
						
						if (countA = "0000") then
							countA <= "0000";
							State <= "0100";
						
						else
							countA <= std_logic_vector(unsigned(countA) -1);
						end if;
					
			end case;
 end process;
						count <= countA;
end ARCH;