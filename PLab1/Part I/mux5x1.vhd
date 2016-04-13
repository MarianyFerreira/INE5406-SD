library ieee;
use ieee.std_logic_1164.all;

entity multiplex5x1 is
    port(
        input0, input1, input2, input3, input4 : in std_logic_vector(7 downto 0);
        sel: in std_logic_vector(2 downto 0);
        output: out std_logic_vector(7 downto 0)
    );
end;

architecture arch of multiplex2x1 is
begin
    output <= input0 when sel = '000' else
    input1;

    	 outDecod <= input0 when sel = "000" else 	-- U
					 input1 when sel = "001" else 	-- V
					 input2 when sel = "010" else 	-- W
					 input3 when sel = "011" else 	-- X
					 input4;						-- y

    
end arch;
