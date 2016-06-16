module board_EP4CE6 (	// Sera utilizado um clock inicialmente de 220MHz 
		input clk,
		input rst,
		input n_run,
		output gnd,
		
		input [15:0] in_left,
		input [15:0] in_right,
		input stb_ad, 
		
		output [15:0] out_left,
		output [15:0] out_right,
		output out_o
		);

	wire [1:0] switch;
	ISM2 ISM2 (
		.probe(),  //  probes.probe
		.source(switch)  // sources.source
	);

	//wire clk_188;
//	assign out_left = in_left;
//	assign out_right = in_right;
//	PLL4 PLL4 (
//		.areset(rst),
//		.inclk0(clk),	// 50MHz
//		.c0(clk_188),	// 192MHz
//		.locked()
//	);
	assign gnd = 0;
	wire rst_geral = rst;//|| switch[0];
	wire nrun_geral = n_run;
	/********** PLLs para gerar Freq necessaria ***********/
	wire clk_48, clk_4_8, clk_96;
	PLL_48 PLL_48
	(
	//	.areset(rst_geral),
		.inclk0(clk),
		.c0(clk_48),
		.c1(clk_4_8),
		.c2(clk_96),
	);
	
	wire clk_HF;
	PLL_HF PLL_HF
	(
	//	.areset(rst_geral),
		.inclk0(clk_48),
		.c0(clk_HF)
	);
	/******************************************************/

	wire out_clk =  clk_HF;
			
	

//	wire [13:0] set_delay = 14'd4000;
	wire [13:0] set_delay = 14'd7400;
//	wire [13:0] set_delay = 14'd7600;
	/* strobes utilizados nos filtros interpoladores */
	wire cic_stb_1;
 	cic_strober #(.WIDTH(14)) 
		cic_strober_1 ( 
			.clock(out_clk),
			.reset(rst_geral),
			.enable(~nrun_geral),
			.rate(set_delay), 
			.strobe_slow(cic_stb_1) 
		);

	wire cic_stb_4_8_1;
 	cic_strober #(.WIDTH(14)) 
		cic_strober_4_8_1 ( 
			.clock(clk_48),
			.reset(rst_geral),
			.enable(~nrun_geral),
			.rate(14'd1000), 
			.strobe_slow(cic_stb_4_8_1) 
		);
	wire cic_stb_4_8_2;
 	cic_strober #(.WIDTH(14)) 
		cic_strober_4_8_2 ( 
			.clock(clk_48),
			.reset(rst_geral),
			.enable(~nrun_geral),
			.rate(14'd10), 
			.strobe_slow(cic_stb_4_8_2) 
		);

	
//	wire [7:0] rate = 8'd40;
	wire [7:0] rate = 8'd74;  // 355.2MHz
//	wire [7:0] rate = 8'd76;  // 364.8MHz
	wire cic_stb_2;
	cic_strober #(.WIDTH(8)) 
		cic_strober_2 ( 
			.clock(out_clk),
			.reset(rst_geral),
			.enable(~nrun_geral),
			.rate(rate), 
			.strobe_slow(cic_stb_2) 
		);
	/*************************************************/
	
	/* Filtro interpolador CIC para utilizar o sinal com frequencia de clk intermediaria - 4.8MHz */
	wire [15:0] out_interp_left;
	cic_interp  #(.bw(16),.N(4),.log2_of_max_rate(8))
		cic_interp_1(.clock(clk_48),.reset(rst_geral),.enable(~nrun_geral),.rate(100),
		  .strobe_in(cic_stb_4_8_1),.strobe_out(cic_stb_4_8_2),
		  .signal_in(in_left),.signal_out(out_interp_left));		// Freq saida = 4.8MHz
	/********************************************************************************************/ 

	/* Filtro interpolador CIC para utilizar o sinal com frequencia de clk intermediaria - 4.8MHz */
	wire [15:0] out_interp_right;
	cic_interp  #(.bw(16),.N(4),.log2_of_max_rate(8))
		cic_interp_right(.clock(clk_48),.reset(rst_geral),.enable(~nrun_geral),.rate(100),
		  .strobe_in(cic_stb_4_8_1),.strobe_out(cic_stb_4_8_2),
		  .signal_in(in_right),.signal_out(out_interp_right));		// Freq saida = 4.8MHz
	/********************************************************************************************/ 


	////////// Registra /////////////
	reg [15:0] right_interp_reg, left_interp_reg;
	always @(posedge out_clk)
		if (rst_geral)
		begin
			right_interp_reg <= 16'd0;
			left_interp_reg <= 16'd0;
		end else
		if (cic_stb_2)
		begin
			right_interp_reg <= out_interp_right;
			left_interp_reg <= out_interp_left;
		end
		
	////////// Gera a soma e a diferença /////////////
	reg [15:0] Soma_MPX, Dif_MPX;
	always @(posedge out_clk)
		if (rst_geral)
		begin
			Soma_MPX <= 16'd0;
			Dif_MPX <= 16'd0;
		end else
		if (cic_stb_2)
		begin
			Soma_MPX <= {left_interp_reg[15], left_interp_reg[15:1]} + {right_interp_reg[15], right_interp_reg[15:1]};
//			Soma_MPX <= 16'd0;
			Dif_MPX <= {left_interp_reg[15], left_interp_reg[15:1]} - {right_interp_reg[15], right_interp_reg[15:1]};
		end
	
	/* ----------- Atraso em Soma_MPX de 18 ---------- */
	
	reg [15:0] Regs_soma_MPX [0:17];
	
	integer i;
	always @(posedge out_clk)
		if (rst_geral)
			for (i=0; i < 18; i=i+1) 
			begin
				Regs_soma_MPX[i] <= 0;
			end	
		else
		begin
			Regs_soma_MPX[0] <= Soma_MPX;
			for (i=0; i < 17; i=i+1)
			begin
				Regs_soma_MPX[i+1] <= Regs_soma_MPX[i];
			end			
		end
	
	wire [15:0] wire_soma_MPX;
	Mult_const_70pct Mult_const_70pct
	(
//		.clk(out_clk),
		.clk(clk_4_8),
		.rst(rst_geral),
		.run(~nrun_geral),
		
//		.strobe(cic_stb_2), 
		.strobe(1),
		
		.in(Regs_soma_MPX[16]),
		
		.out(wire_soma_MPX)
	);
	/* --------------------------------------------------------- */
	
//	wire [23:0] data_rst;
//	reset_38k reset_38k (
//		.source(data_rst)  // sources.source
//	);
	
	/* ----------- CORDIC para transladar a diferença para 38KHz e gerar o Tom em 19KHz -------------- */	
	reg [23:0] phase_tone_19, phase_shift_38;
	always @(posedge out_clk)
	if (rst_geral || nrun_geral)
	begin
		phase_tone_19 <= 24'd2097152;
		phase_shift_38 <= 0;
	end else
	begin
		if (cic_stb_2)
		begin
			phase_tone_19 <= phase_tone_19 + 24'd66410; 	// 19KHz
			phase_shift_38 <= phase_shift_38 + 24'd132820; // 38KHz
		end
	end 

	
	wire [15:0] Dif_MPX_shift;
	cordic_z16 #(.bitwidth(16))
		cordic_z16_shift_Dif (
			.clock(out_clk), .reset(rst_geral), .enable(~nrun_geral && cic_stb_2), 
			.xi(Dif_MPX), .yi(16'd0), .zi(phase_shift_38), 
//			.xi(16'h7FFF), .yi(16'd0), .zi(phase_shift_38), 
			.xo(Dif_MPX_shift), .yo(), .zo());
	
	
	wire [15:0] Dif_MPX_shift_mult;
	Mult_const_CORDIC Mult_const_CORDIC_dif
	(
//		.clk(out_clk),
		.clk(clk_4_8),
		.rst(rst_geral),
		.run(~nrun_geral),
		
//		.strobe(cic_stb_2),
		.strobe(1),
	
		.in(Dif_MPX_shift),
	
		.out(Dif_MPX_shift_mult)
	);
//	
//	wire [15:0] mult_adj;
//	constant_mult constant_mult(
//		.source(mult_adj)  // sources.source
//	);
	wire [15:0] Dif_MPX_shift_adj;
//	wire [31:0] Dif_MPX_shift_adj2;
	Mult_const_DIF_ADJ Mult_const_DIF_ADJ
	(
//		.clk(out_clk),
		.clk(clk_4_8),
		.rst(rst_geral),
		.run(~nrun_geral),
		
//		.strobe(cic_stb_2),
		.strobe(1),
	
		.in(Dif_MPX_shift_mult),
	
		.out(Dif_MPX_shift_adj)
	);
//	mult16x16 mult16x16
//	(
//		.clock(clk_4_8),
//		.dataa(Dif_MPX_shift_mult),
//		.datab(mult_adj),
//		.result(Dif_MPX_shift_adj2)
//	);
//	assign Dif_MPX_shift_adj = Dif_MPX_shift_adj2[29:14];
////	assign out_right = Dif_MPX_shift_mult;

	
	wire [15:0] tone_19k;
	cordic_z16 #(.bitwidth(16))
		cordic_z16_tone_19k (
			.clock(out_clk), .reset(rst_geral), .enable(~nrun_geral && cic_stb_2), 
			.xi(16'h7FFF), .yi(16'd0), .zi(phase_tone_19), 
			.xo(tone_19k), .yo(), .zo());

	wire [15:0] tone_19k_mult;
	Mult_const_CORDIC Mult_const_CORDIC_tone
	(
//		.clk(out_clk),
		.clk(clk_4_8),
		.rst(rst_geral),
		.run(~nrun_geral),
		
//		.strobe(cic_stb_2),
		.strobe(1),
	
		.in(tone_19k),
	
		.out(tone_19k_mult)
	);	
	
//	localparam n_delay = 21;
//	reg [15:0] Regs_tone_19 [0:n_delay-1];
//	always @(posedge out_clk)
//		if (rst_geral)
//			for (i=0; i < n_delay; i=i+1) 
//			begin
//				Regs_tone_19[i] <= 0;
//			end	
//		else
//		begin
//			Regs_tone_19[0] <= tone_19k_mult;
//			for (i=0; i < n_delay-1; i=i+1)
//			begin
//				Regs_tone_19[i+1] <= Regs_tone_19[i];
//			end			
//		end
//	
	
	wire [15:0] tone_19k_10pct;
	Mult_const_10pct Mult_const_10pct
	(
//		.clk(out_clk),
		.clk(clk_4_8),
		.rst(rst_geral),
		.run(~nrun_geral),
		
//		.strobe(cic_stb_2),
		.strobe(1),
		
//		.in(Regs_tone_19[n_delay-1]),
		.in(tone_19k_mult),
		
		.out(tone_19k_10pct)
	);
	/* ----------------------------------------------------------------------------------------------- */
	
	/* Multiplica os sinais por uma constante = 0.9 -> 90% */

	wire [16:0] sum_plus_dif_shift = {Dif_MPX_shift_adj[15],Dif_MPX_shift_adj} + {Regs_soma_MPX[17][15],Regs_soma_MPX[17]};

//	wire [15:0] out_stereo90pct;
//	Mult_const_90pct Mult_const_90pct
//	(
////		.clk(out_clk),
//		.clk(clk_4_8),
//		.rst(rst_geral),
//		.run(~nrun_geral),
//		
////		.strobe(cic_stb_2),
//		.strobe(1),
//		
//		.in(sum_plus_dif_shift),
//		
//		.out(out_stereo90pct)
//	);
	/* -------------------------------------------------- */
	
	/* ---------- Saida Stereo MPX encoder ---------- */
	reg [17:0] out_stereo;
	always @(posedge clk_4_8)
		if (rst || n_run)
			out_stereo <= 0;
		else
			//out_stereo <= out_stereo90pct + {tone_19k_10pct[15],tone_19k_10pct[15],tone_19k_10pct[15:2]};
			out_stereo <= {sum_plus_dif_shift,1'b0} + {{1{tone_19k_10pct[15]}},tone_19k_10pct,1'b0};

	/* ---------------------------------------------- */
		
//	wire [15:0] out_stereo = left_interp_reg;
	
	/* integra o sinal somado com um `w` -> integr(F(t) + w)dt gerando = (wt + int(f(t))dt) */
	/* transformando o sinal em phase */
	reg  [23:0] phase_MOD;
	wire [23:0] freq_1M = 24'd3495253;	// 1MHz

	////////// "Desloca" MPX /////////////
	reg [23:0] Sinal_MPX_shift;
	always @(posedge out_clk)
		if (rst_geral)
		begin
			Sinal_MPX_shift <= 24'd0;
		end else
		if (cic_stb_2)
		begin
				Sinal_MPX_shift <= {{3{out_stereo[17]}}, out_stereo, 3'd0}; // K = 2^-5\
				
		end	
	////////////////////////////////////////



/**************** Mini Teste modulando seno de 500Hz *********************/	
	reg  [23:0] phase_MOD_teste;
	always @(posedge out_clk)
	if (rst_geral || nrun_geral)
		phase_MOD_teste <= 0;
	else
		if (cic_stb_2)
			phase_MOD_teste <= phase_MOD_teste + 24'd1747;		// integrando W+F(t)

	wire [15:0] sin_in;
	cordic_z16 #(.bitwidth(16))
		cordic_z16_teste (
			.clock(out_clk), .reset(rst_geral), .enable(~nrun_geral && cic_stb_2), 
			.xi(16'h7FFF), .yi(16'd0), .zi(phase_MOD_teste), 
			.xo(sin_in), .yo(), .zo() );	
/*************************************************************************/	


	//// desloca acumula freq_1M e sinal_MPX_shift de 200KHz de de banda
	always @(posedge out_clk)
	if (rst_geral || nrun_geral)
		phase_MOD <= 0;
	else
		if (cic_stb_2)
			phase_MOD <= phase_MOD + freq_1M + Sinal_MPX_shift;		// integrando W+F(t)
	/***************************************************************************************/
	
	/* Modulacao FM - utiliza o phase_1M como fase de um cos (I) e um seno (Q)        */
	/* Modulando o signal_in em e enviando-o para uma frequencia intermediaria de 1MHz*/
	wire [15:0] FM_signal_i, FM_signal_q;
	cordic_z16 #(.bitwidth(16))
		cordic_z16 (
			.clock(out_clk), .reset(rst_geral), .enable(~nrun_geral && cic_stb_2), 
			.xi(16'h7FFF), .yi(16'd0), .zi(phase_MOD), 
			.xo(FM_signal_i), .yo(FM_signal_q), .zo() );	
	/**********************************************************************************/

	
	/* ------------------- Up Sampler no sinal modulado ----------------------------- */
	wire [15:0] FM_signal_i_interp;
	cic_interp  #(.bw(16),.N(4),.log2_of_max_rate(8))
		cic_interp2_i(.clock(out_clk),.reset(rst_geral),.enable(~nrun_geral),.rate(rate),
		  .strobe_in(cic_stb_2),.strobe_out(1),
		  .signal_in(FM_signal_i),.signal_out(FM_signal_i_interp));

	wire [15:0] FM_signal_q_interp;
	cic_interp  #(.bw(16),.N(4),.log2_of_max_rate(8))
		cic_interp2_q(.clock(out_clk),.reset(rst_geral),.enable(~nrun_geral),.rate(rate),
		  .strobe_in(cic_stb_2),.strobe_out(1),
		  .signal_in(FM_signal_q),.signal_out(FM_signal_q_interp));
	/*********************************************************************************/

	
	/* ------------------------------ Up Converter - Frequencia Portadora ----------------------------- */

	/*   Interface System Memory utilizado para alterar a frequencia do sinal FM seguindo a equacao   */
	/* Value = Freq_radio/Freq_op*2^24, onde freq_op é a frequencia de clk utilizado = 220 ou 200 MHz */
	wire [23:0] in_ism = 24'h7FFFFF;
	wire [23:0] Hfreq;
	ISM ISM (
		.probe(in_ism),
		.source(Hfreq));
	/*************************************************************************************************/
	

	/* integra o w gerando wt, para enviar o sinal para a frequencia desejada*/
//	wire [23:0] Freq_1M = 24'd87381; // 192MHz
	wire [23:0] Freq_1M = 24'd47233; // 355.2MHz
//	wire [23:0] Freq_1M = 24'd45990; // 364.8MHz
	//wire [23:0] Freq_1M = select ? 24'd77672 : 24'd87381;
	wire [23:0] Freq_Portadora = Hfreq - Freq_1M; // frequencia setada no ISM- 1MHz 
	reg  [23:0] Phase_Portadora;

	always @(posedge out_clk)
		if (rst_geral || nrun_geral)
			Phase_Portadora <= 0;
		else
			Phase_Portadora <= Phase_Portadora + Freq_Portadora;
	/************************************************************************/
	
	
	/* Envia o sinal FM para a Frequencia da Portadora recebido pelo In-System Source and Probe */
	wire [15:0] Saida_RF;
	cordic_z16 #(.bitwidth(16))
		cordic_z16_2 (
			.clock(out_clk), .reset(rst_geral), .enable(~nrun_geral), 
			.xi(FM_signal_i_interp), .yi(FM_signal_q_interp), .zi(Phase_Portadora), 
//			.xi(16'h7fff), .yi(16'd0), .zi(Phase_Portadora), 
			.xo(Saida_RF), .yo(), .zo() );
	/*******************************************************************************************/

	/* Band Pass Delta Sigma Modulator - modulador DAC capaz de transformar um sinal digital de alta frequencia (na regiao de fs/4) */
	/* em um sinal "analogico" enviando os ruidos de quantizacao (16bits para 1bit) para as baixas frequencias*/
	/* Banda utilizada - ..MHz */
	wire out_dsm;
	bpdsm bpdsm
	(
		.clk(out_clk),
		.rst(rst_geral),
		.run(~nrun_geral),
		
		.in(Saida_RF),
		
		.out(out_dsm)
    );
	/***************************************************************************************************************************************/	
	
	assign out_o = out_dsm; // saida do sinal RF modulado

		
//	/* --------------------------- - In-System de DEBUG - - ---------------------- */
	reg [11:0] addr_ram, addr_ram2;
	reg [15:0] LEFT_RAM_OUT, LEFT_RAM_OUT1, LEFT_RAM_OUT2, LEFT_RAM_OUT3, LEFT_RAM_OUT4;
	wire stop = (addr_ram == 12'b111111111111) ? 1'b1 : 1'b0;
	wire stop2 = (addr_ram2 == 12'b111111111111) ? 1'b1 : 1'b0;
////	teste2 teste_walter
////	(
////		.address(addr_ram2), .clock(out_clk), .data(FM_signal_i_interp),
////		.wren	(oii && ~stop2),
//////		.wren	(cic_stb_2 && oii && ~stop),
////		.q	(LEFT_RAM_OUT)
////	);		 
////
////	teste2 teste_walter1
////	(
////		.address(addr_ram2), .clock(out_clk), .data(Saida_RF),
////		.wren	(oii && ~stop2),
//////		.wren	(cic_stb_2 && oii && ~stop),
////		.q	(LEFT_RAM_OUT1)
////	);		 
//
	teste2 teste_walter2
	(
		.address(addr_ram), .clock(out_clk), .data(out_stereo),
		.wren	(cic_stb_2 && oii && ~stop),
		.q	(LEFT_RAM_OUT2)
	);	
	
	teste2 teste_walter3
	(
		.address(addr_ram), .clock(out_clk), .data(Dif_MPX_shift_adj),
		.wren	(cic_stb_2 && oii && ~stop),
		.q	(LEFT_RAM_OUT3)
	);	
	
	teste2 teste_walter4
	(
		.address(addr_ram), .clock(out_clk), .data({{1{tone_19k_10pct[15]}},tone_19k_10pct[15:1]}),
		.wren	(cic_stb_2 && oii && ~stop),
		.q	(LEFT_RAM_OUT4)
	);	
	
	wire oii2, oii;
	outro outro
	(
		.probe(oii2),
		.source(oii)
	);
	
	
	always @(posedge out_clk)
		if (rst_geral)
		begin
			addr_ram <= 12'd0;
			addr_ram2 <= 12'd0;
		end else
		begin
			if (oii)
			begin
				if (cic_stb_2)
				begin
					if (~stop)	
						addr_ram <= addr_ram + 12'd1;					
				end		
				if (~stop2)
					if (cic_stb_1)
					addr_ram2 <= addr_ram2 + 12'd1;
			end else
			begin
				addr_ram <= 0;
				addr_ram2 <= 0;
			end
		end			
	/* ---------------------------------------------------------------------------  */
		
	
endmodule
