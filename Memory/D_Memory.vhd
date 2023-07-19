library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity D_Memory is
    generic (
        N : natural := 8; -- Numero de bits para endereÃ§amento
        M : natural := 16 -- Numero de bits para dados
    );
    port (
        clk     : in  std_logic;
        addr    : in  std_logic_vector(N-1 downto 0);
        Ren      : in  std_logic;
        Wen      : in  std_logic;
        Wdata  : in  std_logic_vector(M-1 downto 0);
        Rdata  : out std_logic_vector(M-1 downto 0)
         
    );
end entity D_Memory;

architecture Behavioral of D_Memory is
    type MemoryArray is array (natural range <>) of std_logic_vector(M-1 downto 0);
    signal memory : MemoryArray(0 to 2**N - 1);
    signal data_reg : std_logic_vector(M-1 downto 0);
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if Ren = '1' and Wen = '0' then
                data_reg <= memory(to_integer(unsigned(addr)));
            elsif Ren = '0' and Wen = '1' then
                memory(to_integer(unsigned(addr))) <= Wdata;
            end if;
        end if;
    end process;

    Rdata <= data_reg;
end architecture Behavioral;