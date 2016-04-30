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

             -- Convert Gray to Binary0
                 
	            binary0(width-1) <= inpt0(width-1);
    
                for i in width-2 to 0 loop
	                binary0(i) <= inpt0(i+1) xor inpt0(i);
                end loop;
    
             -- Convert Gray to Binary1
                 
                 binary1(width-1) <= inpt1(width-1);
    
                for j in width-2 to 0 loop
	                binary1(j) <= inpt1(j+1) xor inpt1(j);
                end loop;
    
             -- Output logic
	            
	            if unsigned(binary1) > unsigned(binary0) then
	                outp <=	(std_logic_vector(unsigned(binary1) - unsigned(binary0)));
	            else
                    outp <= (std_logic_vector(unsigned(binary0) - unsigned(binary1)));
                end if;

        end process;
    
end arch;
