library verilog;
use verilog.vl_types.all;
entity Processador_7Instrucoes is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        RP_data         : out    vl_logic_vector(15 downto 0);
        RQ_data         : out    vl_logic_vector(15 downto 0)
    );
end Processador_7Instrucoes;
