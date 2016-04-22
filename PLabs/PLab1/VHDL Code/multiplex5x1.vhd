library ieee;
use ieee.std_logic_1164.all;

entity multiplex5x1 is
    port(
        input0, input1, input2, input3, input4 : in std_logic_vector(2 downto 0);
        sel: in std_logic_vector(2 downto 0);
        output: out std_logic_vector(2 downto 0)
    );
end;

architecture arch of multiplex5x1 is
begin
    output <= 	input0 when sel = "000" else 
		        input1 when sel = "001" else 	
		        input2 when sel = "010" else 	
		        input3 when sel = "011" else 	
		        input4;									
end arch;
