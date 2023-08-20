
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( PCIn : in  STD_LOGIC_VECTOR (31 downto 0);
           PCOut  : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk: in std_logic;
			  rst: in std_logic);
			 
end PC;

architecture Behavioral of PC is

begin
process (clk, rst)
begin
if(rst ='1') then pcout <= (OTHERS => '0');
elsif ( rising_edge(clk)) then
PCOut <= PCIn;
end if;
end process;

end Behavioral;

