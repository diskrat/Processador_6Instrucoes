library verilog;
use verilog.vl_types.all;
entity RegisterFile_vlg_check_tst is
    port(
        RPdata          : in     vl_logic_vector(15 downto 0);
        RQdata          : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end RegisterFile_vlg_check_tst;
