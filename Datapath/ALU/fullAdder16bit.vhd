library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity fullAdder16bit is
    generic(
        WIDTH : integer := 16
    );
    port (
    ci: in std_logic;
    a,b: in std_logic_vector(WIDTH - 1 downto 0);
    s: out std_logic_vector(WIDTH - 1 downto 0)
    ---co: out std_logic
  ) ;
end fullAdder16bit;
architecture arch of fullAdder16bit is


    component full_adder is
        port(
            a,b,ci: in std_logic;
            co,s: out std_logic
        );
    end component;
    signal coS: std_logic_vector(WIDTH - 2 downto 0);

begin
    u0: full_adder port map(a(0),b(0),ci,coS(0),s(0));
    u1: full_adder port map(a(1),b(1),coS(0),coS(1),s(1));
    u2: full_adder port map(a(2),b(2),coS(1),coS(2),s(2));
    u3: full_adder port map(a(3),b(3),coS(2),coS(3),s(3));
    u4: full_adder port map(a(4),b(4),coS(3),coS(4),s(4));
    u5: full_adder port map(a(5),b(5),coS(4),coS(5),s(5));
    u6: full_adder port map(a(6),b(6),coS(5),coS(6),s(6));
    u7: full_adder port map(a(7),b(7),coS(6),coS(7),s(7));
    u8: full_adder port map(a(8),b(8),coS(7),coS(8),s(8));
    u9: full_adder port map(a(9),b(9),coS(8),coS(9),s(9));
    u10: full_adder port map(a(10),b(10),coS(9),coS(10),s(10));
    u11: full_adder port map(a(11),b(11),coS(10),coS(11),s(11));
    u12: full_adder port map(a(12),b(12),coS(11),coS(12),s(12));
    u13: full_adder port map(a(13),b(13),coS(12),coS(13),s(13));
    u14: full_adder port map(a(14),b(14),coS(13),coS(14),s(14));
    u15: full_adder port map(a(15),b(15),coS(14),open,s(15));


    


end arch ; -- arch