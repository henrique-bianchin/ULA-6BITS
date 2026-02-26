library ieee;
use ieee.std_logic_1164.all;

entity som_sub_6bits is
port(
	A, B : in std_logic_vector(5 downto 0);
	SomaOUSub: in std_logic;
	S : out std_logic_vector(5 downto 0);
	overflow : out std_logic
);
end som_sub_6bits;


architecture rtl of som_sub_6bits is

component full_adder
port(
	x, y, cin : in std_logic;
	s, cout : out std_logic
);
end component;

signal B_inv : std_logic_vector(5 downto 0);
signal ctemp : std_logic_vector(6 downto 0);



begin

	B_inv(0) <= B(0) xor somaOUSub;
	B_inv(1) <= B(1) xor somaOUSub;
	B_inv(2) <= B(2) xor somaOUSub;
	B_inv(3) <= B(3) xor somaOUSub;
	B_inv(4) <= B(4) xor somaOUSub;
	B_inv(5) <= B(5) xor somaOUSub;

	ctemp(0) <= SomaOUSub;

	FA0: full_adder port map(x => A(0), y => B_inv(0), cin => ctemp(0), s => S(0), cout => ctemp(1));
	FA1: full_adder port map(x => A(1), y => B_inv(1), cin => ctemp(1), s => S(1), cout => ctemp(2));
	FA2: full_adder port map(x => A(2), y => B_inv(2), cin => ctemp(2), s => S(2), cout => ctemp(3));
	FA3: full_adder port map(x => A(3), y => B_inv(3), cin => ctemp(3), s => S(3), cout => ctemp(4));
	FA4: full_adder port map(x => A(4), y => B_inv(4), cin => ctemp(4), s => S(4), cout => ctemp(5));
	FA5: full_adder port map(x => A(5), y => B_inv(5), cin => ctemp(5), s => S(5), cout => ctemp(6));

	overflow <= ctemp(6) xor ctemp(5);

end rtl;