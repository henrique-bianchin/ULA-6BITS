library ieee;
use ieee.std_logic_1164.all;


entity som_sub_6bits_7seg is

	port(
		A, B : in std_logic_vector(5 downto 0);
		seletor: in std_logic_vector(3 downto 0);
		disp2 : out std_logic_vector(6 downto 0);
		disp2A : out std_logic_vector(6 downto 0);
		disp2B : out std_logic_vector(6 downto 0);
		disp1 : out std_logic_vector(6 downto 0);
		disp1A : out std_logic_vector(6 downto 0);
		disp1B : out std_logic_vector(6 downto 0);
		disp0 : out std_logic_vector(6 downto 0);
		led: out std_logic_vector (1 downto 0);
		overflow : out std_logic;
		zero : out std_logic;
		igual : out std_logic;
		menor : out std_logic
		);

		
end som_sub_6bits_7seg;

architecture rtl of som_sub_6bits_7seg is
	--SOMA
	component som_sub_6bits
		port(
			A, B : in std_logic_vector(5 downto 0);
			SomaOUSub: in std_logic;
			S : out std_logic_vector(5 downto 0);
			overflow : out std_logic
		);

		
end component;
	--MOSTRA A SOMA
	component seg71
		port(
			entrada : in std_logic_vector(5 downto 0);
			saida1 : out std_logic_vector(6 downto 0);
			saida2 : out std_logic_vector(6 downto 0);
			saida3 : out std_logic_vector(6 downto 0)
		);

		
		
end component;
	--DESLOCAMENTO
	component shifter
		port(
			A : in std_logic_vector(5 downto 0);
			shiftersaida: out std_logic_vector(5 downto 0);
			sel: in std_logic
);

end component;
	--OU LOGICO
	component funcaoor
		port(
			A, B : in std_logic_vector(5 downto 0);
			orsaida: out std_logic_vector(5 downto 0)
);

end component;
	--E LOGICO
	component funcaoand
		port(
			A, B : in std_logic_vector(5 downto 0);
			esaida: out std_logic_vector(5 downto 0)
);

end component;
	--NEGAÇÃO
	component funcaonot
		port(
			A, B : in std_logic_vector(5 downto 0);
			naosaida : out std_logic_vector(5 downto 0); 
			sel: in std_logic
);

end component;
	--COMPARADOR
 	component comparador_igualdade 
    	Port ( 
       		a      : in  STD_LOGIC_VECTOR (5 downto 0); 
        	b      : in  STD_LOGIC_VECTOR (5 downto 0);
			short : out STD_LOGIC;
        	equal : out STD_LOGIC                      
    	);
	 
end component;
	
--VARIAVEIS TEMPORARIAS
signal res_soma    : std_logic_vector(5 downto 0);
signal res_shifter : std_logic_vector(5 downto 0);
signal res_or      : std_logic_vector(5 downto 0);
signal res_and     : std_logic_vector(5 downto 0);
signal res_not     : std_logic_vector(5 downto 0);
signal res_final   : std_logic_vector(5 downto 0);
signal seletorbou1 : std_logic_vector(5 downto 0);
signal seletorsomasub       : std_logic;
signal seletoraoub : std_logic_vector(5 downto 0);
signal seletorshifter        : std_logic;
signal seletornot            : std_logic;
signal over : std_logic;

begin
		seletorbou1 <= "000001" when(seletor = "1100" or seletor = "1101") else B; --Faz o somador receber 1 ou B para somar ou subtrair
		seletorsomasub <= '1' when (seletor = "0001" or seletor = "1101") else '0'; 
		seletoraoub <= B when (seletor = "1010" or seletor = "1011") else A; --Faz o shifter decidir se vai para A OU B
		seletorshifter <= seletor(0); --Decide se vai para esquerda ou para direita
		seletornot <= seletor(0);	--Decide qual vai negar


		with seletor select
    	res_final <= res_soma    when "0000", -- A+B
						 res_soma    when "0001", -- A-B
						 res_or      when "0010", -- A OR B
                 	 res_and     when "0011", -- A AND B
                 	 res_not     when "0100", -- NOT A
						 res_not     when "0101", -- NOT B
						 res_shifter when "0110", -- SHIFTER PARA DIREITA DE A
						 res_shifter when "0111", -- SHIFTER PARA A ESQUERDA DE A
					    A			 	 when "1000", 
					    B 			 when "1001",
					    res_shifter when "1010", -- SHIFTER PARA A DIREITA DE B
					    res_shifter when "1011", -- SHIFTER PARA A ESQUERDA DE B 
					    res_soma 	 when "1100", -- A+1
					    res_soma 	 when "1101", -- A-1
					    "000000" 	 when others;
--PIN_AE12 led 16 igual
--PIN_AE13 led 11 para A e Led 5 para B negativo
--PIN AF13 LED 14 menor
--PIN_AD12 led 17 overflow
--PIN_AE15 LED 13 zero
		SS: som_sub_6bits
		port map(A => A, B => seletorbou1, SomaOUSub => seletorsomasub, S => res_soma, overflow => over);
		

		porta: seg71
		port map(entrada => res_final, saida1 => disp1, saida2 => disp0, saida3 =>disp2);
		zero <= '1' when res_final = "000000" else '0';   
		overflow <= over when (seletor = "0000" or seletor = "0001" or seletor = "1100" or seletor = "1101") else '0';

		shift: shifter
		port map(A => seletoraoub, shiftersaida => res_shifter, sel => seletorshifter);

		ou: funcaoor
		port map(A => A, B => B, orsaida => res_or);
		
		ee:funcaoand
    	port map(A => A, B => B, esaida => res_and);

		negacao: funcaonot
		port map(A => A, B => B, naosaida => res_not, sel => seletornot);
		
		comp_igual: comparador_igualdade 
		port map(a => A, b => B, equal => igual, short => menor);
		
		porta_A: seg71
		port map(entrada => A, saida1 => disp2A, saida2 => disp1A);
		led(1) <= A(5);
		led(0) <= B(5);
		porta_B: seg71
		port map(entrada => B, saida1 => disp2B, saida2 => disp1B);
end rtl;