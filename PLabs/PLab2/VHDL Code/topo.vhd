-- D latch
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY topo IS
	PORT(	SW : IN STD_LOGIC_VECTOR (1 DOWNTO 0);		-- Clock e D
	 		LEDR : OUT STD_LOGIC_VECTOR (5 DOWNTO 0) ;	-- Q
		);
END topo;

ARCHITECTURE Structural OF topo IS
	
	SIGNAL Qm : STD_LOGIC;
	SIGNAL Q : STD_LOGIC;
	SIGNAL Qbar : OUT STD_LOGIC 						-- not Q


	COMPONENT Dlatch_Master
		PORT( 	Clk,	D: IN STD_LOGIC;
				Q : OUT STD_LOGIC
			);
	END COMPONENT;

	COMPONENT Dlatch_Slave
	PORT( Clk, D: IN STD_LOGIC;
		Q : OUT STD_LOGIC;
		Qbar : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT latch
	PORT ( 	D, Clk : IN STD_LOGIC ;
			Q : OUT STD_LOGIC
		 );
	END COMPONENT;


	BEGIN
	-- Part I
		-- Arquivo RS_estrutural.vhd
		-- RTL Viewer
		-- Arquivo vetorial de forma de onda (.vwf)


	-- Part II
	-- DLanch: Dlatch_Master port map(SW(1), SW(0),LEDR(0));


	-- Part III
	-- Master: Dlatch_Master port map(SW(1), SW(0), Qm);
	-- Slave: Dlatch_Slave port map(SW(1), Qm, LEDR(0), Qbar);


	-- Part IV
	-- LanchA: latch port map(SW(1), SW(0),LEDR(1));
	-- LanchB: latch port map(SW(1), SW(0),LEDR(2));
	-- LanchC: latch port map(SW(1), NOT SW(0),LEDR(3));




END Structural;
