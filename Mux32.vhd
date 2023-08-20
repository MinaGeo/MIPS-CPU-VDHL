
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux32 is
    Port ( i0 : in  STD_LOGIC_VECTOR (31 downto 0);
           i1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i2 : in  STD_LOGIC_VECTOR (31 downto 0);
           i3 : in  STD_LOGIC_VECTOR (31 downto 0);
           i4 : in  STD_LOGIC_VECTOR (31 downto 0);
           i5 : in  STD_LOGIC_VECTOR (31 downto 0);
           i6 : in  STD_LOGIC_VECTOR (31 downto 0);
           i7 : in  STD_LOGIC_VECTOR (31 downto 0);
           i8 : in  STD_LOGIC_VECTOR (31 downto 0);
           i9 : in  STD_LOGIC_VECTOR (31 downto 0);
           i10 : in  STD_LOGIC_VECTOR (31 downto 0);
           i11 : in  STD_LOGIC_VECTOR (31 downto 0);
           i12 : in  STD_LOGIC_VECTOR (31 downto 0);
           i13 : in  STD_LOGIC_VECTOR (31 downto 0);
           i14 : in  STD_LOGIC_VECTOR (31 downto 0);
           i15 : in  STD_LOGIC_VECTOR (31 downto 0);
           i16 : in  STD_LOGIC_VECTOR (31 downto 0);
           i17 : in  STD_LOGIC_VECTOR (31 downto 0);
           i18 : in  STD_LOGIC_VECTOR (31 downto 0);
           i19 : in  STD_LOGIC_VECTOR (31 downto 0);
           i20 : in  STD_LOGIC_VECTOR (31 downto 0);
           i21 : in  STD_LOGIC_VECTOR (31 downto 0);
           i22 : in  STD_LOGIC_VECTOR (31 downto 0);
           i23 : in  STD_LOGIC_VECTOR (31 downto 0);
           i24 : in  STD_LOGIC_VECTOR (31 downto 0);
           i25 : in  STD_LOGIC_VECTOR (31 downto 0);
           i26 : in  STD_LOGIC_VECTOR (31 downto 0);
           i27 : in  STD_LOGIC_VECTOR (31 downto 0);
           i28 : in  STD_LOGIC_VECTOR (31 downto 0);
           i29 : in  STD_LOGIC_VECTOR (31 downto 0);
           i30 : in  STD_LOGIC_VECTOR (31 downto 0);
           i31 : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC_VECTOR (4 downto 0);
           OP : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux32;

architecture Behavioral of Mux32 is

begin
OP <=i0 WHEN S="00000" Else 
i1 WHEN S="00001" Else
i2 WHEN S="00010" ELse
i3 WHEN S="00011" Else
i4 WHEN S="00100" Else
i5 WHEN S="00101" Else
i6 WHEN S="00110" Else
i7 WHEN S="00111" Else
i8 WHEN S="01000" Else
i9 WHEN S="01001" Else
i10 WHEN S="01010" Else
i11 WHEN S="01011" Else
i12 WHEN S="01100" Else
i13 WHEN S="01101" Else
i14 WHEN S="01110" Else
i15 WHEN S="01111" Else
i16 WHEN S="10000" Else
i17 WHEN S="10001" Else
i18 WHEN S="10010" Else
i19 WHEN S="10011" Else
i20 WHEN S="10100" Else
i21 WHEN S="10101" Else
i22 WHEN S="10110" Else
i23 WHEN S="10111" Else
i24 WHEN S="11000" Else
i25 WHEN S="11001" Else
i26 WHEN S="11010" Else
i27 WHEN S="11011" Else
i28 WHEN S="11100" Else
i29 WHEN S="11101" Else
i30 WHEN S="11110" Else
i31 WHEN S="11111" Else
(OTHERS => 'Z'); 


end Behavioral;

