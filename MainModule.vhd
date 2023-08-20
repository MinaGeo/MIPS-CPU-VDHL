
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity MainModule is
    Port ( START : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RegFileOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RegFileOut2 : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOut : out  STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR (31 downto 0);
           DataMemOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MainModule;

architecture Behavioral of MainModule is

component ALUControl is
port(
  ALUOp : in std_logic_vector(1 downto 0);
  ALUFunction : in std_logic_vector(5 downto 0);
  Operations: out STD_LOGIC_VECTOR (3 downto 0)
);
end component;


component ALU is
port(  
        data1: in STD_LOGIC_VECTOR(31 downto 0);
		  data2 : in STD_LOGIC_VECTOR(31 downto 0); --input operands
        ALUControl : in STD_LOGIC_VECTOR(3 downto 0); --Operation to be performed
		  zflag : out std_logic;
		  dataout : out STD_LOGIC_VECTOR(31 downto 0) --output of ALU
        );
end component;


component Control is
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
end component;

component DATAMEMORY is
  Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port ( LoadIt: in STD_LOGIC;
  			INPUT     : in STD_LOGIC_VECTOR (wordsize-1 downto 0);
			OUTPUT    : out STD_LOGIC_VECTOR (wordsize-1 downto 0);
         MEM_READ : in STD_LOGIC;
			MEM_WRITE : in STD_LOGIC;
			ADDRESS   : in STD_LOGIC_VECTOR (addresssize-1 downto 0);
			CLK       : in STD_LOGIC
			);

end component;

component INSTRMEMORY is
	Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port(
    LoadIt: in Std_logic ;
	 DATA: out STD_LOGIC_VECTOR(wordsize-1 downto 0);
    ADDRESS: in STD_LOGIC_VECTOR(addresssize-1 downto 0);
    CLK: in STD_LOGIC
    );
end component;

component Mux0 is
    Port ( s : in  STD_LOGIC;
           i0 : in  STD_LOGIC_VECTOR (4 downto 0);
           i1 : in  STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC_VECTOR(4 downto 0));
end component;

component Mux1 is
    Port ( s : in  STD_LOGIC;
           i0 : in  STD_LOGIC_VECTOR (31 downto 0);
           i1 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component Mux2 is
    Port ( s : in  STD_LOGIC;
           i0 : in  STD_LOGIC_VECTOR (31 downto 0);
           i1 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component Mux3 is
    Port ( s : in  STD_LOGIC;
           i0 : in  STD_LOGIC_VECTOR (31 downto 0);
           i1 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component Mux4 is
    Port ( s : in  STD_LOGIC;
           i0 : in  STD_LOGIC_VECTOR (31 downto 0);
           i1 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component PC4 is
    Port ( PCIn : in  STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component PC is
    Port ( PCIn : in  STD_LOGIC_VECTOR (31 downto 0);
           PCOut  : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk: in std_logic;
			  rst: in std_logic);
end component;

component RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  rst : in  STD_LOGIC
         );
end component;

component ShiftLeft2 IS
	PORT (
		input  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END component;

component ShiftLeft2Jump IS
	PORT (
		input  : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(27 DOWNTO 0)
	);
END component;

component SignExtend is
    Port ( sin : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

	signal instruction: std_logic_vector(31 downto 0); 
	signal ALUOP: std_logic_vector(1 downto 0);
   signal memToReg: std_logic;
	signal memRead: std_logic;
   signal regDest: std_logic;
   signal jump: std_logic;
   signal memWrite: std_logic;
   signal ALUSrc: std_logic;
   signal branch: std_logic;
   signal regWrite: std_logic;
	
	signal writeData: std_logic_vector(31 downto 0); 
   signal readData1, readData2: std_logic_vector (31 downto 0);
	
   signal aluResult: std_logic_vector (31 downto 0);
   signal readDatamemory: std_logic_vector(31 downto 0); 
   signal muxToALU1: std_logic_vector(31 downto 0); 
	signal ALUController: std_logic_vector (3 downto 0);
	signal ALUZero: std_logic;
	signal branchAndALUZero: std_logic;
	
	signal immediate: std_logic_vector(15 downto 0);
   signal immediateExtend: std_logic_vector(31 downto 0); 
   signal immediateExtendShift: std_logic_vector(31 downto 0);
	
   signal opcode, funct: std_logic_vector(5 downto 0);
   signal rs, rt, rd: std_logic_vector( 4 downto 0);
	signal shamt: std_logic_vector(4 downto 0);
	signal writeReg: std_logic_vector(4 downto 0);	
	
	signal addressJump: std_logic_vector(25 downto 0);
	signal addressJumpShift: std_logic_vector(27 downto 0);
   signal concatPCAndincrementedAddress: std_logic_vector(31 downto 0);
	signal incrementedAddress : std_logic_vector(31 downto 0);
	signal ALU2add : std_logic_vector(31 downto 0);
	signal nextAddress: std_logic_vector(31 downto 0);
	signal instructionAddress: std_logic_vector(31 downto 0); 
	signal beforelastmuxresult: std_logic_vector(31 downto 0);

begin

   opcode <= instruction(31 downto 26);
	rs <= instruction(25 downto 21);
	rt <= instruction(20 downto 16);
	rd <= instruction(15 downto 11);
	--shamt <= instruction(10 downto 6);
	funct <= instruction(5 downto 0);
	immediate <= instruction(15 downto 0);
	addressJump <= instruction(25 downto 0);
	concatPCAndincrementedAddress <= incrementedAddress(31 downto 28) & addressJumpShift;
   branchAndALUZero <= branch and ALUZero;
	
	control1: Control port map ( opcode, regDest, memToReg, ALUOP, jump, branch, memRead, memWrite, ALUSrc, regWrite);
  
   ALU_Control1: ALUControl port map ( ALUOP, funct, ALUController);
	
	datamemory1: DATAMEMORY port map ( START, readData2, readDatamemory, memRead, memWrite, aluResult, CLK);
	
	instrmemory1: INSTRMEMORY port map( START, instruction, instructionAddress, CLK);

   signextend1: SignExtend port map ( immediate, immediateExtend);
	
	ALU1: ALU port map ( readData1, muxToALU1, ALUController, ALUZero, aluResult);
	
	PC1: PC port map ( nextAddress, instructionAddress, CLK, START);
	
	PC41: PC4 port map ( instructionAddress, incrementedAddress);
  shiftLeft21: ShiftLeft2 port map ( immediateExtend, immediateExtendShift);
	
	shiftLeft2Jump1: ShiftLeft2Jump port map ( addressJump, addressJumpShift);

	RegisterFile1: registerFile port map ( 
		clk  => CLK,
		write_ena => regWrite,
		read_sel1 => rs,
		read_sel2 => rt,
		write_sel => writeReg, 
		write_data => writeData, 
		data1 => readData1, 
		data2 => readData2,
		rst=> START
	);
	
	Mux41: Mux4 port map ( jump, beforelastmuxresult , concatPCAndincrementedAddress, nextAddress);
	
	ALU2add<= std_logic_vector(signed(immediateExtendShift) + signed(incrementedAddress));
	
	Mux31: Mux3 port map ( branchAndALUZero, incrementedAddress, ALU2add, beforelastmuxresult);
	
	Mux21: Mux2 port map ( memToReg, aluResult, readDatamemory, writeData);
	
   Mux11: Mux1 port map ( ALUSrc, readData2, immediateExtend, muxToALU1);
	
   Mux01: Mux0 port map ( regDest, rt, rd, writeReg);

	RegFileOut1<=readData1;
	RegFileOut2<=readData2;
	ALUOut<=aluResult;
	PCOut<=instructionAddress;
	DataMemOut<=readDatamemory;
	
end Behavioral;

