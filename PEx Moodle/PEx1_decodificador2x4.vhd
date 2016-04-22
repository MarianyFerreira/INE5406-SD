-- PEx1: Decodificador2x4 com sinal de controle

-- Faça um decodificador 2x4 com um sinal de controle "en" que funcione da seguinte forma: quando "en=1", o decodificador funciona normalmente, quando "en=0", a saída é sempre "0000". (Exercício 4.1 do livro texto disponível no moodle).

library ieee;
use ieee.std_logic_1164.all;

entity decodificador2x4 is
    port(
        inpt: in std_logic_vector(1 downto 0);
        enable: in std_logic;
        outp: out std_logic_vector(3 downto 0)
        );
end decodificador2x4;

architecture decoder of decodificador2x4 is
begin

    outp <="0000" when enable = '0' else

        "0001" when inpt = "00" else
        "0010" when inpt = "01" else 
        "0100" when inpt = "10" else 
        "1000" when inpt = "11" else 
        "1111";


end decoder;

