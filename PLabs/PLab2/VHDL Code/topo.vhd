-- D latch
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY topo IS
	PORT(	SW		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);		-- Clock e D

	 		LEDR	: OUT STD_LOGIC_VECTOR (5 DOWNTO 0) ;	-- Q

			KEY		: IN STD_LOGIC_VECTOR (1 DOWNTO 0);		-- PART V - Clock e Reset
	 		HEX		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)		-- PART V - A e B
		);
END topo;

ARCHITECTURE Structural OF topo IS
	
	SIGNAL Qm, Q, Qbar	: STD_LOGIC;

	-- PART V
	SIGNAL A, B	: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL A4, A5, A6, A7 STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL B0, B1, B2, B3 STD_LOGIC_VECTOR (6 DOWNTO 0);


	COMPONENT Dlatch_Master
		PORT( Clk,	D: IN STD_LOGIC;
				Q : OUT STD_LOGIC
			);
	END COMPONENT;

	COMPONENT Dlatch_Slave
	PORT( Clk, D: IN STD_LOGIC;
		Q : OUT STD_LOGIC;
		Qbar : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT FFlatch
	PORT ( 	D, Clk : IN STD_LOGIC ;
			Q : OUT STD_LOGIC
		 );
	END COMPONENT;


	COMPONENT FFlatch__16bits
		PORT ( 	RESET, CLK 	: IN STD_LOGIC;
			D : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

			Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		 );
	END COMPONENT;

	COMPONENT decod
	PORT ( 	inpt: in std_logic_vector (3 downto 0);
			outp: out std_logic_vector(6 downto 0)
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
	-- LanchA: FFlatch port map(SW(1), SW(0),LEDR(1));
	-- LanchB: FFlatch port map(SW(1), SW(0),LEDR(2));
	-- LanchC: FFlatch port map(SW(1), NOT SW(0),LEDR(3));

	-- Part V

	A <= SW (15 DOWNTO 0);
	B <= SW (15 DOWNTO 0);

	DecodA4 : decod port map (A(3 downto 0), A4);
	DecodA5 : decod port map (A(7 downto 4), A5);
	DecodA6 : decod port map (A(11 downto 8), A6);
	DecodA7 : decod port map (A(15 downto 12), A7);

	DecodB0 : decod port map (B(3 downto 0), B0);
	DecodB1 : decod port map (B(7 downto 4), B1);
	DecodB2 : decod port map (B(11 downto 8), B2);
	DecodB3 : decod port map (B(15 downto 12), B3);

	HEX (0) <= B0;
	HEX (1) <= B1;
	HEX (2) <= B2;
	HEX (3) <= B3;
	
	HEX (4) <= A4;
	HEX (5) <= A5;
	HEX (6) <= A6;
	HEX (7) <= A7;
	
	FFlatchAB: FFlatch__16bits port map (KEY(0), KEY(1), A); ???
	FFlatchAB: FFlatch__16bits port map (KEY(0), KEY(1), B); ???


END Structural;
