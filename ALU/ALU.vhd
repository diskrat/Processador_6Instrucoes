library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ALU is
    generic(
        WIDTH : integer := 6
    );
    port (
    x,y,z: in std_logic;
    a,b: in std_logic_vector(WIDTH - 1 downto 0);
    s: out std_logic_vector(WIDTH - 1 downto 0)
    ---co: out std_logic
  ) ;
end ALU;
architecture arch of ALU is

    component fullAdder6bit is
    port (
        ci: in std_logic;
        a,b: in std_logic_vector(WIDTH - 1 downto 0);
        s: out std_logic_vector(WIDTH - 1 downto 0)
        ---co: out std_logic
    ) ;

    end component;

    component ext6bit is
    port (
        x, y, z: in std_logic;
        a,b: in std_logic_vector(WIDTH - 1 downto 0);
        ia, ib: out std_logic_vector(WIDTH - 1 downto 0);
        ci: out std_logic
        ) ;
    end component;
    
    signal iAsig,iBsig: std_logic_vector(WIDTH - 1 downto 0);
    signal cin: std_logic;

begin
    u0: ext6bit port map(x,y,z,a,b,iAsig,iBsig,cin);
    u1: fullAdder6bit port map(cin,iAsig,iBsig,s);
end arch ; -- arch