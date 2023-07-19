library verilog;
use verilog.vl_types.all;
entity RegisterFile_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        RenP            : in     vl_logic;
        RenQ            : in     vl_logic;
        RP_addr         : in     vl_logic_vector(3 downto 0);
        RQ_addr         : in     vl_logic_vector(3 downto 0);
        W_addr          : in     vl_logic_vector(3 downto 0);
        Wdata           : in     vl_logic_vector(15 downto 0);
        Wen             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end RegisterFile_vlg_sample_tst;
