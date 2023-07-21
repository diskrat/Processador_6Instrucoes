library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity I_Memory is
    generic(
        WIDTH: integer := 16;
        I_ADDR_MSIZE: integer := 16
    );
    port (
        addr: in std_logic_vector(I_ADDR_MSIZE - 1 downto 0);
        rd,clk: in std_logic;
        data: out std_logic_vector(WIDTH - 1 downto 0)
    ) ;
end I_Memory;

architecture main of I_Memory is
    type Qout is array(0 to 15) of std_logic_vector(WIDTH - 1 downto 0);  
    constant I_Men: Qout := (
        "0011000000000000",
        "0011000100000001",
        "0000001000000100",
        "0101001000000010",
        "0010000000000001",
        "0000001000000101",
        "0101001000000010",
        "0010000000000001",
        "0001000000001001",
        "1111000000000000",
        others => "1111000000000000"
    );

begin
    
    --- Read from RF using RF_Q
        process (clk)
        begin
            if rising_edge(clk) then
                if rd = '1' then
                    data <= I_Men(to_integer(unsigned(addr)));
                end if;
            end if;
        end process;
end;
