library ieee; 
use ieee.std_logic_1164.all;

entity topo is port ( 
			SW: IN STD_LOGIC_VECTOR(17 downto 0);
			KEY: in std_logic_vector(3 downto 0);
			clock_50: in std_logic -- clock 50 MHz
);
end topo;

architecture topo_estru of topo is
   signal c0, c1, f_clk, f_hsync, f_vsync, f_sync, f_blank, f_disp_enable: std_logic;
	signal f_row: std_logic_vector(8 downto 0);
	signal f_col: std_logic_vector(9 downto 0);

component mem
	PORT (
			clock: IN STD_LOGIC := '1';
			data: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			rdaddress: IN STD_LOGIC_VECTOR(14 DOWNTO 0);
			wraddress: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			wren: IN STD_LOGIC := '0';
			q: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
end component;

component pll
	PORT (
			inclk0: IN STD_LOGIC:= '0';
			c0: OUT STD_LOGIC;
			c1: OUT STD_LOGIC 
	);
end component;

component vga_pixel_gen
	port(
			reset : in std_logic;
			f_clk : in std_logic; -- 50MHz
			f_on : in std_logic; -- indica a região ativa do frame
			f_row : in std_logic_vector(8 downto 0);
			f_col : in std_logic_vector(9 downto 0);
			r_out : out std_logic_vector(4 downto 0); -- componente R
			g_out : out std_logic_vector(5 downto 0); -- componente G
			b_out : out std_logic_vector(4 downto 0); -- componente B
			-- mem
			rdaddress : out std_logic_vector(14 downto 0);
			q : in std_logic_vector(15 downto 0)
	);
end component;

component vga_sync
	port(
			reset : in std_logic;
			f_clk : in std_logic;
			f_hsync : out std_logic;
			f_vsync : out std_logic;
			f_sync : out std_logic;
			f_blank : out std_logic;
			f_row : out std_logic_vector(8 downto 0); -- índice da linha que está sendo processada
			f_col : out std_logic_vector(9 downto 0); -- índice da coluna que está sendo processada
			f_disp_enable : out std_logic -- indica a região ativa do frame
	);
end component;

begin

	L0: pll port map(clock_50, c0, c1);
	L1: vga_sync port map(KEY(0), c0, f_hsync, f_vsync, f_sync, f_blank, f_row, f_col, f_disp_enable);
	L2: mem port map(c1, );

end topo_estru;
