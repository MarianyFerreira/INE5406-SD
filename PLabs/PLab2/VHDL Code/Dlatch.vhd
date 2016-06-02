-- D latch Slave
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Dlatch IS
	PORT( Clk, D: IN STD_LOGIC;
		Q : OUT STD_LOGIC;
		Qbar : OUT STD_LOGIC
		);
END Dlatch;

ARCHITECTURE Structural OF Dlatch IS

	SIGNAL S, R, R_g, S_g, Qa, Qb : STD_LOGIC;
	ATTRIBUTE keep : boolean;
	ATTRIBUTE keep of R_g, S_g, Qa, Qb : SIGNAL IS true;

	R <= NOT D;
	S <= D;

	BEGIN
		R_g <= R AND Clk;
		S_g <= S AND Clk;
		Qa <= NOT (R_g OR Qb);
		Qb <= NOT (S_g OR Qa);
		Q <= Qa;
		Qbar <= NOT Qa;
	END Structural;