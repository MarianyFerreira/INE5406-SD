library ieee;
use ieee.std_logic_1164.all;

entity decod is
port (inC1, inC2,inC3: in std_logic;
		outDecod: out std_logic_vector(6 downto 0)
	 );
end decod;

architecture ARCH of decod is

	signal sel : std_logic_vector (2 downto 0);
	
	begin
	
		sel <= inC1 & inC2 & inC3;
	
	 	outDecod <= "0001001" when sel = "000" else -- H
			    "0000110" when sel = "001" else -- E
		            "1000111" when sel = "010" else -- L
		            "1000000" when sel = "011" else -- O
			    "1111111";
end ARCH;
