library ieee;
use ieee.std_logic_1164.all;

entity funcaoand is
port(
    A, B : in std_logic_vector(5 downto 0);
    esaida: out std_logic_vector(5 downto 0)
);
end funcaoand;


architecture doend of funcaoand is


begin
    esaida <= A AND B;


end doend;

