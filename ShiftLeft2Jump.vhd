LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

ENTITY ShiftLeft2Jump IS
	PORT (
		input  : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR (27 DOWNTO 0)
	);
END ShiftLeft2Jump;

ARCHITECTURE Behavioral OF ShiftLeft2Jump IS
signal temp: std_logic_vector(27 downto 0);
BEGIN
temp <= std_logic_vector(resize(unsigned(input), 28));
	output <= std_logic_vector(shift_left(signed(temp), 2));
	
END Behavioral;

