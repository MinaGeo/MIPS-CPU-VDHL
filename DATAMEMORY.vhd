library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DATAMEMORY is
  Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port ( LoadIt: in STD_LOGIC;
  			INPUT     : in STD_LOGIC_VECTOR (wordsize-1 downto 0);
			OUTPUT    : out STD_LOGIC_VECTOR (wordsize-1 downto 0);
         MEM_READ : in STD_LOGIC;
			MEM_WRITE : in STD_LOGIC;
			ADDRESS   : in STD_LOGIC_VECTOR (addresssize-1 downto 0);
			CLK       : in STD_LOGIC
			);

end DATAMEMORY;

architecture BEHAVIORAL of DATAMEMORY is

  type   MEM is array (0 to words-1) of STD_LOGIC_VECTOR (wordsize-1 downto 0);
  signal MEMORY : MEM;
  signal OUTS: STD_LOGIC_VECTOR(wordsize-1 downto 0);
	signal ADDRover4: STD_LOGIC_VECTOR(addresssize-2 - 1 downto 0);
	signal ADDR_int: integer;
begin

  process (LoadIt, MEM_READ, MEM_WRITE, CLK, ADDRESS, INPUT, ADDR_int ) is
  begin
  if (LoadIt = '1') then
-----------------------
--Project1 test
-----------------------
		MEMORY(0) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(1) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(2) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(3) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(4) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(5) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(6) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(7) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(8) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(9) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(10) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(11) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		MEMORY(12) <= "00000000000000000000000000001100" ;
		MEMORY(13) <= "00000000000000000000000000000001" ;
		MEMORY(14) <= "00000000000000000000000000000100" ;

  else
    if FALLING_EDGE(CLK) then
      if MEM_WRITE = '1' then
			MEMORY(ADDR_int) <= INPUT;
      end if;		
    end if;
	end if;
	
end process;

	ADDRover4 <= ADDRESS(31 downto 2) ;
	ADDR_int <= CONV_INTEGER(ADDRover4);
	OUTS <= MEMORY(ADDR_int) when MEM_READ = '1' and (ADDR_int < words) else
				(others => 'Z') when MEM_READ = '0';
	
	OUTPUT <= OUTS;

end BEHAVIORAL;

