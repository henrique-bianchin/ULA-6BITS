library ieee;
use ieee.std_logic_1164.all;

entity funcaoor is
port(
    A, B : in std_logic_vector(5 downto 0);
    orsaida: out std_logic_vector(5 downto 0)
);
end funcaoor;


architecture door of funcaoor is


begin
    orsaida <= A OR B;

end door;