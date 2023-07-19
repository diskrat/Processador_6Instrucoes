LIBRARY ieee;
use ieee.std_logic_1164.all;

entity flipflop_d is
    port (
        D, c : IN std_logic;
        Q : OUT std_logic
    );
end;

architecture behav of flipflop_d is
begin
    process (D, c) begin
       if(rising_edge(c)) then
            Q <= D;
        END if;
    end process;
end;
