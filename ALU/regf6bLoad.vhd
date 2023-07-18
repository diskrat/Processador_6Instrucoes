library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity regf6bLoad is
    generic (
        WIDTH: integer := 6
    );
    port (
        clk,ld : in std_logic;
        I: in std_logic_vector(WIDTH - 1 downto 0);
        Q : out std_logic_vector(WIDTH - 1 downto 0)
    );
end regf6bLoad;


architecture logic of regf6bLoad is

    -- COMPONENTES
    component flipflopD is
        port (
        clk,D : in std_logic;
        Q : out std_logic

    );
    end component;

    component mux2x16bit is
        PORT(
            A,B: in std_logic_vector(WIDTH - 1 DOWNTO 0);
            S: in std_logic;
            R: out std_logic_vector(WIDTH - 1 DOWNTO 0)
        );    
    end component;
    
    -- SINAIS
    signal muxOut: std_logic_vector(WIDTH - 1 downto 0);
    signal Qholder: std_logic_vector(WIDTH - 1 downto 0);

begin

    -- escolher que dado vai para o registrador
    v0: mux2x16bit port map(Qholder,I,ld,muxOut);

    -- carregar dados no registrador
    u0: flipflopD port map(clk, muxOut(0), Qholder(0));
    u1: flipflopD port map(clk, muxOut(1), Qholder(1));
    u2: flipflopD port map(clk, muxOut(2), Qholder(2));
    u3: flipflopD port map(clk, muxOut(3), Qholder(3));
    u4: flipflopD port map(clk, muxOut(4), Qholder(4));
    u5: flipflopD port map(clk, muxOut(5), Qholder(5));

    Q <= Qholder;
end architecture ; -- logic