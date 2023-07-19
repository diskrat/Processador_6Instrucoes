library verilog;
use verilog.vl_types.all;
entity ControlUnit_vlg_check_tst is
    port(
        ALU_Sel         : in     vl_logic_vector(1 downto 0);
        D_addr          : in     vl_logic_vector(7 downto 0);
        D_rd            : in     vl_logic;
        D_wr            : in     vl_logic;
        I_addr          : in     vl_logic_vector(15 downto 0);
        I_rd            : in     vl_logic;
        RF_Rp_addr      : in     vl_logic_vector(3 downto 0);
        RF_Rp_Ren       : in     vl_logic;
        RF_Rq_addr      : in     vl_logic_vector(3 downto 0);
        RF_Rq_Ren       : in     vl_logic;
        RF_Sel          : in     vl_logic_vector(1 downto 0);
        RF_W_addr       : in     vl_logic_vector(3 downto 0);
        RF_W_Data       : in     vl_logic_vector(7 downto 0);
        RF_W_Wen        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ControlUnit_vlg_check_tst;
