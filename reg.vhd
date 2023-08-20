
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
    Port ( I : in  STD_LOGIC_VECTOR (31 downto 0);
           OP : out  STD_LOGIC_VECTOR (31 downto 0);
           L : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end reg;

architecture Behavioral of reg is

begin
process (clk, rst, L)
begin
if(rst ='1') then OP <= (OTHERS => '0');
elsif ( falling_edge(clk) and L='1') then
OP <=I;
end if;
end process;
end Behavioral;

