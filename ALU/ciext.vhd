library ieee;
use ieee.std_logic_1164.all;

entity ciext is
    port(x, y: in std_logic;
	      ci: out std_logic);
end ;

architecture arc of ciext is
begin
    ci <=   (x and not (y));
end ;