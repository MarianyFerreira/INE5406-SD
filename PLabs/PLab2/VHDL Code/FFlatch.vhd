LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY FFlatch IS
	PORT ( 	D, Clk : IN STD_LOGIC ;
			Q : OUT STD_LOGIC
		 );
END FFlatch ;

ARCHITECTURE Behavior OF FFlatch IS

	BEGIN
		PROCESS (D, Clk )
			BEGIN
				IF RISING_EDGE(Clock) THEN
					Q <= D ;
				END IF ;
		END PROCESS ;

	END Behavior ;