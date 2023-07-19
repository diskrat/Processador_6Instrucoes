library ieee;
use ieee.std_logic_1164.all;

ENTITY decoder IS
    GENERIC(
        WIDTH: integer := 4;
        OUT_SIZE: integer := 16
    );
    PORT(
        A: in std_logic_vector(WIDTH - 1 downto 0);
        E: IN std_logic;
        Y: out std_logic_vector(OUT_SIZE - 1 downto 0)
    ); 
END;

ARCHITECTURE behav OF decoder IS
    SIGNAL out_aux: std_logic_vector(OUT_SIZE - 1 DOWNTO 0);
    SIGNAL in_aux : std_logic_vector(WIDTH DOWNTO 0);
    BEGIN
        in_aux <= E & A(3) & A(2) & A(1) & A(0) ;
        WITH in_aux SELECT
            out_aux <= 
            "0000000000000001" WHEN "10000",
            "0000000000000010" WHEN "10001",
            "0000000000000100" WHEN "10010",
            "0000000000001000" WHEN "10011",
            "0000000000010000" WHEN "10100",
            "0000000000100000" WHEN "10101",
            "0000000001000000" WHEN "10110",
            "0000000010000000" WHEN "10111",
            "0000000100000000" WHEN "11000",
            "0000001000000000" WHEN "11001",
            "0000010000000000" WHEN "11010",
            "0000100000000000" WHEN "11011",
            "0001000000000000" WHEN "11100",
            "0010000000000000" WHEN "11101",
            "0100000000000000" WHEN "11110",
            "1000000000000000" WHEN "11111",            
            "0000000000000000" WHEN OTHERS; 
            Y(0) <= out_aux(0);
            Y(1) <= out_aux(1);
            Y(2) <= out_aux(2);
            Y(3) <= out_aux(3);
            Y(4) <= out_aux(4);
            Y(5) <= out_aux(5);
            Y(6) <= out_aux(6);
            Y(7) <= out_aux(7);
            Y(8) <= out_aux(8);
            Y(9) <= out_aux(9);
            Y(10) <= out_aux(10);
            Y(11) <= out_aux(11);
            Y(12) <= out_aux(12);
            Y(13) <= out_aux(13);
            Y(14) <= out_aux(14);
            Y(15) <= out_aux(15);
END;
