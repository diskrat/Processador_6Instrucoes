library ieee;
use ieee.std_logic_1164.all;

entity abext is
    port(x, y, a, b: in std_logic;
	      ia, ib: out std_logic);
end ;

architecture arc of abext is
begin
        --x'y'a +x'ya+ x'ya
    ia <=  a and not(x and y);

    ib <=   (b and not(x) and y) xor (not(b) and x and not(y));
            
end arc;