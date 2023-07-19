library verilog;
use verilog.vl_types.all;
entity ControlUnit_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        I_data          : in     vl_logic_vector(15 downto 0);
        PC_set          : in     vl_logic_vector(15 downto 0);
        reset           : in     vl_logic;
        RF_Rp_zero      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ControlUnit_vlg_sample_tst;
