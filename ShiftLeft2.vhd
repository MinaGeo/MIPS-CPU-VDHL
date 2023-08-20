LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ShiftLeft2 IS
	PORT (
		input  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ShiftLeft2;

ARCHITECTURE Behavioral OF ShiftLeft2 IS

BEGIN
	output(31)          <= input(31);
	output(30 DOWNTO 2) <= input(28 DOWNTO 0);
	output(1 DOWNTO 0) <= (OTHERS => '0');
	
END Behavioral;

