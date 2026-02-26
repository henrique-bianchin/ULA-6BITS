library ieee;
use ieee.std_logic_1164.all;

entity shifter is
port(
    A : in std_logic_vector(5 downto 0);
    shiftersaida: out std_logic_vector(5 downto 0);
    sel: in std_logic
);
end shifter;

architecture mudar of shifter is
    signal ctempr, ctempl : std_logic_vector(5 downto 0);
begin
    
    ctempl(5) <= A(4);
    ctempl(4) <= A(3);
    ctempl(3) <= A(2);
    ctempl(2) <= A(1);
    ctempl(1) <= A(0);
    ctempl(0) <= '0';
    
    ctempr(0) <= A(1);
    ctempr(1) <= A(2);
    ctempr(2) <= A(3);
    ctempr(3) <= A(4);
    ctempr(4) <= A(5);
    ctempr(5) <= '0';

    with sel select
        shiftersaida <= ctempr when '0', 
                        ctempl when others; 
    
end mudar;
	





	
	




