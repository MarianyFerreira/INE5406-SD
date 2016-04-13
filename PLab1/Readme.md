
	A placa DE2 fornece 18 interruptores, chamados SW17-0, que podem ser usados como entradas para um circuito, e 18 luzes vermelhas,chamadas LEDR 17-0, que podem ser usados para exibir valores de saída. A Figura 1 mostra uma entidade VHDL simples que usa essas opções e mostra seus estados sobre os LEDs. Uma vez que existem 18 interruptores e luzes é conveniente para representá-los como matrizes no código VHDL, como mostrado. Temos usado uma instrução de atribuição única para todas as 18 saídas LEDR, que é equivalente aos trabalhos individuais

	A placa DE2 tem hardwired conexões entre seu chip FPGA e os interruptores e luzes. Para usar SW17-0 e LEDR 17-0 é necessário incluir em seu projeto Quartus II as atribuições de pino corretas, que são dadas no Manual do Utilizador DE2. Por exemplo, o manual especifica que SW0 é conectado ao pino FPGA N25 e LEDR 0 está conectada ao pino AE23. Uma boa maneira de fazer as atribuições de pinos necessários é importar para o software Quartus II o arquivo chamado DE2 pin assignments.csv, que é fornecido no CD do sistema DE2 e, na seção Programa Universidade do site da Altera. O procedimento para fazer atribuições de pinos é descrito no tutorial Quartus II Introdução usando VHDL de Design, que também está disponível a partir de Altera. É importante perceber que as atribuições de pinos na DE2 arquivo pin assignments.csv são úteis apenas se os nomes dos pinos indicados no ficheiro são exatamente o mesmo que os nomes de portas utilizados na sua entidade VHDL. O arquivo usa o nomes SW [0] ... SW [17] e LEDR [0] ... LEDR [17] para os interruptores e luzes, que é a razão pela qual usamos estes nomes na Figura 1 (note que os usos do software Quartus II [ ] colchetes para elementos da matriz, enquanto os usos de sintaxe VHDL () parênteses).

Figura 1. Código VHDL que usa as chaves da placa DE2 e luzes.

		LIBRARY ieee;
		USE ieee.std_logic.1164.all;

- - Simple module that connects the SW switches to the LEDR lights
		
	ENTITY part1 IS PORT (
		SW   : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		LEDR : OUT  STD_LOGIC_VECTOR(17 DOWNTO 0)); -- red LEDs
	END part1;


ARCHITECTURE Behavior OF part1 IS
	BEGIN

		LEDR <= SW;
	
	END Behavior

Parte I

Execute os seguintes passos para implementar um circuito correspondente ao código da Figura 1 na placa DE2.

1	. Crie um novo projeto de Quartus II para o seu circuito. Escolha ciclone II EP2C35F672C6 como o chip alvo, que é o chip na placa FPGA Altera DE2.

2	. Criar uma entidade VHDL para o código na Figura 1 e incluí-lo em seu projeto.

3	. Inclua em seu projeto as atribuições de pinos necessários para a placa DE2, como discutido acima. Compilar o projeto.

4	. Faça o download do circuito compilado para o chip FPGA. Testar a funcionalidade do circuito, alternando os interruptores e observando os LEDs.


Figura 2

Parte A mostra um circuito de soma-de-produtos que implementa um multiplexador 2-para-1 com 's' a selecção de entrada. Se 's = 0' 'm' da multiplexers de saída é igual à entrada de 'x', e se 's = 1' a saída é igual a 'y'.

Parte B da figura dá uma tabela de verdade para este multiplexer, e parte c mostra seu símbolo circuito.

O multiplexador pode ser descrito pela seguinte declaração VHDL:

m <= (NOT (s) e X) ou (S e Y);

Você está a escrever uma entidade VHDL que inclui oito instruções de atribuição, como a mostrada acima para descrever o circuito dado na Figura 3 a. Este circuito tem duas entradas de oito bits, X e Y, e produz a saída de oito bits M. Se 's = 0' então M = X, enquanto que, se 's = 1', em seguida, M = Y. Nós nos referimos a este circuito como um de oito bits de largura multiplexer 2-para-1. Tem o símbolo circuito mostrado na Figura 3 b, em que X, Y e M são representadas como fios de oito-bits. Execute as etapas mostradas abaixo.



Parte II

1. Crie um novo projeto de Quartus II para o seu circuito.

2. Inclua seu arquivo VHDL para a grande multiplexer 2-para-1 de oito bits em seu projeto. Use interruptor SW 17 na placa DE2 como entrada 's', interruptores SW 7-0 como a entrada X e SW 15-8 como a entrada Y. Ligue os interruptores SW ao LEDR luzes vermelhas e ligar a saída M para as luzes verdes LEDG 7-0.

3. Inclua em seu projeto as atribuições de pinos necessários para a placa DE2. Como discutido na Parte I, essas atribuições de assegurar que as portas de entrada do seu código VHDL usará os pinos no FPGA ciclone II, que estão ligados ao
SW muda, e os portos de seu código VHDL de saída usará os pinos do FPGA
ligado ao LEDR e luzes LEDG.

4. Compilar o projeto.

5. Faça o download do circuito compilado para o chip FPGA. Testar a funcionalidade dos oito bits de largura multiplexer 2-para-1, alternando os interruptores e observando os LEDs.
Parte III Na Figura 2 mostrou um multiplexador 2-para-1, que seleciona entre as duas entradas x e y. Para esta parte considerar um circuito em que a saída "m" tem de ser seleccionado a partir de cinco entradas u, v, w, x, e y.


Parte III

Parte 'a' da Figura 4 mostra como podemos construir o multiplexer 5-para-1 exigido por meio de quatro multiplexers 2-para-1. O circuito utiliza um 3 bits de selecção de entrada S0 S1 S2 e mplements a tabela de verdade mostrado na Figura 4 b. Um símbolo de circuito para este multiplexer é dada em parte c da figura.

Chamar a partir da Figura 3 que uma ampla multiplexador de 2 para 1 de oito-bits pode ser construída usando oito ocorrências de um multiplexador de dois-para-um. Figura 5 aplica este conceito para definir um período de três bits de largura multiplexador 5-para-um. Ele contém três exemplos do circuito da Figura 4-A.

Execute os seguintes passos para implementar os três bits de largura multiplexer 5-para-1.

1. Crie um novo projeto de Quartus II para o seu circuito.
2. Criar uma entidade VHDL para os três bits de largura multiplexer 5-para-1. Conecte suas entradas de seleção para interruptores SW 17-15, e usar o restante 15 interruptores SW 14-0 para fornecer os cinco entradas 3 bits U para Y. Ligue os interruptores SW para as luzes vermelhas
ESQUERDA e ligar a saída M para as luzes LED verde 2-0.
3. Inclua em seu projeto as atribuições de pinos necessários para a placa DE2. Compilar o projeto.
4. Faça o download do circuito compilado para o chip FPGA. Testar a funcionalidade dos três bits de largura multiplexer 5-para-1, alternando os interruptores e observando os LEDs. Certifique-se de que cada uma das entradas de U para Y pode ser adequadamente seleccionado como a saída M
