LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY FFlatch16 is
	PORT ( 	RESET, CLK 	: IN STD_LOGIC;
			D : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

			Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		 );
END FFlatch16;

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