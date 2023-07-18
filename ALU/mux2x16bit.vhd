library IEEE;
use ieee.std_logic_1164.all;
ENTITY mux2x16bit IS
    generic(
        WIDTH: integer := 6
    );
    PORT(
        A,B: IN std_logic_vector(WIDTH - 1 DOWNTO 0);
        S: IN std_logic;
        R: OUT std_logic_vector(WIDTH - 1 DOWNTO 0)
    );
END;
ARCHITECTURE behav OF mux2x16bit IS
COMPONENT Mux2x1 IS
    PORT(
        I0,I1,s0 : IN std_logic;
        d : OUT std_logic
    );
END COMPONENT;
BEGIN
    u0: Mux2x1 PORT MAP(A(0), B(0),S,R(0));
    u1: Mux2x1 PORT MAP(A(1), B(1),S,R(1));
    u2: Mux2x1 PORT MAP(A(2), B(2),S,R(2));
    u3: Mux2x1 PORT MAP(A(3), B(3),S,R(3));
    u4: Mux2x1 PORT MAP(A(4), B(4),S,R(4));
    u5: Mux2x1 PORT MAP(A(5), B(5),S,R(5));
END;