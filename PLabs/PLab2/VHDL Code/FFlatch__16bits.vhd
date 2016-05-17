LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY FFlatch__16bits IS
	PORT ( 	RESET, CLK 	: IN STD_LOGIC;
			D : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

			Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		 );
END FFlatch__16bits ;

ARCHITECTURE Behavior OF FFlatch_16bits IS

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