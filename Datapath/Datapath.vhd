library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Datapath is
    generic(
        WIDTH: integer := 16;
        ADDR_MSIZE: integer := 4
    );
    port (
        --- in
        clk,
        W_wr, Rp_rd, Rq_rd,
        RF_s1,Rf_s0,
        alu_s1,alu_s0: in std_logic; 
        R_data: in std_logic_vector(WIDTH - 1 downto 0);
        RF_W_data: in std_logic_vector(7 downto 0);
        RF_W_addr,RF_Rp_addr,RF_Rq_addr: in std_logic_vector(ADDR_MSIZE-1 downto 0);
        --- Out
        W_data: out std_logic_vector(WIDTH - 1 downto 0);
        RF_Rp_zero: out std_logic
    ) ;
end Datapath;
architecture arch of Datapath is

    component ALU is
        port (
            x,y: in std_logic;
            a,b: in std_logic_vector(WIDTH - 1 downto 0);
            s: out std_logic_vector(WIDTH - 1 downto 0)
            
        ) ;
    end component;
    component RegisterFile is
      port (
        Wdata: in std_logic_vector(WIDTH - 1 downto 0);
        W_addr, RP_addr, RQ_addr: in std_logic_vector(ADDR_MSIZE - 1 downto 0);
        Wen, RenP, RenQ, clk : in std_logic;
	      RPdata, RQdata : out std_logic_vector(WIDTH - 1 DOWNTO 0)
      ) ;
    end component;

    component Mux3x1_16bit is
        port (
            s:in  std_logic_vector (1 downto 0);
            a,b: in std_logic_vector(WIDTH - 1 downto 0);
            c: in std_logic_vector (7 downto 0);
        
            q: out std_logic_vector(WIDTH - 1 downto 0)
          ) ;
    end component;
    signal Rp_data_to_a, Rq_data_to_b,ALU_to_Mux,Mux_to_RF: std_logic_vector(WIDTH-1 downto 0);

  begin

      ---Mux
      m0: Mux3x1_16bit port map(s=>(RF_s1 & Rf_s0),a => ALU_to_Mux,b =>R_data, c=> RF_W_data, q => Mux_to_RF);

      --- Registrador
      r0: RegisterFile port map(Wdata=>Mux_to_RF, W_addr=>RF_W_addr, RP_addr=>RF_Rp_addr,RQ_addr=>RF_Rq_addr, 
        Wen=>W_wr ,RenP=>Rp_rd , RenQ=>Rq_rd, clk=> clk, RPdata=>Rp_data_to_a, RQdata=> Rq_data_to_b);

      ---ALU
      a0: ALU port map( x => alu_s1,y =>alu_s0, a=>Rp_data_to_a, b=>Rq_data_to_b, s=> ALU_to_Mux);

      ---XOR
      RF_Rp_zero <= Rp_data_to_a(0) xor Rp_data_to_a(1) xor Rp_data_to_a(2) xor Rp_data_to_a(3) 
                    xor Rp_data_to_a(4) xor Rp_data_to_a(5) xor Rp_data_to_a(6) xor Rp_data_to_a(7) 
                    xor Rp_data_to_a(8) xor Rp_data_to_a(9) xor Rp_data_to_a(10) xor Rp_data_to_a(11) 
                    xor Rp_data_to_a(12) xor Rp_data_to_a(13) xor Rp_data_to_a(14) xor Rp_data_to_a(15);
    
      ----W_data
      W_data <= Rp_data_to_a;

end arch ; -- arch
