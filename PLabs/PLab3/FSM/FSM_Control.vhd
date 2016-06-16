library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.std_logic_unsigned.ALL;

entity FSM_Control is
-- FSM para a Part I
 port(-- Entradas		
		CLOCK: in std_logic;
		RST: in std_logic;
		
		W: in std_logic;
		
		-- Saidas
		
		Z: out std_logic;
		State: out std_logic_vector(8 downto 0)
);  
end FSM_Control; 

--------------------------------------------------------------------------

architecture ARCH of FSM_Control is

	type STATES is (A, B, C, D, E, F, G, H, I);
	
	signal EA, PE : STATES;
	
	begin
		-- Logica de Clock e reset para os estados
		process(CLOCK, RST)
			begin
				if RST = '0' then
					EA <= A;

				elsif rising_edge(CLOCK) then
					EA <= PE;
				end if;
		end process;

		-- Logica de proximo estado
		process(EA, W)
			
			begin
				case EA is
				when A =>
						
						Z <= '0';
						State <= "000000000";
						-- State <= "000000001";
						
						if (W = '0') then PE <= B;
						else PE <= F;
						end if;
				
				when B =>

						Z <= '0';
						-- State <= "000000010";
						State <= "000000011";
						
						if (W = '0') then PE <= C;
						else PE <= F;
						end if;
				
				when C =>
				
						Z <= '0';
						-- State <= "000000100";
						State <= "000000101";

						
						if (W = '0') then PE <= D;
						else PE <= F;
						end if;						
					
				when D =>

						Z <= '0';
						-- State <= "000001000";
						State <= "000001001";
						
						if (W = '0') then PE <= E;
						else PE <= F;
						end if;
					
				when E =>
				
						Z <= '1';
						-- State <= "000010000";
						State <= "000010001";
						
						if (W = '0') then PE <= E;
						else PE <= F;
						end if;
					
				when F =>
				
						Z <= '0';
						-- State <= "000100000";
						State <= "000100001";
						
						if (W = '1') then PE <= G;
						else PE <= B;
						end if;
				
				when G =>
				
						Z <= '0';
						-- State <= "001000000";
						State <= "001000001";
						
						if (W = '1') then PE <= H;
						else PE <= B;
						end if;
						
				when H =>
				
						Z <= '0';
						-- State <= "010000000";
						State <= "010000001";
						
						if (W = '1') then PE <= I;
						else PE <= B;
						end if;
						
				when I =>
				
						Z <= '1';
						-- State <= "100000000";
						State <= "100000001";
						
						if (W = '1') then PE <= I;
						else PE <= B;
						end if;
			end case;
			
 end process;
						
end ARCH;