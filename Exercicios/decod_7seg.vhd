library ieee;
use ieee.std_logic_1164.all;

entity Controlador_decod is
	port (  A: in std_logic_vector (3 downto 0);
		F: out std_logic_vector(6 downto 0)
      	);
end Controlador_decod;

architecture ARCH of Controlador_decod is
	begin
		   F <= "1000000" when A = "0000" else -- 0 x '30'
			"1111001" when A = "0001" else -- 1
			"0100100" when A = "0010" else -- 2
			"0110000" when A = "0011" else -- 3
			"0011001" when A = "0100" else -- 4
			"0010010" when A = "0101" else -- 5
			"0000010" when A = "0110" else -- 6
			"1011000" when A = "0111" else -- 7
			"0000000" when A = "1000" else -- 8
			"0011000" when A = "1001" else -- 9 x'39'
			"0001000" when A	= "1010" else -- A x'41'
			"0000011" when A = "1011" else -- B
			"1000110" when A = "1100" else -- C
			"0100001" when A = "1101" else -- D
			"0000110" when A = "1110" else -- E
			"0001110" when A = "1111" else -- F x'46'
			"1111111";
end ARCH;
