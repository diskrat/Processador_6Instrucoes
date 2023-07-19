library verilog;
use verilog.vl_types.all;
entity Processador_7Instrucoes_vlg_check_tst is
    port(
        RP_data         : in     vl_logic_vector(15 downto 0);
        RQ_data         : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Processador_7Instrucoes_vlg_check_tst;
