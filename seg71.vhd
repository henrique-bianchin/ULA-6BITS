library ieee;
use ieee.std_logic_1164.all;

entity seg71 is
port(
    entrada : in std_logic_vector(5 downto 0); -- Aumentado para 6 bits (-32 a 31)
    saida1 : out std_logic_vector(6 downto 0); -- Dezenas
    saida2 : out std_logic_vector(6 downto 0); -- Unidades
    saida3 : out std_logic_vector(6 downto 0)  -- Sinal
);
end seg71;

architecture arq of seg71 is
  
begin

    with entrada(5) select
        saida3 <= 
        "1111110" when '1', 
        "0000000" when others;

    with entrada select
        saida1 <= 
        -- FAIXA NEGATIVA (-32 a -10)
        "0110000" when "100000", -- -32 (Mostra 3)
        "0110000" when "100001", -- -31 (Mostra 3)
        "0110000" when "100010", -- -30 (Mostra 3)
        "0100100" when "100011", -- -29 (Mostra 2)
        "0100100" when "100100", -- -28
        "0100100" when "100101", -- -27
        "0100100" when "100110", -- -26
        "0100100" when "100111", -- -25
        "0100100" when "101000", -- -24
        "0100100" when "101001", -- -23
        "0100100" when "101010", -- -22
        "0100100" when "101011", -- -21
        "0100100" when "101100", -- -20
        "1111001" when "101101", -- -19 (Mostra 1)
        "1111001" when "101110", -- -18
        "1111001" when "101111", -- -17
        "1111001" when "110000", -- -16
        "1111001" when "110001", -- -15
        "1111001" when "110010", -- -14
        "1111001" when "110011", -- -13
        "1111001" when "110100", -- -12
        "1111001" when "110101", -- -11
        "1111001" when "110110", -- -10
        
        -- FAIXA POSITIVA (10 a 31)
        "1111001" when "001010", -- 10 (Mostra 1)
        "1111001" when "001011", -- 11
        "1111001" when "001100", -- 12
        "1111001" when "001101", -- 13
        "1111001" when "001110", -- 14
        "1111001" when "001111", -- 15
        "1111001" when "010000", -- 16
        "1111001" when "010001", -- 17
        "1111001" when "010010", -- 18
        "1111001" when "010011", -- 19
        "0100100" when "010100", -- 20 (Mostra 2)
        "0100100" when "010101", -- 21
        "0100100" when "010110", -- 22
        "0100100" when "010111", -- 23
        "0100100" when "011000", -- 24
        "0100100" when "011001", -- 25
        "0100100" when "011010", -- 26
        "0100100" when "011011", -- 27
        "0100100" when "011100", -- 28
        "0100100" when "011101", -- 29
        "0110000" when "011110", -- 30 (Mostra 3)
        "0110000" when "011111", -- 31 (Mostra 3)
        
        -- Zeros à esquerda e números < 10 ficam APAGADOS
        "1111111" when others; 

    -------------------------------------------------------------------
    -- SAIDA 2: UNIDADES
    -- Usa os mesmos códigos do seu "saida2" original
    -------------------------------------------------------------------
    with entrada select
        saida2 <= 
        -- NEGATIVOS (Complemento de 2)
        "0100100" when "100000", -- -32 (Termina em 2)
        "1111001" when "100001", -- -31 (Termina em 1)
        "1000000" when "100010", -- -30 (Termina em 0)
        "0010000" when "100011", -- -29 (Termina em 9)
        "0000000" when "100100", -- -28 (Termina em 8)
        "1111000" when "100101", -- -27 (Termina em 7)
        "0000010" when "100110", -- -26 (Termina em 6)
        "0010010" when "100111", -- -25 (Termina em 5)
        "0011001" when "101000", -- -24 (Termina em 4)
        "0110000" when "101001", -- -23 (Termina em 3)
        "0100100" when "101010", -- -22 (Termina em 2)
        "1111001" when "101011", -- -21 (Termina em 1)
        "1000000" when "101100", -- -20 (Termina em 0)
        "0010000" when "101101", -- -19 (Termina em 9)
        "0000000" when "101110", -- -18 (Termina em 8)
        "1111000" when "101111", -- -17 (Termina em 7)
        "0000010" when "110000", -- -16 (Termina em 6)
        "0010010" when "110001", -- -15 (Termina em 5)
        "0011001" when "110010", -- -14 (Termina em 4)
        "0110000" when "110011", -- -13 (Termina em 3)
        "0100100" when "110100", -- -12 (Termina em 2)
        "1111001" when "110101", -- -11 (Termina em 1)
        "1000000" when "110110", -- -10 (Termina em 0)
        "0010000" when "110111", -- -9  (Termina em 9)
        "0000000" when "111000", -- -8  (Termina em 8)
        "1111000" when "111001", -- -7  (Termina em 7)
        "0000010" when "111010", -- -6  (Termina em 6)
        "0010010" when "111011", -- -5  (Termina em 5)
        "0011001" when "111100", -- -4  (Termina em 4)
        "0110000" when "111101", -- -3  (Termina em 3)
        "0100100" when "111110", -- -2  (Termina em 2)
        "1111001" when "111111", -- -1  (Termina em 1)
        
        -- POSITIVOS
        "1000000" when "000000", -- 0
        "1111001" when "000001", -- 1
        "0100100" when "000010", -- 2
        "0110000" when "000011", -- 3
        "0011001" when "000100", -- 4
        "0010010" when "000101", -- 5
        "0000010" when "000110", -- 6
        "1111000" when "000111", -- 7
        "0000000" when "001000", -- 8
        "0010000" when "001001", -- 9
        "1000000" when "001010", -- 10 (Termina em 0)
        "1111001" when "001011", -- 11 (Termina em 1)
        "0100100" when "001100", -- 12 (Termina em 2)
        "0110000" when "001101", -- 13 (Termina em 3)
        "0011001" when "001110", -- 14 (Termina em 4)
        "0010010" when "001111", -- 15 (Termina em 5)
        "0000010" when "010000", -- 16 (Termina em 6)
        "1111000" when "010001", -- 17 (Termina em 7)
        "0000000" when "010010", -- 18 (Termina em 8)
        "0010000" when "010011", -- 19 (Termina em 9)
        "1000000" when "010100", -- 20 (Termina em 0)
        "1111001" when "010101", -- 21 (Termina em 1)
        "0100100" when "010110", -- 22 (Termina em 2)
        "0110000" when "010111", -- 23 (Termina em 3)
        "0011001" when "011000", -- 24 (Termina em 4)
        "0010010" when "011001", -- 25 (Termina em 5)
        "0000010" when "011010", -- 26 (Termina em 6)
        "1111000" when "011011", -- 27 (Termina em 7)
        "0000000" when "011100", -- 28 (Termina em 8)
        "0010000" when "011101", -- 29 (Termina em 9)
        "1000000" when "011110", -- 30 (Termina em 0)
        "1111001" when "011111", -- 31 (Termina em 1)
        
        "1111111" when others; -- Segurança (tudo apagado)

end arq;