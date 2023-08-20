library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
    Port ( s : in  STD_LOGIC;
           i0 : in  STD_LOGIC_VECTOR (31 downto 0);
           i1 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR(31 downto 0));
end Mux2;

architecture Behavioral of Mux2 is
begin
output<= i0 when s='0' else
i1;
end Behavioral;
