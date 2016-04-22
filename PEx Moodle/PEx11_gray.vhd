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
