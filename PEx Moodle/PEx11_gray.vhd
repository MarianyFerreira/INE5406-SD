-- Write a VHDL code that describes a circuit that has two inputs (inpt0 and inpt1)
-- of 4-bit gray code and an output (outp) of 4 bits. The output should be a minimum
-- number of transitions in gray code necessary to get the number in inpt0 to the
-- number in inpt1 (either increasing or decreasing the number of gray code).
-- For example: being inpt0 = "0101" and inpt1 = "1111", the output should be "0100"
-- (4 in binary) as they are needed 4 transitions to go from 0101 to 1111
-- (0101 -> 0100 -> 1100 -> 1101 -> 1111).
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity graycode_dist is

	generic(width: integer := 4);

	port(
		inpt0: in std_logic_vector(width-1 downto 0);
		inpt1: in std_logic_vector(width-1 downto 0);
		outp: out std_logic_vector(width-1 downto 0)
	);
end entity;

architecture arch of graycode_dist is

	 signal binary0 : std_logic_vector(width-1 downto 0);
	 signal binary1 : std_logic_vector(width-1 downto 0);
	 signal sig14 : std_logic_vector(width-1 downto 0) :="1110";


	-- verify distances option 2
	 --signal binary0Minor : std_logic_vector(width-1 downto 0);
	 --signal binary0Major : std_logic_vector(width-1 downto 0);

begin
	-- convert gray to binary
    binary0(3) <= inpt0(3);
    binary0(2) <= inpt0(3) xor inpt0(2);
    binary0(1) <= inpt0(3) xor inpt0(2) xor inpt0(1);
    binary0(0) <= inpt0(3) xor inpt0(2) xor inpt0(1) xor inpt0(0);

    binary1(3) <= inpt1(3);
    binary1(2) <= inpt1(3) xor inpt1(2);
    binary1(1) <= inpt1(3) xor inpt1(2) xor inpt1(1);
    binary1(0) <= inpt1(3) xor inpt1(2) xor inpt1(1) xor inpt1(0);



	-- verify distances option 1
	outp <= std_logic_vector((unsigned(binary1) - (unsigned(binary0)))) when (binary0 < binary1) else

	std_logic_vector((unsigned(sig14) - unsigned(binary0)) + unsigned(binary1)) when (binary0 > binary1) else

	"0000";

	-- verify distances option 2
	--binary0Minor <= binary1 - binary0);
	--binary0Major <= std_logic_vector((unsigned(sig14) - unsigned(binary0)) + unsigned(binary1));

	--outp <= binary0Minor when (binary0 < binary1) else
	--		binary0Major when (binary0 > binary1) else
	--		"0000";

end arch;
