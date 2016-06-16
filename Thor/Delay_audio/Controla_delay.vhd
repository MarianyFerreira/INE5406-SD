Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity Controla_delay is
	port(
		clock,reset,Enable_FIFO: in std_logic;
		Sample_delay: in std_logic_vector(16 downto 0);
		data_in: in std_logic_vector(25 downto 0);
		-- For Testbench only
		R_FIFO,W_FIFO: out std_logic;
		FIFO_adress: out std_logic_vector(16 downto 0);
		-- For Testbench only
		data_out: out std_logic_vector(25 downto 0));
end Entity;

----------------------------

Architecture behavior of Controla_delay is

---------------------------------------------------------

component FIFO_test IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (25 DOWNTO 0);
		rdreq		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		empty		: OUT STD_LOGIC ;
		full		: OUT STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (25 DOWNTO 0);
		usedw		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0)
	);
END component;

---------------------------------------------------------

type State is (Write_untillfull, Write_Read, Only_write, Only_read);
Signal currentState: State;
-- Definimos uma variavel currentState do tipo State que representa o estado em que a FSMd se encontra, sendo esses estados:
 -- (1)Write_untillfull => Estado inicial, quando a FSMd eh resetada (no comeco da execucao) a FSMd vai para esse estado, nele
 -- a FIFO recebe e armazana os dados vindos do codec (Escreve) ate que o numero de enderecos da FIFO (aqui representada por
 -- adress_fifo) seja igual ao numero do delay (Sample_delay) apos isso a FSMd executa o estado Write_Read
 -- (2)Write_Read => Escreve e le da FIFO ao mesmo tempo, de tal modo que adress_fifo permanece constante
 -- (3)Only_write => Quando o valor de sample_delay for alterado, se o numero de amostras na FIFO for menor que o sample_delay
 -- atual a FIFO ira escrever ate que adress_fifo corresponda ao novo valor de sample_delay retornando ao estado Write_untillfull
 -- (4)Only_read => igual Only_write porem o numero de amostras eh menor que sample_delay, entao a FIFO sera lida apenas ate que
 -- adress_fifo corresponda ao sample_delay
 
Signal Range_v: std_logic_vector(4 downto 0);
Signal Sample_delay_value,adress_fifo: std_logic_vector (16 downto 0);
Signal Enb_read,Enb_write,write_fifo,read_fifo: std_logic;

Signal adress_fifo_int,Sample_delay_int: std_logic_vector (17 downto 0);

BEGIN

MemFIFO: FIFO_test port map
	(
		clock		=> clock,
		data		=> data_in,
		rdreq		=> Enb_read,
		wrreq		=> Enb_write,
		empty		=> open,
		full		=> open,
		q		=> data_out,
		usedw		=> adress_fifo
	);

		Enb_read <= read_fifo and Enable_FIFO;
		Enb_write <= write_fifo and Enable_FIFO;
		
		---- Testbench	
		R_FIFO <= read_fifo;
		W_FIFO <= write_fifo;
		FIFO_adress <= adress_fifo;
		---- Testbench		

		Sample_delay_int(17) <= '0';
		adress_fifo_int(17) <= '0';
		Sample_delay_int(16 downto 0) <= Sample_delay_value;
		adress_fifo_int(16 downto 0) <= adress_fifo;
		
process(Sample_delay_int,clock,reset,adress_fifo)
	begin
		
		if signed((Sample_delay_int)) <= signed(Range_v) then
			Range_v <= (others=>'0');
		else
			Range_v <= "01010"; -- 10
		end if;
		
		if reset = '0' then -- Rst assincrono manda o registrador de estados para o estado inicial Write_untillfull
			currentState <= Write_untillfull;
		
		else
			if rising_edge(clock) then
				case currentState is
					when Write_untillfull =>
						write_fifo <= '1';
						read_fifo <= '0';
						if adress_fifo = Sample_delay_value then -- Se o numero de amostras na FIFO for igual ao delay
							currentState <= Write_Read; -- A FIFO ira ler e escrever simultaneamente
						else
							currentState <= Write_untillfull;
						end if;
						
					when Write_Read =>
						write_fifo <= '1';
						read_fifo <= '1';
						Sample_delay_value <= Sample_delay;
						if signed(adress_fifo_int) > (signed(Sample_delay_int) + signed(Range_v)) then
						--	reg_delay <= Sample_delay;
							currentState <= Only_read; -- O valor do delay foi diminuido, os enderecos da FIFO entao assumiram um valor maior
						elsif signed(adress_fifo_int) < (signed(Sample_delay_int) - signed(Range_v)) then
						--	reg_delay <= Sample_delay;
							currentState <= Only_write; --  O delay foi incrementado, a FIFO escreve valores e nao eh lida
						else
							currentState <= Write_Read;
						end if;
					
					when Only_read =>
						write_fifo <= '0';
						read_fifo <= '1';
						if adress_fifo = Sample_delay_value then --or reg_delay /= Sample_delay then -- Se o numero de amostras na FIFO for igual ao delay
							currentState <= Write_Read; -- A FIFO ira ler e escrever simultaneamente
						else
							currentState <= Only_read;
						end if;
										
					when Only_write =>
						write_fifo <= '1';
						read_fifo <= '0';
						if adress_fifo = Sample_delay_value then --or reg_delay /= Sample_delay then -- Se o numero de amostras na FIFO for igual ao delay
							currentState <= Write_Read; -- A FIFO ira ler e escrever simultaneamente
						else
							currentState <= Only_write;
						end if;
				end case;
			end if;
		end if;
	end process;
end architecture;
	