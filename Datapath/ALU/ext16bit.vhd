library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ext16bit is
    generic(
        WIDTH : integer :=16
    );
    port (
    x, y: in std_logic;
    a,b: in std_logic_vector(WIDTH - 1 downto 0);
    ia, ib: out std_logic_vector(WIDTH - 1 downto 0);
    ci: out std_logic
  ) ;
end ext16bit;
architecture arch of ext16bit is


    component abext is
    port(x, y, a, b: in std_logic;
	      ia, ib: out std_logic);
    end component;
    component ciext is
    port(x, y: in std_logic;
	      ci: out std_logic);
    end component;

    
begin
    u0:abext port map(x,y, a(0),b(0),ia(0),ib(0));
    u1:abext port map(x,y, a(1),b(1),ia(1),ib(1));
    u2:abext port map(x,y, a(2),b(2),ia(2),ib(2));
    u3:abext port map(x,y, a(3),b(3),ia(3),ib(3));
    u4:abext port map(x,y, a(4),b(4),ia(4),ib(4));
    u5:abext port map(x,y, a(5),b(5),ia(5),ib(5));
    u6:abext port map(x,y, a(6),b(6),ia(6),ib(6));
    u7:abext port map(x,y, a(7),b(7),ia(7),ib(7));
    u8:abext port map(x,y, a(8),b(8),ia(8),ib(8));
    u9:abext port map(x,y, a(9),b(9),ia(9),ib(9));
    u10:abext port map(x,y, a(10),b(10),ia(10),ib(10));
    u11:abext port map(x,y, a(11),b(11),ia(11),ib(11));
    u12:abext port map(x,y, a(12),b(12),ia(12),ib(12));
    u13:abext port map(x,y, a(13),b(13),ia(13),ib(13));
    u14:abext port map(x,y, a(14),b(14),ia(14),ib(14));
    u15:abext port map(x,y, a(15),b(15),ia(15),ib(15));
    
    
    v0: ciext port map (x,y, ci);
end arch ; -- arch