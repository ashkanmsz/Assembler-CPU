library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity ir_pc_tb is
end ir_pc_tb;

architecture TB_ARCHITECTURE of ir_pc_tb is
	-- Component declaration of the tested unit
	component ir_pc
	port(
		RINPC : in STD_LOGIC_VECTOR(5 downto 0);
		RINIR : in STD_LOGIC_VECTOR(5 downto 0);
		CLK : in STD_LOGIC;
		LDPC : in STD_LOGIC;
		LDIR : in STD_LOGIC;
		INCrement : in STD_LOGIC;
		R_ST : in STD_LOGIC;
		ROUTPC : out STD_LOGIC_VECTOR(5 downto 0);
		ROUTIR : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal RINPC : STD_LOGIC_VECTOR(5 downto 0);
	signal RINIR : STD_LOGIC_VECTOR(5 downto 0);
	signal CLK : STD_LOGIC;
	signal LDPC : STD_LOGIC;
	signal LDIR : STD_LOGIC;
	signal INCrement : STD_LOGIC;
	signal R_ST : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ROUTPC : STD_LOGIC_VECTOR(5 downto 0);
	signal ROUTIR : STD_LOGIC_VECTOR(5 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : ir_pc
		port map (
			RINPC => RINPC,
			RINIR => RINIR,
			CLK => CLK,
			LDPC => LDPC,
			LDIR => LDIR,
			INCrement => INCrement,
			R_ST => R_ST,
			ROUTPC => ROUTPC,
			ROUTIR => ROUTIR
		);

	-- Add your stimulus here ...	 
	
process
	begin
	R_ST <= '1';
	RINPC <= "000100";
	INCrement <= '0';
	CLK <= '0';
	--------------
	LDPC <= '0';
	LDIR <= '0'; 
	-------------------
	RINIR <= "000110";
	------------------	
	WAIT FOR 10 NS;
	R_ST <= '0';
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	LDPC <= '1';
	CLK <= '0';
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	CLK <= '0';
	RINPC <= "001100";
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	RINPC <= "011100";
	INCrement <= '1';
	LDPC <= '0';
	CLK <= '0';
	WAIT FOR 5 NS;
	CLK <='1';
	WAIT FOR 5 NS;
	CLK <= '0';
	LDIR <= '1';
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	CLK <= '0';
	LDIR <= '0';
	RINIR <= "010000";
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	CLK <= '0';
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	CLK <= '0';
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	CLK <= '0';
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	wait;	
	end Process;	
		

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_ir_pc of ir_pc_tb is
	for TB_ARCHITECTURE
		for UUT : ir_pc
			use entity work.ir_pc(ir_pc);
		end for;
	end for;
end TESTBENCH_FOR_ir_pc;

