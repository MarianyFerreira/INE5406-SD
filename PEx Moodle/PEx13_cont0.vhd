-- Make a circuit that counts how many consecutive zeros are in the left entered (INPT) of 4 bits.
-- The output (outp) must have 3 bits and show the number of zeros to the left of the entrance.

entity cont_zeros_esq is
	port(
    	inpt: in std_logic_vector(3 downto 0);
    	outp: out std_logic_vector(2 downto 0)
    );
end entity;

architecture arch of cont_zeros_esq is

    signal cont : std_logic_vector(2 downto 0) := "000";		-- Signal pra contar quantos zeros a esquerda tem
    signal inputS: std_logic_vector(3 downto 0);			-- Signal que recebe a entrada inpt


begin

	inputS <= inpt;							-- atribuição do inpt no int

	for indice in 3 downto 0 loop					-- for que decrementa indice = 3 >>> 0
		
		if (inputS(indice) = '0') then				-- se o vator no indice (3, 2, 1, 0) tiver zeros

			cont <= std_logic_vector(unsigned(cont) + 1);	-- soma 1 ao cont

		end if;
	
	end loop;

	outp <= cont;							-- saida recebe o valor da quantidade de zeros

and arch;


