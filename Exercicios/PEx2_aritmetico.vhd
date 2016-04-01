-- PEx2: Bloco aritmético de 4 operações

-- Faça um bloco aritmético que possui duas entradas inpt0 e inpt1 e execute 4 operações da seguinte forma, de acordo com um sinal de controle ctrl: (Exercício 7.1 do livro texto disponível no moodle)

--    inpt0+inpt1, se ctrl=00
--    inpt0-inpt1, se ctrl=01
--    inpt0+1, se ctrl=10
--    inpt0-1 se ctrl=11


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aritmetico is
    generic (width: integer:= 8);
    port (
        inpt0: in signed(width-1 downto 0);
        inpt1: in signed(width-1 downto 0);
        ctrl: in std_logic_vector(1 downto 0);
        outp: out signed(width-1 downto 0)
    );
end;

architecture arch of aritmetico is
begin
    outp <= inpt0 + inpt1 when ctrl <="00" else
    inpt0 - inpt1 when ctrl <="01" else
    inpt0 + 1 when ctrl <= "10" else
    inpt0 - 1;
    
end arch;
