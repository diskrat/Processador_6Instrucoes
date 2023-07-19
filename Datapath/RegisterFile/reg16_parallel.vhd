LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg16_parallel is
    generic(
        SIZE: integer := 16
    );
    port(
        c_r, ld : in std_logic;
        I: in std_logic_vector( SIZE - 1 downto 0 );
        Q: out std_logic_vector( SIZE - 1 downto 0 )
    );
END;

architecture rtl of reg16_parallel is
    --comp

    component reg is
        port(
            --- IN
            I: in std_logic_vector( SIZE - 1 downto 0 );
            c_r : in std_logic;
            --- out
            Q: out std_logic_vector( SIZE - 1 downto 0 )
        );
    end component;
    component mux2x1 is
        port(
            I0,I1,s0 : IN std_logic;
            d : OUT std_logic
         );
    end component;
    signal muxOut : std_logic_vector( SIZE - 1 downto 0 );
    signal Qholder: std_logic_vector( SIZE - 1 downto 0 );
begin
    ---Escolha da carga
    t0 : mux2x1 port map (I0 => Qholder(0), I1 => I(0), s0 => ld, d => muxOut(0));
    t1 : mux2x1 port map (I0 => Qholder(1), I1 => I(1),  s0 => ld, d => muxOut(1));
    t2 : mux2x1 port map (I0 => Qholder(2), I1 => I(2),  s0 => ld, d => muxOut(2));
    t3 : mux2x1 port map (I0 => Qholder(3), I1 => I(3),  s0 => ld, d => muxOut(3));
    t4 : mux2x1 port map (I0 => Qholder(4), I1 => I(4),  s0 => ld, d => muxOut(4));
    t5 : mux2x1 port map (I0 => Qholder(5), I1 => I(5),  s0 => ld, d => muxOut(5));
    t6 : mux2x1 port map (I0 => Qholder(6), I1 => I(6),  s0 => ld, d => muxOut(6));
    t7 : mux2x1 port map (I0 => Qholder(7), I1 => I(7),  s0 => ld, d => muxOut(7));
    t8 : mux2x1 port map (I0 => Qholder(8), I1 => I(8),  s0 => ld, d => muxOut(8));
    t9 : mux2x1 port map (I0 => Qholder(9), I1 => I(9),  s0 => ld, d => muxOut(9));
    t10 : mux2x1 port map (I0 => Qholder(10), I1 => I(10),  s0 => ld, d => muxOut(10));
    t11 : mux2x1 port map (I0 => Qholder(11), I1 => I(11),  s0 => ld, d => muxOut(11));
    t12 : mux2x1 port map (I0 => Qholder(12), I1 => I(12),  s0 => ld, d => muxOut(12));
    t13 : mux2x1 port map (I0 => Qholder(13), I1 => I(13),  s0 => ld, d => muxOut(13));
    t14 : mux2x1 port map (I0 => Qholder(14), I1 => I(14),  s0 => ld, d => muxOut(14));
    t15 : mux2x1 port map (I0 => Qholder(15), I1 => I(15),  s0 => ld, d => muxOut(15));


    ----Registro
    u: reg port map (I => muxOut, c_r => c_r, Q => Qholder);

    Q <= Qholder;
end;