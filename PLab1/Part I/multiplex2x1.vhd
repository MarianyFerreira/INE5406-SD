library ieee;
use ieee.std_logic_1164.all;

entity multiplex2x1 is
    port(
        input0, input1: in std_logic_vector(7 downto 0);
        sel: in std_logic;
        output: out std_logic_vector(7 downto 0)
    );
end;

architecture arch of multiplex2x1 is
begin
    output <= input0 when sel = '0' else
    input1;
    
end arch;