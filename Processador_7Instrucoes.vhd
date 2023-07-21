library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Processador_7Instrucoes is
    generic(
        WIDTH: integer := 16;
        RF_ADDR_MSIZE: integer := 4;
        D_ADDR_MSIZE: integer := 8;
        I_ADDR_MSIZE: integer :=16
    );
    port (
      clk, reset,sig_mem_esc: in std_logic;
      ADDR_ext: in std_logic_vector( D_ADDR_MSIZE -1 downto 0);
      read_only: out std_logic;
      RP_data, RQ_data,data: out std_logic_vector(WIDTH - 1 downto 0)
    

    ) ;
end Processador_7Instrucoes;
architecture arch of Processador_7Instrucoes is

  component ControlUnit is
    port (
      clk, reset : in std_logic;
      RF_Rp_zero: in std_logic;
      I_data : in std_logic_vector(WIDTH-1 downto 0);
      PC_set : in std_logic_vector(WIDTH-1 downto 0);
      I_rd, D_rd, D_wr, RF_W_Wen, RF_Rp_Ren, RF_Rq_Ren,RF_Rp_addr_Sel: out std_logic;
      D_sel: out std_logic_vector (1 downto 0);
      RF_W_addr, RF_Rp_addr, RF_Rq_addr : out std_logic_vector(3 DOWNTO 0);
      RF_Sel, ALU_Sel : out std_logic_vector(1 DOWNTO 0);
      D_addr, RF_W_Data : out std_logic_vector(7 DOWNTO 0);
      I_addr : out std_logic_vector(WIDTH-1 downto 0)
    );
  end component;
  component Datapath is
    port (
      --- in
      clk,
      W_wr, Rp_rd, Rq_rd,
      RF_s1,Rf_s0,
      alu_s1,alu_s0: in std_logic; 
      R_data: in std_logic_vector(WIDTH - 1 downto 0);
      RF_W_data: in std_logic_vector(7 downto 0);
      RF_W_addr,RF_Rp_addr,RF_Rq_addr: in std_logic_vector(RF_ADDR_MSIZE-1 downto 0);
      --- Out
      W_data,RQ_data, RP_data: out std_logic_vector(WIDTH - 1 downto 0);
      RF_Rp_zero: out std_logic
    );
  end component;
  component D_Memory is
    port (
      Wdata: in std_logic_vector(WIDTH - 1 downto 0);
      addr: in std_logic_vector(D_ADDR_MSIZE - 1 downto 0);
      Wen, Ren, clk : in std_logic;
      Rdata: out std_logic_vector(WIDTH - 1 DOWNTO 0)
    ) ;
  end component;
  component I_Memory is
    port (
      addr: in std_logic_vector(I_ADDR_MSIZE - 1 downto 0);
      rd,clk: in std_logic;
      data: out std_logic_vector(WIDTH - 1 downto 0)
    ) ;
  end component;
  component Mux3x1_8bit is
    port (
      s:in  std_logic_vector(1 downto 0);
      a,b,c: in std_logic_vector(D_ADDR_MSIZE- 1 downto 0);

      q: out std_logic_vector(D_ADDR_MSIZE - 1 downto 0)
    ) ;
  end component;
  component Mux2x1_16bit is
    port (
      s:in  std_logic;
      a,b: in std_logic_vector(WIDTH- 1 downto 0);

      q: out std_logic_vector(WIDTH - 1 downto 0)
    ) ;
  end component;
  component Mux2x1_4bit is
    port (
      s:in  std_logic;
      a,b: in std_logic_vector(RF_ADDR_MSIZE- 1 downto 0);
      q: out std_logic_vector(RF_ADDR_MSIZE - 1 downto 0)
    ) ;
  end component;

  --- Sinais Control unit para/de I_memory
  signal Cu_to_I_Mem: std_logic_vector(I_ADDR_MSIZE - 1 downto 0);
  signal Cu_to_I_Mem_rd: std_logic;
  signal I_Mem_to_Cu: std_logic_vector(WIDTH - 1 downto 0);

  --- Sinais Control unit de/para D_memory
  signal Cu_to_D_rd,Cu_to_D_wr: std_logic;
  --- Sinais Datapath de/para D_memory
  signal Dp_to_D_Memory, D_Memory_to_Dp: std_logic_vector(WIDTH - 1 downto 0);
  --- Sinais Datapath de/para Control unit
  signal Cu_to_Dp_W_data: std_logic_vector(7 downto 0);
  signal Cu_to_DP_W_wr,Cu_to_DP_Rp_rd,Cu_to_DP_Rq_rd: std_logic;
  signal Cu_to_DP_RF_W_addr,Cu_to_DP_RF_Rp_addr,Cu_to_DP_RF_Rq_addr: std_logic_vector(RF_ADDR_MSIZE-1 downto 0);
  signal Dp_to_Cu_RF_Rp_zero: std_logic;
  signal Cu_to_RF_Sel, Cu_to_Alu_sel: std_logic_vector(1 downto 0);
  --- Sinal Mux2x1 to D_memory
  signal Mux_to_D_addr: std_logic_vector(D_ADDR_MSIZE - 1 downto 0);
  --- Sinal ControlUnit to Mux
  signal Cu_to_Mux_addr: std_logic_vector(D_ADDR_MSIZE - 1 downto 0);
  signal Cu_to_Mux_sel: std_logic_vector( 1 downto 0);
  --- Sinal RF to Mux
  signal RF_to_Mux_addr: std_logic_vector(WIDTH - 1 downto 0);
  signal Slice_RF_to_Mux_addr: std_logic_vector(D_ADDR_MSIZE - 1 downto 0);
  signal Cu_to_RF_Rq_addr_sel: std_logic;
  signal ADDR_ext_slice,Rf_Rq_Mux_addr: std_logic_vector(RF_ADDR_MSIZE - 1 downto 0);



begin
  --- I_memory 
  i0: I_Memory port map(addr => Cu_to_I_Mem, rd => Cu_to_I_Mem_rd, clk => clk, data => I_Mem_to_Cu);
  --- D_memory
  d0: D_Memory port map(Wdata => Dp_to_D_Memory,addr => Mux_to_D_addr,Wen => Cu_to_D_wr,Ren => Cu_to_D_rd,
              clk => clk, Rdata => D_Memory_to_Dp);
  --- Datapath
  dp0: Datapath port map(clk => clk, W_wr =>Cu_to_DP_W_wr,Rp_rd => Cu_to_DP_Rp_rd, Rq_rd => Cu_to_DP_Rq_rd,
                RF_s1 => Cu_to_RF_Sel(1),Rf_s0 =>Cu_to_RF_Sel(0) ,alu_s0=> Cu_to_Alu_sel(0),alu_s1 => Cu_to_Alu_sel(1),
                R_data =>D_Memory_to_Dp,RF_W_data => Cu_to_Dp_W_data, RF_W_addr=> Cu_to_DP_RF_W_addr,
                RF_Rp_addr => Rf_Rq_Mux_addr, RF_Rq_addr => Cu_to_DP_RF_Rq_addr,
                W_data => Dp_to_D_Memory, RF_Rp_zero => Dp_to_Cu_RF_Rp_zero, RQ_data=>RF_to_Mux_addr, RP_data=>RP_data);
  --- CntrlU 
  ct0: ControlUnit port map(  clk=> clk, reset=>reset,
            RF_Rp_zero=> Dp_to_Cu_RF_Rp_zero, I_data=> I_Mem_to_Cu,
            PC_set=> Cu_to_I_Mem,
            I_rd=>Cu_to_I_Mem_rd, D_rd=>Cu_to_D_rd, D_wr=>Cu_to_D_wr, RF_W_Wen=>Cu_to_DP_W_wr, RF_Rp_Ren=>Cu_to_DP_Rp_rd, RF_Rq_Ren=>Cu_to_DP_Rq_rd,
            RF_W_addr=>Cu_to_DP_RF_W_addr, RF_Rp_addr=>Cu_to_DP_RF_Rp_addr, RF_Rq_addr=> Cu_to_DP_RF_Rq_addr,
            RF_Sel=> Cu_to_RF_Sel, ALU_Sel=> Cu_to_Alu_sel ,
            D_addr=>Cu_to_Mux_addr, RF_W_Data=>Cu_to_Dp_W_data,
            I_addr=>Cu_to_I_Mem,D_sel => Cu_to_Mux_sel,RF_Rp_addr_Sel=>Cu_to_RF_Rq_addr_sel);

  Slice_RF_to_Mux_addr <= RF_to_Mux_addr(D_ADDR_MSIZE - 1 downto 0);
  m0: Mux3x1_8bit port map( s => Cu_to_Mux_sel, a => Cu_to_Mux_addr, b => Slice_RF_to_Mux_addr, c=> ADDR_ext, q => Mux_to_D_addr);

  mx0: Mux2x1_16bit port map( s => sig_mem_esc, a =>Dp_to_D_Memory , b =>D_Memory_to_Dp, q => RQ_data);

  ADDR_ext_slice <= ADDR_ext(RF_ADDR_MSIZE - 1 downto 0);

  
  mxaddr0: Mux2x1_4bit port map( s => Cu_to_RF_Rq_addr_sel, a => Cu_to_DP_RF_Rp_addr, b => ADDR_ext_slice, q => Rf_Rq_Mux_addr);

  data <= RF_to_Mux_addr;
  read_only <= Cu_to_RF_Rq_addr_sel;
end arch ; -- arch