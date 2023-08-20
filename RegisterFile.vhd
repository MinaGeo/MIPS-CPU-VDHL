
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MyPackage.ALL;


entity RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC);
end RegisterFile;

architecture Behavioral of RegisterFile is
SIGNAL L: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL O_P0,O_P1,O_P2,O_P3,O_P4,O_P5,O_P6,O_P7,O_P8,O_P9,O_P10,O_P11,O_P12,O_P13,O_P14,O_P15,O_P16,O_P17,O_P18,
O_P19,O_P20,O_P21,O_P22,O_P23,O_P24,O_P25,O_P26,O_P27,O_P28,O_P29,O_P30,O_P31 : STD_LOGIC_VECTOR (31 downto 0);
begin
decoder1: Decoder port map (write_sel, write_ena, L);

reg1: reg port map ( write_data, O_P0, L(0), clk, rst);
reg2: reg port map ( write_data, O_P1, L(1), clk, rst);
reg3: reg port map ( write_data, O_P2, L(2), clk, rst);
reg4: reg port map ( write_data, O_P3, L(3), clk, rst);
reg5: reg port map ( write_data, O_P4, L(4), clk, rst);
reg6: reg port map ( write_data, O_P5, L(5), clk, rst);
reg7: reg port map ( write_data, O_P6, L(6), clk, rst);
reg8: reg port map ( write_data, O_P7, L(7), clk, rst);
reg9: reg port map ( write_data, O_P8, L(8), clk, rst);
reg10: reg port map ( write_data, O_P9, L(9), clk, rst);
reg11: reg port map ( write_data, O_P10, L(10), clk, rst);
reg12: reg port map ( write_data, O_P11, L(11), clk, rst);
reg13: reg port map ( write_data, O_P12, L(12), clk, rst);
reg14: reg port map ( write_data, O_P13, L(13), clk, rst);
reg15: reg port map ( write_data, O_P14, L(14), clk, rst);
reg16: reg port map ( write_data, O_P15, L(15), clk, rst);
reg17: reg port map ( write_data, O_P16, L(16), clk, rst);
reg18: reg port map ( write_data, O_P17, L(17), clk, rst);
reg19: reg port map ( write_data, O_P18, L(18), clk, rst);
reg20: reg port map ( write_data, O_P19, L(19), clk, rst);
reg21: reg port map ( write_data, O_P20, L(20), clk, rst);
reg22: reg port map ( write_data, O_P21, L(21), clk, rst);
reg23: reg port map ( write_data, O_P22, L(22), clk, rst);
reg24: reg port map ( write_data, O_P23, L(23), clk, rst);
reg25: reg port map ( write_data, O_P24, L(24), clk, rst);
reg26: reg port map ( write_data, O_P25, L(25), clk, rst);
reg27: reg port map ( write_data, O_P26, L(26), clk, rst);
reg28: reg port map ( write_data, O_P27, L(27), clk, rst);
reg29: reg port map ( write_data, O_P28, L(28), clk, rst);
reg30: reg port map ( write_data, O_P29, L(29), clk, rst);
reg31: reg port map ( write_data, O_P30, L(30), clk, rst);
reg32: reg port map ( write_data, O_P31, L(31), clk, rst);



mux1: Mux32 port map (O_P0, O_P1, O_P2, O_P3,O_P4,O_P5,O_P6,O_P7,O_P8,O_P9
,O_P10,O_P11,O_P12,O_P13,O_P14,O_P15,O_P16,O_P17,O_P18,O_P19,O_P20,O_P21,O_P22,O_P23
,O_P24,O_P25,O_P26,O_P27,O_P28,O_P29,O_P30,O_P31, read_sel1, data1);


mux2: Mux32 port map (O_P0, O_P1, O_P2, O_P3,O_P4,O_P5,O_P6,O_P7,O_P8,O_P9
,O_P10,O_P11,O_P12,O_P13,O_P14,O_P15,O_P16,O_P17,O_P18,O_P19,O_P20,O_P21,O_P22,O_P23
,O_P24,O_P25,O_P26,O_P27,O_P28,O_P29,O_P30,O_P31, read_sel2, data2);


end Behavioral;

