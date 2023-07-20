library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity Mux3x1_8bit is
    generic(
        WIDTH : integer := 8
    );
  port (
    s:in  std_logic_vector(1 downto 0);
    a,b,c: in std_logic_vector(WIDTH - 1 downto 0);

    q: out std_logic_vector(WIDTH - 1 downto 0)
  ) ;
end Mux3x1_8bit;
architecture arch of Mux3x1_8bit is
begin
with s select
q <= a when "00",
     b when "01",
     c when "10",
     "XXXXXXXX" when others;

end arch ; -- Mux3x1_8bitrch