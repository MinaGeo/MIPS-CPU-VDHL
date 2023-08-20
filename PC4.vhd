
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity PC4 is
    Port ( PCIn : in  STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR (31 downto 0));
end PC4;

architecture Behavioral of PC4 is

begin
 PCOut <= std_logic_vector (signed(PCIn)+4);
end Behavioral;
