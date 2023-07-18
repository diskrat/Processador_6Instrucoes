library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ext6bit is
    generic(
        WIDTH : integer := 6
    );
    port (
    x, y, z: in std_logic;
    a,b: in std_logic_vector(WIDTH - 1 downto 0);
    ia, ib: out std_logic_vector(WIDTH - 1 downto 0);
    ci: out std_logic
  ) ;
end ext6bit;
architecture arch of ext6bit is


    component abext is
    port(x, y, z, a, b: in std_logic;
	      ia, ib: out std_logic);
    end component;
    component ciext is
    port(x, y, z: in std_logic;
	      ci: out std_logic);
    end component;

    
begin
    u0: abext port map(x,y,z, a(0),b(0),ia(0),ib(0));
    u1: abext port map(x,y,z, a(1),b(1),ia(1),ib(1));
    u2: abext port map(x,y,z, a(2),b(2),ia(2),ib(2));
    u3: abext port map(x,y,z, a(3),b(3),ia(3),ib(3));
    u4: abext port map(x,y,z, a(4),b(4),ia(4),ib(4));
    u6:abext port map(x,y,z, a(5),b(5),ia(5),ib(5));
    v0: ciext port map (x,y,z, ci);
end arch ; -- arch