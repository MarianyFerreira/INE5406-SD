LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY FFlatchNot IS
	PORT ( 	D, Clk : IN STD_LOGIC ;
			Q : OUT STD_LOGIC
		 );
END FFlatchNot ;

ARCHITECTURE Behavior OF FFlatchNot IS

	BEGIN
		PROCESS (D, Clk )
			BEGIN
				IF RISING_EDGE(Clock) THEN
					Q <= NOT D ;
				END IF ;
		END PROCESS ;

	END Behavior ;