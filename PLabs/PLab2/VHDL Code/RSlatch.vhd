-- RS latch
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY RSlatch IS
PORT( Clk, R, S : IN STD_LOGIC;
		Q : OUT STD_LOGIC
	);
END RSlatch;

ARCHITECTURE Structural OF RSlatch IS

	SIGNAL R_g, S_g, Qa, Qb : STD_LOGIC ;
	ATTRIBUTE keep : boolean;
	ATTRIBUTE keep of R_g, S_g, Qa, Qb : SIGNAL IS true;

	BEGIN
		R_g <= R AND Clk;
		S_g <= S AND Clk;
		Qa <= NOT (R_g OR Qb);
		Qb <= NOT (S_g OR Qa);
		Q <= Qa;
	END Structural;

-- 3. Compilar o código. Use a ferramenta Quartus II RTL Viewer
-- para examinar o gate-level produzido pelo circuito a partir
-- do código, e utilizar a tecnologia de visualização ferramenta
-- para verificar que o Latch é implementado como mostrado na
-- Figura 3b do PDF.

-- 4. Crie um arquivo vetorial de forma de onda (.vwf), que
-- especifica as entradas e saídas do circuito. Desenhe formas
-- de onda para as entradas R e S e use o II Simulator Quartus
-- para produzir as formas de onda correspondentes para R_g, S_g,
-- Qa e Qb. Verifique se o Latch funciona como esperado utilizando
-- simulação funcional e timing.