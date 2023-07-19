library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity RegisterFile is
    generic(
        WIDTH: integer := 16;
        ADDR_MSIZE: integer := 4
    );
    port (
        Wdata: in std_logic_vector(WIDTH - 1 downto 0);
        W_addr, RP_addr, RQ_addr: in std_logic_vector(ADDR_MSIZE - 1 downto 0);
        Wen, RenP, RenQ, clk : in std_logic;
	    RPdata, RQdata : out std_logic_vector(WIDTH - 1 DOWNTO 0)
    ---co: out std_logic
  ) ;
end RegisterFile;

architecture main of RegisterFile is
component decoder is 
    port(
        A: in std_logic_vector(ADDR_MSIZE - 1 downto 0);
        E: IN std_logic;
        Y: out std_logic_vector(WIDTH - 1 downto 0)
    ); 
end component;
component reg16_parallel is 
    port(
        c_r, ld : in std_logic;
        I: in std_logic_vector( WIDTH - 1 downto 0 );
        Q: out std_logic_vector( WIDTH - 1 downto 0 )
    
    ); 
end component;
    type Qout is array(0 to 15) of std_logic_vector(WIDTH - 1 downto 0);
    signal W_decoder_output, RP_decoder_output, RQ_decoder_output: std_logic_vector(WIDTH - 1 downto 0);
    signal Q_output : Qout;    
    

begin
    decoder_WR: decoder port map(A => W_addr , E => Wen, Y => W_decoder_output); 
    decoder_RP: decoder port map(A => RP_addr, E => RenP, Y => RP_decoder_output);
    decoder_RQ: decoder port map(A => RQ_addr, E => RenQ, Y => RQ_decoder_output);


    ---Write to RF
    reg0: reg16_parallel port map( I => Wdata, Q => Q_output(0), ld => W_decoder_output(0), c_r => clk);
    reg1: reg16_parallel port map( I => Wdata, Q => Q_output(1), ld => W_decoder_output(1), c_r => clk);
    reg2: reg16_parallel port map( I => Wdata, Q => Q_output(2), ld => W_decoder_output(2), c_r => clk);
    reg3: reg16_parallel port map( I => Wdata, Q => Q_output(3), ld => W_decoder_output(3), c_r => clk);
    reg4: reg16_parallel port map( I => Wdata, Q => Q_output(4), ld => W_decoder_output(4), c_r => clk);
    reg5: reg16_parallel port map( I => Wdata, Q => Q_output(5), ld => W_decoder_output(5), c_r => clk);
    reg6: reg16_parallel port map( I => Wdata, Q => Q_output(6), ld => W_decoder_output(6), c_r => clk);
    reg7: reg16_parallel port map( I => Wdata, Q => Q_output(7), ld => W_decoder_output(7), c_r => clk);
    reg8: reg16_parallel port map( I => Wdata, Q => Q_output(8), ld => W_decoder_output(8), c_r => clk);
    reg9: reg16_parallel port map( I => Wdata, Q => Q_output(9), ld => W_decoder_output(9), c_r => clk);
    reg10: reg16_parallel port map( I => Wdata, Q => Q_output(10), ld => W_decoder_output(10), c_r => clk);
    reg11: reg16_parallel port map( I => Wdata, Q => Q_output(11), ld => W_decoder_output(11), c_r => clk);
    reg12: reg16_parallel port map( I => Wdata, Q => Q_output(12), ld => W_decoder_output(12), c_r => clk);
    reg13: reg16_parallel port map( I => Wdata, Q => Q_output(13), ld => W_decoder_output(13), c_r => clk);
    reg14: reg16_parallel port map( I => Wdata, Q => Q_output(14), ld => W_decoder_output(14), c_r => clk);
    reg15: reg16_parallel port map( I => Wdata, Q => Q_output(15), ld => W_decoder_output(15), c_r => clk);

    --- Read from RF using RF_Q
        process (clk)
        begin
            if rising_edge(clk) then
                if RenP = '1' then
                    t0: for i in WIDTH - 1 downto 0 loop
                        if RP_decoder_output(i) = '1' then 
                            RPdata <= Q_output(i);
                        end if;
                    end loop;
                end if;
                if RenQ = '1' then
                    t1: for i in WIDTH - 1 downto 0 loop
                        if RQ_decoder_output(i) = '1' then 
                            RQdata <= Q_output(i);
                        end if;
                    end loop;
                end if;
            end if;
        end process;
end;
