library ieee;
use ieee.std_logic_1164.all;

entity flipflopD is
    port (
        clk,D : in std_logic;
        Q : out std_logic

    );
end flipflopD;

architecture rtl of flipflopD is

begin
    process(clk,D)
    begin
        if(rising_edge(clk)) then
            Q <= D;
        END if;
    end process;

end architecture;