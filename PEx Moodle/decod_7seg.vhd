-- Exercicio feito em sala de aula

-- Fazer um decodificador de 7 segmentos (LEDR) que posibilite a impressão de números de 0 a 9 e de letras de A a F.

library ieee;
use ieee.std_logic_1164.all;

entity decod_7seg is
	port (  input: in std_logic_vector (3 downto 0);
		output: out std_logic_vector(6 downto 0)
      	);
end decod_7seg;

architecture ARCH of decod_7seg is
	begin
		   output <= "1000000" when input = "0000" else -- 0 x '30'
			"1111001" when input = "0001" else -- 1
			"0100100" when input = "0010" else -- 2
			"0110000" when input = "0011" else -- 3
			"0011001" when input = "0100" else -- 4
			"0010010" when input = "0101" else -- 5
			"0000010" when input = "0110" else -- 6
			"1011000" when input = "0111" else -- 7
			"0000000" when input = "1000" else -- 8
			"0011000" when input = "1001" else -- 9 x'39'
			"0001000" when input = "1010" else -- A x'41'
			"0000011" when input = "1011" else -- B
			"1000110" when input = "1100" else -- C
			"0100001" when input = "1101" else -- D
			"0000110" when input = "1110" else -- E
			"0001110" when input = "1111" else -- F x'46'
			"1111111";
end ARCH;
