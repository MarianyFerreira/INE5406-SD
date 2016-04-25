-- Make a circuit that counts how many consecutive zeros are in the left entered (INPT) of 4 bits.
-- The output (outp) must have 3 bits and show the number of zeros to the left of the entrance.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont_zeros_esq is
	port(
    	inpt: in std_logic_vector(3 downto 0);
    	outp: out std_logic_vector(2 downto 0)
    );
end entity;

architecture arch of cont_zeros_esq is


begin
	signal val : std_logic := '1';

	process (inpt)

		begin

		for indice in 3 downto 0 loop					-- for que decrementa indice = 3 >>> 0
		
			if (inpt(indice) = '0') then				-- se o vator no indice (3, 2, 1, 0) tiver zeros

				outp <= std_logic_vector(unsigned(outp) + unsigned(val));	-- soma 1 ao cont

			end if;
	
		end loop;

	end process;

end arch;


