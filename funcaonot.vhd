library ieee;
use ieee.std_logic_1164.all;

entity funcaonot is
port(
	A, B : in std_logic_vector(5 downto 0);
	naosaida : out std_logic_vector(5 downto 0); 
	sel: in std_logic
);
end funcaonot;

architecture doend of funcaonot is

begin
	
	with sel select
		naosaida <= NOT A when '0',  
		            NOT B when '1';
		            

end doend;