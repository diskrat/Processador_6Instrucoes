library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity extensor is
    generic(
        WIDTH : integer := 6
    );
    port (
    x, y, z,e,clk: in std_logic;
    a,b: in std_logic_vector(WIDTH - 1 downto 0);
    led: out std_logic_vector(WIDTH - 1 downto 0)
  ) ;
end extensor;
architecture arch of extensor is
    component ALU is
        port (
        x,y,z: in std_logic;
        a,b: in std_logic_vector(WIDTH - 1 downto 0);
        s: out std_logic_vector(WIDTH - 1 downto 0)
        ---co: out std_logic
    ) ;
    end component;
    component regf6bLoad is
    port (
        clk,ld : in std_logic;
        I: in std_logic_vector(WIDTH - 1 downto 0);
        Q : out std_logic_vector(WIDTH - 1 downto 0)
    );
    end component;
    signal S: std_logic_vector(WIDTH - 1 DOWNTO 0);
    
    
begin
   u0: ALU port map (x,y,z,a,b,S);
   u1: regf6bLoad port map (clk,e,S,led);
end arch ; -- arch