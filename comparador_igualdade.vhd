library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity comparador_igualdade is
    Port ( 
        a      : in  STD_LOGIC_VECTOR (5 downto 0);
        b      : in  STD_LOGIC_VECTOR (5 downto 0);
        short: out STD_LOGIC;
        equal : out STD_LOGIC                      
    );
end comparador_igualdade;


architecture Estrutural of comparador_igualdade is
    component full_adder
    port(
	    x, y, cin : in std_logic;
	    s, cout : out std_logic
	    );
	end component;

    
    signal b_not : STD_LOGIC_VECTOR(5 downto 0);
    signal c     : STD_LOGIC_VECTOR(6 downto 0); 
    signal s     : STD_LOGIC_VECTOR(5 downto 0);

begin

    c(0) <= '1'; 
    
    b_not(0) <= not b(0);
    b_not(1) <= not b(1);
    b_not(2) <= not b(2);
    b_not(3) <= not b(3);
    b_not(4) <= not b(4);
    b_not(5) <= not b(5);
    
    SC0: full_adder port map (x => a(0), y => b_not(0), cin  => c(0),s => s(0), cout => c(1) );
    SC1: full_adder port map (x => a(1), y => b_not(1), cin  => c(1),s => s(1),cout => c(2));
    SC2: full_adder port map (x => a(2), y => b_not(2), cin  => c(2),s => s(2),cout => c(3));
    SC3: full_adder port map (x => a(3), y => b_not(3), cin  => c(3),s => s(3),cout => c(4));
    SC4: full_adder port map (x => a(4), y => b_not(4), cin => c(4), s => s(4), cout => c(5));
    SC5: full_adder port map (x => a(5), y => b_not(5), cin => not c(5), s => s(5), cout => c(6));
    short <= c(6);

    
    equal <= not (s(0) or s(1) or s(2) or s(3) or s(4) or (not(s(5))));
end Estrutural;
