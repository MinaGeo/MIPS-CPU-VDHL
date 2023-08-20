library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- VHDL code for Control Unit of the MIPS Processor
entity Control is
port (
  opcode: in std_logic_vector(5 downto 0);
  RegDst: out std_logic;
  MemtoReg: out std_logic;
  AlUOp: out std_logic_vector(1 downto 0);
  Jump: out std_logic;
  Branch: out std_logic; 
  MemRead: out std_logic;
  MemWrite: out std_logic;
  ALUSrc: out std_logic;
  RegWrite: out std_logic
 );
end Control;

architecture Behavioral of Control is

begin
process(opcode)
begin
RegWrite <= '0';
 case opcode is
  when "000000" => -- R format
    RegDst <= '1';
	 ALUSrc <= '0';
    MemtoReg <= '0';
	 RegWrite <= '1' AFTER 10 ns;
	 MemRead <= '0';
    MemWrite <= '0';
	 Branch <= '0';
    AlUOp(0) <= '0';
	 AlUOp(1) <= '1';
    Jump <= '0';
  when "000010" => -- j
    RegDst <= '0';
	 ALUSrc <= '0';
    MemtoReg <= '0';
	 RegWrite <= '1' AFTER 10 ns;
	 MemRead <= '0';
    MemWrite <= '0';
	 Branch <= '0';
    AlUOp(0) <= '0';
	 AlUOp(1) <= '0';
    Jump <= '1';
 when "100011" =>-- lw
    RegDst <= '0';
	 ALUSrc <= '1';
    MemtoReg <= '1';
	 RegWrite <= '1';
	 MemRead <= '1';
    MemWrite <= '0';
	 Branch <= '0';
    AlUOp(0) <= '0';
	 AlUOp(1) <= '0';
    Jump <= '0';
 when "101011" => -- sw
    RegDst <= '-';
	 ALUSrc <= '1';
    MemtoReg <= '-';
	 RegWrite <= '0';
	 MemRead <= '0';
    MemWrite <= '1';
	 Branch <= '0';
    AlUOp(0) <= '0';
	 AlUOp(1) <= '0';
    Jump <= '1';
 when "000100" => -- beq
   RegDst <= '-';
	 ALUSrc <= '0';
    MemtoReg <= '-';
	 RegWrite <= '0';
	 MemRead <= '0';
    MemWrite <= '0';
	 Branch <= '1';
    AlUOp(0) <= '0';
	 AlUOp(1) <= '1';
    Jump <= '0';
 when "000101" => -- bne
    RegDst <= '-';
	 ALUSrc <= '0';
    MemtoReg <= '-';
	 RegWrite <= '0';
	 MemRead <= '0';
    MemWrite <= '0';
	 Branch <= '1';
    AlUOp(0) <= '0';
	 AlUOp(1) <= '1';
    Jump <= '0';
 when others =>   
    RegDst <= '0';
	 ALUSrc <= '0';
    MemtoReg <= '0';
	 RegWrite <= '1';
	 MemRead <= '0';
    MemWrite <= '0';
	 Branch <= '0';
    AlUOp(0) <= '0';
	 AlUOp(1) <= '0';
    Jump <= '0';
 end case;
end process;

end Behavioral;