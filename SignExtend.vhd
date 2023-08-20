
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SignExtend is
    Port ( sin : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtend;

architecture Behavioral of SignExtend is

begin
process(sin)
begin
if(sin(15)='0') then
output<= ("0000000000000000" & sin);
elsif (sin(15) ='1') then
output<= ("1111111111111111" & sin);
end if;
end process;
end Behavioral;

