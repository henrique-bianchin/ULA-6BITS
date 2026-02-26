library ieee;
use ieee.std_logic_1164.all;

entity funcaoand is
port(
    A, B : in std_logic_vector(5 downto 0);
    naosaida: out std_logic_vector(5 downto 0);
    sel : in std_logic
);
end funcaoand; 

architecture doend of funcaoand is
begin

    process(A, B, sel)
    begin
        if sel = '0' then
            
            naosaida(0) <= NOT A(0);
            naosaida(1) <= NOT A(1);
            naosaida(2) <= NOT A(2);
            naosaida(3) <= NOT A(3);
            naosaida(4) <= NOT A(4);
            naosaida(5) <= NOT A(5);
        else 
          
            naosaida(0) <= NOT B(0);
            naosaida(1) <= NOT B(1);
            naosaida(2) <= NOT B(2);
            naosaida(3) <= NOT B(3);
            naosaida(4) <= NOT B(4);
            naosaida(5) <= NOT B(5);
        end if;
    end process;

end doend;