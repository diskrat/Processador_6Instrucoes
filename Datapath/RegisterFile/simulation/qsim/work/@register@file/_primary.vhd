library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        Wdata           : in     vl_logic_vector(15 downto 0);
        W_addr          : in     vl_logic_vector(3 downto 0);
        RP_addr         : in     vl_logic_vector(3 downto 0);
        RQ_addr         : in     vl_logic_vector(3 downto 0);
        Wen             : in     vl_logic;
        RenP            : in     vl_logic;
        RenQ            : in     vl_logic;
        clk             : in     vl_logic;
        RPdata          : out    vl_logic_vector(15 downto 0);
        RQdata          : out    vl_logic_vector(15 downto 0)
    );
end RegisterFile;
