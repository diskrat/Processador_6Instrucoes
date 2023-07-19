library IEEE;
use ieee.std_logic_1164.all;
ENTITY mux2x1 IS
    PORT(
        I0,I1,s0 : IN std_logic;
        d : OUT std_logic
    );
END;

ARCHITECTURE behav OF mux2x1 IS

BEGIN
    d <= (I0 AND NOT s0) OR (I1 AND s0);
END;