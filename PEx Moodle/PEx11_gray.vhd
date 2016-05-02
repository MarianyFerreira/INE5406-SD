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
     

begin
        
        process(inpt0, inpt1, binary0, binary1)
        
            begin
             -- Convert Gray to Binary
	        binary0(width-1) <= inpt0(width-1);
	        binary1(width-1) <= inpt1(width-1);
    
                for i in width-2 downto 0 loop
                
	                binary0(i) <= binary0(i+1) xor inpt0(i);
	                binary1(i) <= binary1(i+1) xor inpt1(i);
	                
                end loop;
             -- Output logic
	            if unsigned(binary1) > unsigned(binary0) then
	                outp <=	(std_logic_vector(unsigned(binary1) - unsigned(binary0)));
	                
	            else
                        outp <= (std_logic_vector(unsigned(binary0) - unsigned(binary1)));
                    end if;

        end process;
    
end arch;
