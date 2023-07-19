library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity Mux3x1_16bit is
    generic(
        WIDTH : integer := 16
    );
  port (
    s:in  std_logic_vector (1 downto 0);
    a,b: in std_logic_vector(WIDTH - 1 downto 0);
    c: in std_logic_vector (7 downto 0);

    q: out std_logic_vector(WIDTH - 1 downto 0)
  ) ;
end Mux3x1_16bit;
architecture arch of Mux3x1_16bit is
begin
with s select
q <= a when "00",
     b when "01",
     "00000000" & c when "10",
     "XXXXXXXXXXXXXXXX"when others;

end arch ; -- Mux3x1_16bitrch