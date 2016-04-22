-- Make a circuit that counts how many consecutive zeros are in the left entered (INPT) of 4 bits.
-- The output (outp) must have 3 bits and show the number of zeros to the left of the entrance.

entity cont_zeros_esq is
	port(
    	inpt: in std_logic_vector(3 downto 0);
    	outp: out std_logic_vector(2 downto 0)
    );
end entity;

architecture arch of cont_zeros_esq is

    signal cont std_logic_vector(2 downto 0);

begin

	cont <= "000";

	for indice in 3 downto 0 loop
		
		if (inpt(indice) = '0') then

			cont <= std_logic_vector(unsigned(cont) + 1);

		end if;
	
	end loop;

	outp <= cont;

and arch;


