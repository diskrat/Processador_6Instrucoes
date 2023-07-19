library ieee;
use ieee.std_logic_1164.all;

entity IR is
     generic (
        WIDTH : integer := 16
    );
    port (
        clk    : in  std_logic;
        IR_ld  : in  std_logic;
        IR_in  : in  std_logic_vector(WIDTH-1 downto 0);
        IR_out : out std_logic_vector(WIDTH-1 downto 0)
    );
end IR ;

architecture Behavioral of IR is
    signal IR_reg : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if (IR_ld = '1') then
                IR_reg <= IR_in;
            end if;
        end if;
    end process;

    IR_out <= IR_reg;
end architecture Behavioral;