library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity main is
	port(
		CLK : in STD_LOGIC;
		RESET_main : in STD_LOGIC;
		BUS_Select : out STD_LOGIC;
		INCREMENTPC : out std_logic ;
		CMD_final : out STD_LOGIC;
		IR_final : out STD_LOGIC_VECTOR(5 downto 0);
		LD_final : out STD_LOGIC_VECTOR(0 to 3);
		R_out0 : out STD_LOGIC_VECTOR(5 downto 0);
		R_out1 : out STD_LOGIC_VECTOR(5 downto 0);
		R_out2 : out STD_LOGIC_VECTOR(5 downto 0);
		R_out3 : out STD_LOGIC_VECTOR(5 downto 0);
		Select0 : out STD_LOGIC_VECTOR(1 downto 0);
		Select1 : out STD_LOGIC_VECTOR(1 downto 0);
		ALU_R : out STD_LOGIC_VECTOR(5 downto 0);
		busdata_out : out STD_LOGIC_VECTOR(5 downto 0);
		MemoryData : out STD_LOGIC_VECTOR(5 downto 0)
		);
end main;

architecture main of main is


signal sel_0,sel_1 : std_logic_vector(1 downto 0);
signal MemData,Addrs,ALURESULT,data_bus,outIR,input1,input2,Rout0,Rout1,Rout2,Rout3 : std_logic_vector(5 downto 0);
signal Z_0,Z_1,Z_2,Z_3,load0,load1,load2,load3,loadPC,loadIR,select_bus,ALUCM_D,res_t,incremnr : std_logic; 

----------------------------------------- alu ------------------------------------------------------------

component ALU
	port(
		input_1,input_2 : in std_logic_vector(5 downto 0);
		cmd : in std_logic;
		result : out std_logic_vector(5 downto 0)
			);
end component;

------------------------------------ mainregisters -------------------------------------------------------- 

component mainregisters 
	port(  RIN0,RIN1,RIN2,RIN3 : in std_logic_vector(5 downto 0);
		CLK : in std_logic;
		LD0,LD1,LD2,LD3 : in std_logic;
		ROUT0,ROUT1,ROUT2,ROUT3 : out std_logic_vector(5 downto 0);
		ZR0,ZR1,ZR2,ZR3 : out std_logic
		);
end component;	

------------------------------------------ IR_PC -------------------------------------------------------- 

component IR_PC 
	port(  RINPC,RINIR : in std_logic_vector(5 downto 0);
		CLK : in std_logic;
		LDPC,LDIR,INCrement,R_ST  : in std_logic;
		ROUTPC,ROUTIR : out std_logic_vector(5 downto 0)
		);
end component;

------------------------------------------- mux -------------------------------------------------------
		 
component mux 
	port( i0,i1,i2,i3,i4,i5,i6,i7: in std_logic_vector(5 downto 0);
		Mdata,ALURes : in std_logic_vector(5 downto 0);
		S0 : in std_logic_vector(1 downto 0);
		S1 : in std_logic_vector(1 downto 0);
		bus_sel : in std_logic;
		mux_bus,mux0,mux1 : out std_logic_vector(5 downto 0)
		);
end component;

------------------------------------------- ROM --------------------------------------------------------

component rom
	port(
	    Address : in std_logic_vector(5 downto 0);
		Data : out std_logic_vector(5 downto 0)
		);
		 
end component;


--------------------------------------- control unit ------------------------------------------------------

component ControlUnit
	port( 
		clock,rst: in std_logic;
		ZR0,ZR1,ZR2,ZR3 : in std_logic;
		ROUT_IR : in std_logic_vector(5 downto 0);
		LD0,LD1,LD2,LD3 : out std_logic;
		LD_PC , LD_IR :out std_logic;
		Sel0: out std_logic_vector(1 downto 0);
		Sel1: out std_logic_vector(1 downto 0);
		BusSelect , ALU_CMD : out std_logic;
		INC , CLR : out std_logic
		);
	
end component;		 

-------------------------------------------------------------------------------------------------------------------------
begin
 
    alu_map : ALU port map (input1,input2,ALUCM_D,ALURESULT) ;
	mainregisters_map : mainregisters port map (Data_bus,Data_bus,Data_bus,Data_bus,CLK,load0,load1,load2,load3,Rout0,Rout1,Rout2,Rout3,Z_0,Z_1,Z_2,Z_3) ;
	IR_PC_map : IR_PC port map (Data_bus,Data_bus,CLK,loadPC,loadIR,incremnr,res_t,Addrs,outIR);
	mux_map : mux port map (Rout0,Rout1,Rout2,Rout3,Rout0,Rout1,Rout2,Rout3,MemData,ALURESULT,sel_0,sel_1,select_bus,Data_bus,input1,input2) ;
	ControlUnit_map : ControlUnit port map (CLK,RESET_main,Z_0,Z_1,Z_2,Z_3,outIR,load0,load1,load2,load3,loadPC,loadIR,sel_0,sel_1,select_bus,ALUCM_D,incremnr,res_t);
	rom_map : rom port map (Addrs,MemData) ;
	
 	
	BUS_Select <= select_bus;
	INCREMENTPC <= incremnr;
	CMD_final <= ALUCM_D;
	IR_final <= outIR;
	LD_final(0) <= load0;
	LD_final(1) <= load1;
	LD_final(2) <= load2;
	LD_final(3) <= load3;
	R_out0 <= Rout0;
	R_out1 <= Rout1;
	R_out2 <= Rout2;
	R_out3 <= Rout3;
	Select0 <= sel_0;
	Select1 <= sel_1;
	ALU_R <= ALURESULT;
	busdata_out <= Data_bus;
	MemoryData <= MemData;
		
	
end main;
