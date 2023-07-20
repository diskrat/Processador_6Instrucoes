library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity Mux2x1_8bit is
    generic(
        WIDTH : integer := 8
    );
  port (
    s:in  std_logic;
    a,b: in std_logic_vector(WIDTH - 1 downto 0);

    q: out std_logic_vector(WIDTH - 1 downto 0)
  ) ;
end Mux2x1_8bit;
architecture arch of Mux2x1_8bit is
begin
with s select
q <= a when '0',
     b when '1';

end arch ; -- Mux2x1_8bitrch