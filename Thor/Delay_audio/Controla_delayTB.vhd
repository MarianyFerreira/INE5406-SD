Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_textio.all;
USE std.textio.ALL;

Entity Controla_delayTB is
end entity;

Architecture BHV of Controla_delayTB is

component Controla_delay is
	port(
		clock,reset,Enable_FIFO: in std_logic;
		Sample_delay: in std_logic_vector(16 downto 0);
		data_in: in std_logic_vector(25 downto 0);
		R_FIFO,W_FIFO: out std_logic;
		FIFO_adress: out std_logic_vector(16 downto 0);
		data_out: out std_logic_vector(25 downto 0));
end component;

Signal clock_TB: std_logic:= '1';
Signal reset_TB: std_logic:= '0';
Signal Enable_FIFOTB: std_logic:='0';
Signal Sample_delayTB: std_logic_vector(16 downto 0);
Signal data_inTB: std_logic_vector(25 downto 0):=(others=>'0');
Signal R_FIFOTB,W_FIFOTB: std_logic;
Signal FIFO_adressTB: std_logic_vector(16 downto 0);
Signal data_outTB: std_logic_vector(25 downto 0);
--Signal count2: integer:= 0;

BEGIN

instancia_TB: Controla_delay port map(
		clock => clock_TB,
		reset => reset_TB,
		Enable_FIFO => Enable_FIFOTB,
		Sample_delay => Sample_delayTB,
		data_in => data_inTB,
		R_FIFO => R_FIFOTB,
		W_FIFO => W_FIFOTB,
		FIFO_adress => FIFO_adressTB,
		data_out => data_outTB);
	
	clock_TB <= not(clock_TB) after 10 us; -- ciclo de 20 ps -> 50M Hz
	
	reset_TB <= '1' after 5 us; -- Resetado por 0,5 ciclos
	
	Enable_FIFOTB <= not(Enable_FIFOTB) after 50 us; -- Le ou escreve a cada 50 ps conforme a habilitacao de cada
	Sample_delayTB <= '0' & X"1FFF",'0' & X"10FF" after 2000 ms,'0' & X"1FFF" after 3000 ms;
	
--	process(clock_TB)
--	begin
--		if rising_edge(clock_TB) then
--			count2 <= count2 + 1;
--			if (count2 = 16) then
--				Enable_FIFOTB <= '1';
--			elsif (count2 >= 124) then
--				count2 <= 0;
--				Enable_FIFOTB <= '0';
--			else
--				Enable_FIFOTB <= '0';
--			end if;
--		end if;
--	end process;
	
	PROCESS(clock_TB)	
		
		FILE infile1: TEXT IS IN "P:\Henrique.souza\Matlab\FIFO_left.hex"; -- Arquivo a ser lido (Left Side)
		VARIABLE in_line1 : LINE; -- Variavel que recebe os valores das linhas pelo comando "READLINE"
		VARIABLE in_val1  : STD_LOGIC_VECTOR(15 DOWNTO 0); -- Variavel que recebe o valor de in_line1 em "HREAD"
		
		FILE infile2: TEXT IS IN "P:\Henrique.souza\Matlab\FIFO_right.hex"; -- Arquivo a ser lido (Right Side)
		VARIABLE in_line2 : LINE; -- Variavel que recebe os valores das linhas pelo comando "READLINE"
		VARIABLE in_val2  : STD_LOGIC_VECTOR(15 DOWNTO 0); -- Variavel que recebe o valor de in_line2 em "HREAD"
	BEGIN

		if reset_TB = '1' then
			if (rising_edge(clock_TB)) then
			
					if NOT(ENDFILE(infile1)) then
						READLINE(infile1, in_line1); -- read a line from the input file
						HREAD(in_line1, in_val1); -- read a value from the line
						data_inTB(12 downto 0) <= in_val1(15 downto 3); -- Assign data received to LSB data_inTB
				--	else
				--		data_inTB(12 downto 0) <= (others => '0');
					end if;
								
					if NOT(ENDFILE(infile2)) then
						READLINE(infile2, in_line2); -- read a line from the input file
						HREAD(in_line2, in_val2); -- read a value from the line
						data_inTB(25 downto 13) <= in_val2(15 downto 3); -- Assign data received to MSB data_inTB
				--	else
				--		data_inTB(25 downto 13) <= (others => '0');
					end if;

			end if;
		end if;
	end process;
	
--	PROCESS	--arquivo de sa�da
--		FILE outfile : TEXT IS OUT "P:\Henrique.souza\Matlab\Sen_cos.pcm";
--		VARIABLE out_line : LINE;
--	BEGIN
--		if reset_TB = '1' then
--			if rising_edge(clock_TB) then
--				if R_FIFOTB = '1' then
--					HWRITE(out_line, data_outTB);
--					WRITELINE(outfile, out_line);
--				end if;
--			end if;
--		end if;
--	END PROCESS;
	
end architecture;