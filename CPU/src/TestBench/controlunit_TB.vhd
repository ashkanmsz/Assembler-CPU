library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity controlunit_tb is
end controlunit_tb;

architecture TB_ARCHITECTURE of controlunit_tb is
	-- Component declaration of the tested unit
	component controlunit
	port(
		clock : in STD_LOGIC;
		rst : in STD_LOGIC;
		ZR0 : in STD_LOGIC;
		ZR1 : in STD_LOGIC;
		ZR2 : in STD_LOGIC;
		ZR3 : in STD_LOGIC;
		ROUT_IR : in STD_LOGIC_VECTOR(5 downto 0);
		LD0 : out STD_LOGIC;
		LD1 : out STD_LOGIC;
		LD2 : out STD_LOGIC;
		LD3 : out STD_LOGIC;
		LD_PC : out STD_LOGIC;
		LD_IR : out STD_LOGIC;
		Sel0 : out STD_LOGIC_VECTOR(1 downto 0);
		Sel1 : out STD_LOGIC_VECTOR(1 downto 0);
		BusSelect : out STD_LOGIC;
		ALU_CMD : out STD_LOGIC;
		INC : out STD_LOGIC;
		CLR : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clock : STD_LOGIC:= '0';
	signal rst : STD_LOGIC:= '0';
	signal ZR0 : STD_LOGIC:= '0';
	signal ZR1 : STD_LOGIC:= '0';
	signal ZR2 : STD_LOGIC:= '0';
	signal ZR3 : STD_LOGIC:= '0';
	signal ROUT_IR : STD_LOGIC_VECTOR(5 downto 0) := (others=> '0');
	-- Observed signals - signals mapped to the output ports of tested entity
	signal LD0 : STD_LOGIC;
	signal LD1 : STD_LOGIC;
	signal LD2 : STD_LOGIC;
	signal LD3 : STD_LOGIC;
	signal LD_PC : STD_LOGIC;
	signal LD_IR : STD_LOGIC;
	signal Sel0 : STD_LOGIC_VECTOR(1 downto 0);
	signal Sel1 : STD_LOGIC_VECTOR(1 downto 0);
	signal BusSelect : STD_LOGIC;
	signal ALU_CMD : STD_LOGIC;
	signal INC : STD_LOGIC;
	signal CLR : STD_LOGIC;

	-- Add your code here ...
	
begin

	-- Unit Under Test port map
	UUT : controlunit
		port map (
			clock => clock,
			rst => rst,
			ZR0 => ZR0,
			ZR1 => ZR1,
			ZR2 => ZR2,
			ZR3 => ZR3,
			ROUT_IR => ROUT_IR,
			LD0 => LD0,
			LD1 => LD1,
			LD2 => LD2,
			LD3 => LD3,
			LD_PC => LD_PC,
			LD_IR => LD_IR,
			Sel0 => Sel0,
			Sel1 => Sel1,
			BusSelect => BusSelect,
			ALU_CMD => ALU_CMD,
			INC => INC,
			CLR => CLR
		);
		
		
	
 	process
	begin 
		
		   rst <= '1';
		   clock <= '0';
		   ROUT_IR <= "011011";
		   ZR0 <= '1';
		   ZR1 <= '1';
		   ZR2 <= '1';
		   ZR3 <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   rst <= '0';
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   clock <= '0';
		   ROUT_IR <= "000110";
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns; 
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   ROUT_IR <= "110011";
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns; 
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   ROUT_IR <= "111101";
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns; 
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   ROUT_IR <= "000000";
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns; 
		   clock <= '0';
		   wait for 2 ns;
		   clock <= '1';
		   wait for 2 ns;
		   wait;
		   
	 end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_controlunit of controlunit_tb is
	for TB_ARCHITECTURE
		for UUT : controlunit
			use entity work.controlunit(controlunit);
		end for;
	end for;
end TESTBENCH_FOR_controlunit;
