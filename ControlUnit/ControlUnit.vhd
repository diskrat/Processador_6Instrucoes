library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlUnit is
generic (
	WIDTH : integer := 16

);
port (
	clk, reset : in std_logic;
	RF_Rp_zero : in std_logic;
	I_data : in std_logic_vector(WIDTH-1 downto 0);
	PC_set : in std_logic_vector(WIDTH-1 downto 0);
	I_rd, D_rd, D_wr, RF_W_Wen, RF_Rp_Ren, RF_Rq_Ren : out std_logic;
	D_sel: out std_logic_vector (1 downto 0);
	RF_W_addr, RF_Rp_addr, RF_Rq_addr : out std_logic_vector(3 DOWNTO 0);
	RF_Sel, ALU_Sel : out std_logic_vector(1 DOWNTO 0);
	D_addr, RF_W_Data : out std_logic_vector(7 DOWNTO 0);
	I_addr : out std_logic_vector(WIDTH-1 downto 0)
);
end entity ControlUnit;

architecture main of ControlUnit is

component IR is
    port (
        clk    : in  std_logic;
        IR_ld  : in  std_logic;
        IR_in  : in  std_logic_vector(WIDTH-1 downto 0);
        IR_out : out std_logic_vector(WIDTH-1 downto 0)
    );
end component;

component PC is
    port (
        clk     : in std_logic;
        PC_ld   : in std_logic;
        PC_clr  : in std_logic;
        PC_inc  : in std_logic;
		  PC_sel  : in std_logic;
		  PC_offset : in std_logic_vector((WIDTH/2)-1 DOWNTO 0);
		  PC_set : in std_logic_vector(WIDTH-1 downto 0);
        PC_out  	: out std_logic_vector(WIDTH-1 downto 0)
		  
    );
end component;

component Controller is
port(
	clk, reset : in std_logic;
	IR03, IR47, IR811, OPCODE : in std_logic_vector(3 DOWNTO 0);
	RF_RP_zero: in std_logic;
	PC_ld, PC_clr, PC_inc, i_rd, IR_ld, D_rd, D_wr, RF_W_wr, RF_s1,
	RF_s0, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0, PC_sel
	: out std_logic;
	D_sel: out std_logic_vector (1 downto 0);
	D_addr03, D_addr47, RF_W_data03, RF_W_data47, RF_W_addr, RF_Rp_addr,
	RF_Rq_addr : out std_logic_vector(3 DOWNTO 0)
);
end component;

SIGNAL IR_ldo, PC_ldo, PC_clro, PC_inco, PC_selo : std_logic;
SIGNAL IR_dout : std_logic_vector(WIDTH-1 DOWNTO 0);
begin

	InstructionReader : IR port map (clk => clk, IR_ld => IR_ldo, IR_in => I_Data, IR_out => IR_dout);
	PCounter : PC port map (clk => clk, PC_ld => PC_ldo, PC_clr => PC_clro, PC_inc => PC_inco, PC_sel => PC_selo,
	PC_offset => IR_dout(7 DOWNTO 0), PC_set => PC_set, PC_out => I_addr);
	Control : Controller port map (clk => clk, reset => reset, IR03 => IR_dout(3 DOWNTO 0), IR47 => IR_dout(7 DOWNTO 4),
		IR811 => IR_dout(11 DOWNTO 8), OPCODE => IR_dout(15 DOWNTO 12), RF_RP_zero => RF_Rp_zero, PC_ld => PC_ldo,
		PC_clr => PC_clro, PC_inc => PC_inco, i_rd => I_rd, IR_ld => IR_ldo, D_rd => D_rd, D_wr => D_wr, RF_W_wr => RF_W_Wen,
		RF_s1 => RF_Sel(1), RF_s0 => RF_Sel(0), RF_Rp_rd => RF_Rp_Ren, RF_Rq_rd => RF_Rq_Ren, alu_s1 => ALU_Sel(1), alu_s0 => ALU_Sel(0),
		PC_sel => PC_selo, D_addr03 => D_addr(3 DOWNTO 0), D_addr47 => D_addr(7 DOWNTO 4), RF_W_data03 => RF_W_Data(3 DOWNTO 0),
		RF_W_data47 => RF_W_Data(7 DOWNTO 4), RF_W_addr => RF_W_addr, RF_Rp_addr => RF_Rp_addr, RF_Rq_addr => RF_Rq_addr, D_sel =>D_sel
		);
end architecture main;