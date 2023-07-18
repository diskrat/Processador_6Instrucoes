library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity fullAdder6bit is
    generic(
        WIDTH : integer := 6
    );
    port (
    ci: in std_logic;
    a,b: in std_logic_vector(WIDTH - 1 downto 0);
    s: out std_logic_vector(WIDTH - 1 downto 0)
    ---co: out std_logic
  ) ;
end fullAdder6bit;
architecture arch of fullAdder6bit is


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
    u5: full_adder port map(a(5),b(5),coS(4),open,s(5));
end arch ; -- arch