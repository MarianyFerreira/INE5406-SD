library ieee;
use ieee.std_logic_1164.all;

entity decod is
	port (  A: in std_logic_vector (3 downto 0);
			  F: out std_logic_vector(6 downto 0)
      	);
end decod;

architecture ARCH of decod is
	begin
		   F <=
			"1000000" when A = "0000" else -- 0 x '30'
			"1111001" when A = "0001" else -- 1
			"0100100" when A = "0010" else -- 2
			"0110000" when A = "0011" else -- 3
			"0011001" when A = "0100" else -- 4
			"0010010" when A = "0101" else -- 5
			"0000010" when A = "0110" else -- 6
			"1011000" when A = "0111" else -- 7
			"0000000" when A = "1000" else -- 8
			"0011000" when A = "1001" else -- 9
			"1111111";
end ARCH;