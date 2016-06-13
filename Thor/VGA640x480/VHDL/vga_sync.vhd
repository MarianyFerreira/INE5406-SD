library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vga_sync is
	port(
		reset: in std_logic;
		f_clk: in std_logic;
		f_hsync: out std_logic;
		f_vsync: out std_logic;
		f_sync: out std_logic;
		f_blank: out std_logic;
		f_row: out std_logic_vector(8 downto 0); -- índice da linha que está sendo processada
		f_col: out std_logic_vector(9 downto 0); -- índice da coluna que está sendo processada
		f_disp_enable: out std_logic -- indica a região ativa do frame
	);
end entity;

architecture behv of vga_sync is
	-- sinais do controle horizontal
	signal h_cmp1: std_logic;
	signal h_cmp2: std_logic;
	signal h_cmp3: std_logic;
	signal h_cmp4: std_logic;
	signal h_sync_next: std_logic;
	signal h_sync_now: std_logic;
	signal h_data_next: std_logic;
	signal h_data_now: std_logic;
	signal h_cnt_next: std_logic_vector(9 downto 0);
	signal h_cnt_now: std_logic_vector(9 downto 0);
	
	-- sinais do controle vertical
	signal v_cmp1: std_logic;
	signal v_cmp2: std_logic;
	signal v_cmp3: std_logic;
	signal v_cmp4: std_logic;
	signal v_sync_next: std_logic;
	signal v_sync_now: std_logic;
	signal v_data_next: std_logic;
	signal v_data_now: std_logic;
	signal v_cnt_next: std_logic_vector(8 downto 0);
	signal v_cnt_now: std_logic_vector(8 downto 0);
	
	signal blank_next: std_logic;
	signal blank_now: std_logic;
begin
	f_hsync <= h_sync_now;
	f_vsync <= v_sync_now;
	f_sync <= h_sync_now and v_sync_now;
	f_blank <= blank_now;
	f_row <= v_cnt_now;
	f_col <= h_cnt_now;
	f_disp_enable <= h_data_now and v_data_now;
	
	process(f_clk, reset)
	begin
		if(reset = '0') then
			h_cnt_now <= (others => '0');
			v_cnt_now <= (others => '0');
			h_sync_now <= '0';
			v_sync_now <= '0';
			h_data_now <= '0';
			v_data_now <= '0';
		elsif rising_edge(f_clk) then
			h_cnt_now <= h_cnt_next;
			v_cnt_now <= v_cnt_next;
			
			h_sync_now <= h_sync_next;
			v_sync_now <= v_sync_next;
			
			h_data_now <= h_data_next;
			v_data_now <= v_data_next;
			
			blank_now <= blank_next;
		end if;
	end process;
	
	h_cnt_next <= (others => '0') when h_cmp4 = '1' else h_cnt_now + 1;
	v_cnt_next <= (others => '0') when v_cmp4 = '1' else v_cnt_now + 1 when h_cmp4 = '1' else v_cnt_now;
	
	h_cmp1 <= '1' when h_cnt_now = 639 else '0';
	h_cmp2 <= '1' when h_cnt_now = 655 else '0';
	h_cmp3 <= '1' when h_cnt_now = 751 else '0';
	h_cmp4 <= '1' when h_cnt_now = 799 else '0';
	v_cmp1 <= '1' when v_cnt_now = 479 else '0';
	v_cmp2 <= '1' when v_cnt_now = 489 else '0';
	v_cmp3 <= '1' when v_cnt_now = 491 else '0';
	v_cmp4 <= '1' when v_cnt_now = 524 else '0';
	
	h_sync_next <= '0' when h_cmp2 = '1' else '1' when h_cmp3 = '1' else h_sync_now;
	v_sync_next <= '0' when v_cmp2 = '1' else '1' when v_cmp3 = '1' else v_sync_now;
				 
	h_data_next <= '0' when h_cmp1 = '1' else '1' when h_cmp4 = '1' else h_data_now;
	v_data_next <= '0' when v_cmp1 = '1' else '1' when v_cmp4 = '1' else v_data_now;
						
	blank_next <= '0' when (v_cmp1 or v_cmp2 or v_cmp3 or v_cmp4) = '1' else '1' when (h_cmp1 or h_cmp2 or h_cmp3 or h_cmp4) = '0' else '0';
	
end architecture;