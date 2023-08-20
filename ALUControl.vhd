library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- VHDL code for ALU Control Unit of the MIPS Processor
entity ALUControl is
port(
  ALUOp : in std_logic_vector(1 downto 0);
  ALUFunction : in std_logic_vector(5 downto 0);
  Operations: out STD_LOGIC_VECTOR (3 downto 0)
);
end ALUControl;

architecture Behavioral of ALUControl is
begin
Operations(3)<='0';
Operations(2)<=(ALUOp(0) or (ALUOp(1) AND ALUFunction(1)));
Operations(1)<=(not ALUOp(1) or  (not ALUFunction(2)));
Operations(0)<=(ALUOp(1) and (ALUFunction(0) AND ALUFunction(3)));

end Behavioral;









