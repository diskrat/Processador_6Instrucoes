library ieee;
use ieee.std_logic_1164.all;

entity ciext is
    port(x, y, z: in std_logic;
	      ci: out std_logic);
end ;

architecture arc of ciext is
begin
    ci <=   (not(x) and not (y) and z) or
            (not (x) and y and not(z));
end ;