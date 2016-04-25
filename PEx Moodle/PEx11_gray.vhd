-- Write a VHDL code that describes a circuit that has two inputs (inpt0 and inpt1)
-- of 4-bit gray code and an output (outp) of 4 bits. The output should be a minimum
-- number of transitions in gray code necessary to get the number in inpt0 to the
-- number in inpt1 (either increasing or decreasing the number of gray code).
-- For example: being inpt0 = "0101" and inpt1 = "1111", the output should be "0100"
-- (4 in binary) as they are needed 4 transitions to go from 0101 to 1111
-- (0101 -> 0100 -> 1100 -> 1101 -> 1111).

entity graycode_dist is
	generic(width: integer := 4);

	port(
		inpt0: in std_logic_vector(width-1 downto 0);
		inpt1: in std_logic_vector(width-1 downto 0);
		outp: out std_logic_vector(width-1 downto 0)
	);
end entity;

architecture arch of graycode_dist is

begin

    Não consegui resolver, não encontrei uma forma de achar as distâncias sem ser fazendo cada uma a mão e atribuindo um incide a elas, tipo:

			'0000' tem indice = 0
			'0001' tem indice = 1
			'0011' tem indice = 2
			'0010' tem indice = 3   etc

	Ai eu vejo qual o indice e subtraio pra saber quanto um indice é maior do que o outro.

	Mas acredito que tem um jeito melhor.

		se input0 = 0000 e input1 = 0010 então

		se indice0 < indice1 então

		resultado = indice1 - indice0;

		se não 
			
		resultado = indice0 - indice1;

end arch;
