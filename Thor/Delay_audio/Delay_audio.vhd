--- CÓDIGO PADRÃO PARA A PLACA DE2_115 IMPLEMENTADO POR EDSON MANOEL DA SILVA
--- AS IMPLEMENTAÇOES DE ALGUNS BLOCOS DE CONTROLE DOS COMPONENETES SECUNDÁRIOS SÃO BASEADOS NO PROJETO
--- D:\Edson\Quartus\PLACA_DE2_115\DE2_115_demonstrations\DE2_115_Default

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Delay_audio IS
	PORT
		(
		--//////////// CLOCK //////////
			CLOCK_50 : IN STD_LOGIC;
		--//////////// LED //////////
			LEDG	   : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
			LEDR	   : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		--//////////// SW //////////
			SW		   : IN	STD_LOGIC_VECTOR(17 DOWNTO 0);
		--//////////// Audio //////////
			AUD_ADCDAT	: IN STD_LOGIC;
			AUD_ADCLRCK	: inout STD_LOGIC;
			AUD_BCLK	: inout STD_LOGIC;
			AUD_DACDAT	: OUT STD_LOGIC;
			AUD_DACLRCK	: inout STD_LOGIC;
			AUD_XCK		: OUT STD_LOGIC

		);
END ENTITY;

ARCHITECTURE FUNCIONAMENTO OF Delay_audio IS

COMPONENT RESET_DELAY
	PORT
	(
		iCLK		:	 IN STD_LOGIC;
		oRESET		:	 OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT audio_codec_controller
	PORT
	(
		RESET				:	 IN STD_LOGIC;
		CLOCK				:	 IN STD_LOGIC;
		i2cClock20KHz		:	 IN STD_LOGIC;
		SCL					:	 OUT STD_LOGIC;
		SDA					:	 INOUT STD_LOGIC;
		dacLIN				:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		dacRIN				:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		adcLOUT				:	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		adcROUT				:	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		adcData				:	 IN STD_LOGIC;
		dacData				:	 OUT STD_LOGIC;
		RL_DATA_OUT_VALID	:	 OUT STD_LOGIC;
		audioClock			:	 IN STD_LOGIC;
		adcLRSelect			:	 OUT STD_LOGIC;
		dacLRSelect			:	 OUT STD_LOGIC;
		dacLRSelect_ACK		:	 OUT STD_LOGIC
	);
END COMPONENT;

component PLL1
	PORT
	(
		inclk0	: IN STD_LOGIC  := '0'; -- 50 MHZ
		c0		: OUT STD_LOGIC 		-- 18.433180 MHZ
	);
end component;


component PLL2
	PORT
	(
		inclk0	: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC 
	);
end component;

--------------------------------------------------------

component Controla_delay is
	port(
		clock,reset,Enable_FIFO: in std_logic;
		Sample_delay: in std_logic_vector(16 downto 0);
		data_in: in std_logic_vector(25 downto 0);
		data_out: out std_logic_vector(25 downto 0));
end component;
--------------------------------------------------------

--------------------------------------- DECLARAÇÃO DE SINAIS -------------------------------
SIGNAL RST : STD_LOGIC;
SIGNAL SCL_SIG,AUDIO_CLOCK_SIG,CLOCK_50_DELAY,I2C_CLOCK20khz,RL_DATA_OUT_VALID_SIG : STD_LOGIC := '0';
SIGNAL adcLRC,adcdat,dacLRC,dacDat : STD_LOGIC := '0';
SIGNAL dacLIN_SIG,dacRIN_SIG,adcLOUT_SIG,adcROUT_SIG : STD_LOGIC_VECTOR(15 DOWNTO 0);


SIGNAL out_left_int : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL out_right_int : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL out_o : STD_LOGIC;

--------------------------------------------------------

Signal in_codec: std_logic_vector(25 downto 0);

Signal Left_codecin,Right_codecin: std_logic_vector(15 downto 0);

Signal Delay: std_logic_vector(16 downto 0); --Constant Delay: integer := 131071; -- Máx 131071

Signal Soma_delayL,Soma_delayR: std_logic_vector(15 downto 0);
--------------------------------------------------------

--------------------------------------------------------------------------------------------

BEGIN

--------------------------------------- INSTANCIAÇÃO DE COMPONENETES -----------------------

INST_DELAY_RESET:RESET_DELAY
	PORT MAP	
	(
		iCLK	=> CLOCK_50, 
		oRESET	=> RST   
	);

PLL1_inst : PLL1 
	PORT MAP 
	(
		inclk0	 => CLOCK_50,        -- 50 MHZ
		c0	 	 => AUDIO_CLOCK_SIG  -- 12 MHZ
	);
	
PLL2_inst : PLL2 
	PORT MAP
	(
		inclk0	 => CLOCK_50,
		c0	 	 => I2C_CLOCK20khz
	);	

--------------------------------------------------------
	
AUDIO_CODEC_INST : AUDIO_CODEC_CONTROLLER	
	PORT MAP
	(
		RESET			=> RST,--SW(17),
		CLOCK			=> CLOCK_50,
		i2cClock20KHz	=> I2C_CLOCK20khz,
		SCL				=> SCL_SIG,
--		SDA				=> I2C_SDAT,
		dacLIN			=> Left_codecin,--in_codec(25) & in_codec(25) & in_codec(25) & in_codec(25 downto 13),
		dacRIN			=> Right_codecin,--in_codec(12) & in_codec(12) & in_codec(12) & in_codec(12 downto 0),
		adcLOUT			=> adcLOUT_SIG,
		adcROUT			=> adcROUT_SIG,
		adcData			=> adcDat,
		dacData			=> dacDat,
		RL_DATA_OUT_VALID	=>	 RL_DATA_OUT_VALID_SIG,
		audioClock		=> AUDIO_CLOCK_SIG,
		adcLRSelect		=> adcLRC,
		dacLRSelect		=> dacLRC,
		dacLRSelect_ACK	=> open
	);

	-- Ambos sinais com 12 bits e 4 bits de sinal
	-- Left_codecin <= dacLIN_SIG(15) & dacLIN_SIG(15) & dacLIN_SIG(15) & dacLIN_SIG(15 downto 3) when SW(0) = '1' 
	--					  else in_codec(25) & in_codec(25) & in_codec(25) & in_codec(25 downto 13);
	-- Right_codecin <= dacRIN_SIG(15) & dacRIN_SIG(15) & dacRIN_SIG(15) & dacRIN_SIG(15 downto 3) when SW(0) = '1' 
	--					  else in_codec(12) & in_codec(12) & in_codec(12) & in_codec(12 downto 0);
	
	-- Apenas o sinal da FIFO com 12 bits e 4 bits de sinal
	-- Left_codecin <= dacLIN_SIG when SW(0) = '1' else in_codec(25) & in_codec(25) & in_codec(25) & in_codec(25 downto 13);
	-- Right_codecin <= dacRIN_SIG when SW(0) = '1' else in_codec(12) & in_codec(12) & in_codec(12) & in_codec(12 downto 0);
	
		Soma_delayL <= (dacLIN_SIG(15) & dacLIN_SIG(15) & dacLIN_SIG(15 downto 2)) + 
							(in_codec(25) & in_codec(25) & in_codec(25) & in_codec(25) & in_codec(25 downto 14));
		Soma_delayR <= (dacRIN_SIG(15) & dacRIN_SIG(15) & dacRIN_SIG(15 downto 2)) +
							(in_codec(12) & in_codec(12) & in_codec(12) & in_codec(12) & in_codec(11 downto 0));
	
		Left_codecin <= dacLIN_SIG(15) & dacLIN_SIG(15) & dacLIN_SIG(15 downto 2) when SW(0) = '1' 
						  else Soma_delayL;
		Right_codecin <= dacRIN_SIG(15) & dacRIN_SIG(15) & dacRIN_SIG(15 downto 2) when SW(0) = '1' 
						  else Soma_delayR;
	
	Delay <= SW(17 downto 1);
	-- Delay minimo = 65536 = 1,36 s
	
Delay_aud: Controla_delay port map
	(
		clock => AUDIO_CLOCK_SIG,
		reset => RST,
		Enable_FIFO => RL_DATA_OUT_VALID_SIG,
		Sample_delay => Delay,
		data_in => dacLIN_SIG(15 downto 3) & dacRIN_SIG(15 downto 3),
		data_out => in_codec
	);
	
-------------------------------------------------------
	

-- send out the clocks
-- I2C_SCLK <= SCL_SIG;
AUD_BCLK <= NOT(AUDIO_CLOCK_SIG);
AUD_XCK  <= NOT(AUDIO_CLOCK_SIG);

-- output assignments
AUD_ADCLRCK <= adcLRC;
AUD_DACLRCK <= dacLRC;

	PROCESS(CLOCK_50, RST)
	BEGIN
		IF (RST) = '0' THEN
			adcDat <= '0';
			AUD_DACDAT <= '0';
			dacLIN_SIG <= (OTHERS => '0');
			dacRIN_SIG <= (OTHERS => '0');
		ELSIF (RISING_EDGE(CLOCK_50)) THEN
		-- output from adc
			adcDat <= AUD_ADCDAT;
		-- input of dac
			AUD_DACDAT  <= dacDat;
		--- BYPASS ----
			dacLIN_SIG <= adcLOUT_SIG;
			dacRIN_SIG <= adcROUT_SIG;
		---------------
		END IF;
	END PROCESS;
	
END ARCHITECTURE;