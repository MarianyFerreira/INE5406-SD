LIBRARY ieee ;
USE ieee.std_logic_1164.all;

<<<<<<< HEAD:PLabs/PLab2/VHDL Code/FFlatch16.vhd
ENTITY FFlatch16 IS
=======
ENTITY FFlatch16 is
>>>>>>> 1292df4ddb1b9d0e11ed404b35ffa2820a3a0d67:PLabs/PLab2/VHDL Code/FFlatch__16bits.vhd
	PORT ( 	RESET, CLK 	: IN STD_LOGIC;
			D : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

			Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		 );
<<<<<<< HEAD:PLabs/PLab2/VHDL Code/FFlatch16.vhd
END FFlatch16 ;
=======
END FFlatch16;
>>>>>>> 1292df4ddb1b9d0e11ed404b35ffa2820a3a0d67:PLabs/PLab2/VHDL Code/FFlatch__16bits.vhd

ARCHITECTURE Behavior OF FFlatch16 IS

	BEGIN
		PROCESS (CLK, RESET, D)

			BEGIN

				IF RESET = '0' THEN
				
					Q <= (OTHERS >= '0');

				ELSIF RISING_EDGE(CLK) THEN
				
					Q <= D;
				
				END IF;
		END PROCESS;

	END Behavior;