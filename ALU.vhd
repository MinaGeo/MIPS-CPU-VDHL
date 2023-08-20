library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_signed.all;
entity ALU is
port(  
        data1: in STD_LOGIC_VECTOR(31 downto 0);
		  data2 : in STD_LOGIC_VECTOR(31 downto 0); --input operands
        ALUControl : in STD_LOGIC_VECTOR(3 downto 0); --Operation to be performed
		  zflag : out std_logic;
		  dataout : out STD_LOGIC_VECTOR(31 downto 0) --output of ALU
        );
end ALU;

architecture Behavioral of ALU is
 
--temporary signal declaration.
signal temp1,temp2 : STD_LOGIC_VECTOR(32 downto 0);
signal result :STD_LOGIC_VECTOR(31 downto 0);


begin


temp1<=(data1(31)&data1)+(data2(31)&data2);
temp2<=(data1(31)&data1)-(data2(31)&data2);

 process(data1, data2,ALUControl, temp1, temp2)
begin 
case ALUControl is 
WHEN "0000" =>
				result <= data1 AND data2;
			WHEN "0001" =>
				result<= data1 OR data2;
			WHEN "0010" =>
				result <=  temp1(31 downto 0);
			WHEN "0110" =>
				result <= temp2(31 downto 0);
			WHEN "1100" =>
				result <= data1 NOR data2;
			WHEN "0111"=> 
 if (data1 < data2 )then
 result <= x"00000001";
 else
 result <= x"00000000";
 end if;
  when others => 
  result <= x"00000000";
  end case;
 end process;

     zflag<='1' when result=x"00000000" else '0';
	dataout<=result;
 
end Behavioral;