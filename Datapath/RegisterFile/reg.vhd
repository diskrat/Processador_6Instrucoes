LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg is
    generic(
        SIZE: integer := 16
    );
    port(
        I: in std_logic_vector( SIZE - 1 downto 0 );
        c_r : in std_logic;
        Q: out std_logic_vector( SIZE - 1 downto 0 )
    );
END;
architecture behav of reg is 
    component flipflop_d is
        port(
            D, c : in std_logic;
            Q : out std_logic
        );
    end component;
    begin 
        u0 : flipflop_d port map (D => I(0), c => c_r, Q => Q(0));
        u1 : flipflop_d port map (D => I(1), c => c_r, Q => Q(1));
        u2 : flipflop_d port map (D => I(2), c => c_r, Q => Q(2));
        u3 : flipflop_d port map (D => I(3), c => c_r, Q => Q(3));
        u4 : flipflop_d port map (D => I(4), c => c_r, Q => Q(4));
        u5 : flipflop_d port map (D => I(5), c => c_r, Q => Q(5));
        u6 : flipflop_d port map (D => I(6), c => c_r, Q => Q(6));
        u7 : flipflop_d port map (D => I(7), c => c_r, Q => Q(7));
        u8 : flipflop_d port map (D => I(8), c => c_r, Q => Q(8));
        u9 : flipflop_d port map (D => I(9), c => c_r, Q => Q(9));
        u10 : flipflop_d port map (D => I(10), c => c_r, Q => Q(10));
        u11 : flipflop_d port map (D => I(11), c => c_r, Q => Q(11));
        u12 : flipflop_d port map (D => I(12), c => c_r, Q => Q(12));
        u13 : flipflop_d port map (D => I(13), c => c_r, Q => Q(13));
        u14 : flipflop_d port map (D => I(14), c => c_r, Q => Q(14));
        u15 : flipflop_d port map (D => I(15), c => c_r, Q => Q(15));        
end architecture behav;