library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux0 is
    Port ( s : in  STD_LOGIC;
           i0 : in  STD_LOGIC_VECTOR (4 downto 0);
           i1 : in  STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC_VECTOR(4 downto 0));
end Mux0;

architecture Behavioral of Mux0 is
begin
output<= i0 when s='0' else
i1;
end Behavioral;

