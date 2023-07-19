library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        x               : in     vl_logic;
        y               : in     vl_logic;
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        s               : out    vl_logic_vector(15 downto 0)
    );
end ALU;
