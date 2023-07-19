library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(a, b, ci: in bit;
	      s, co: out bit);
end full_adder;

architecture arc of full_adder is
begin
    s <= (a xor b) xor ci;
	 co <= (a and b) or (a and ci) or (b and ci);
end arc;