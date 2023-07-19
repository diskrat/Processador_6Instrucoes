library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        RF_Rp_zero      : in     vl_logic;
        I_data          : in     vl_logic_vector(15 downto 0);
        PC_set          : in     vl_logic_vector(15 downto 0);
        I_rd            : out    vl_logic;
        D_rd            : out    vl_logic;
        D_wr            : out    vl_logic;
        RF_W_Wen        : out    vl_logic;
        RF_Rp_Ren       : out    vl_logic;
        RF_Rq_Ren       : out    vl_logic;
        RF_W_addr       : out    vl_logic_vector(3 downto 0);
        RF_Rp_addr      : out    vl_logic_vector(3 downto 0);
        RF_Rq_addr      : out    vl_logic_vector(3 downto 0);
        RF_Sel          : out    vl_logic_vector(1 downto 0);
        ALU_Sel         : out    vl_logic_vector(1 downto 0);
        D_addr          : out    vl_logic_vector(7 downto 0);
        RF_W_Data       : out    vl_logic_vector(7 downto 0);
        I_addr          : out    vl_logic_vector(15 downto 0)
    );
end ControlUnit;
