library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port ( ck , opLOAD, opSTR, opMOV, opADD, opSUB, opJMP, opJMPZ, opLDAI, flagCarry,flagULA   : in std_logic;
         SEL_addr_RF_escrita,SEL_RF_2_SUM,SEL_RF_leitura_1,en_RF_leitura_1,en_RF_leitura_2,en_RF_escrita,D_en,D_wr,flagCarry_ld,flagCarry_clr,flagULA_ld,flagULA_clr,PC_cnt,PC_ld,PC_clr,IR_ld,I_rd, junt_ld : out std_logic;
          SEL_RF   : out std_logic_vector (1 downto 0);
          SEL_ULA  : out std_logic_vector (2 downto 0);
			 estadoAtual : out std_logic_vector(4 downto 0)
);
end ControlUnit ;