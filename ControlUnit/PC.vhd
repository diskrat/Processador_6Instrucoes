library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
     generic (
        WIDTH : integer := 16
    );
    port (
        clk     : in std_logic;
        PC_ld   : in std_logic;
		PC_sel  : in std_logic;
        PC_clr  : in std_logic;
        PC_inc  : in std_logic;
		PC_set : in std_logic_vector(WIDTH-1 DOWNTO 0);
		PC_offset : in std_logic_vector((WIDTH/2)-1 DOWNTO 0);
        PC_out  : out std_logic_vector(WIDTH-1 downto 0)
		  
    );
end PC ;

architecture Behav of PC is
    signal PC_reg : integer RANGE 0 to (2**WIDTH)-1;
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if (PC_clr = '1') then
                PC_reg <= 0;
            elsif (PC_ld = '1') then
					if (PC_sel = '0') then
                PC_reg <= PC_reg + to_integer(signed(PC_offset)) -1;
					else
					 PC_reg <= to_integer(signed(PC_set));
					end if;
            elsif (PC_inc = '1') then
                PC_reg <= PC_reg + 1;
            end if;
        end if;
    end process;

    PC_out <= std_logic_vector(to_signed(PC_reg, WIDTH));
end architecture Behav;