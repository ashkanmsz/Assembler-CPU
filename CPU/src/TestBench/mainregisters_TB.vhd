library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity mainregisters_tb is
end mainregisters_tb;

architecture TB_ARCHITECTURE of mainregisters_tb is
	-- Component declaration of the tested unit
	component mainregisters
	port(
		RIN0 : in STD_LOGIC_VECTOR(5 downto 0);
		RIN1 : in STD_LOGIC_VECTOR(5 downto 0);
		RIN2 : in STD_LOGIC_VECTOR(5 downto 0);
		RIN3 : in STD_LOGIC_VECTOR(5 downto 0);
		CLK : in STD_LOGIC;
		LD0 : in STD_LOGIC;
		LD1 : in STD_LOGIC;
		LD2 : in STD_LOGIC;
		LD3 : in STD_LOGIC;
		ROUT0 : out STD_LOGIC_VECTOR(5 downto 0);
		ROUT1 : out STD_LOGIC_VECTOR(5 downto 0);
		ROUT2 : out STD_LOGIC_VECTOR(5 downto 0);
		ROUT3 : out STD_LOGIC_VECTOR(5 downto 0);
		ZR0 : out STD_LOGIC;
		ZR1 : out STD_LOGIC;
		ZR2 : out STD_LOGIC;
		ZR3 : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal RIN0 : STD_LOGIC_VECTOR(5 downto 0);
	signal RIN1 : STD_LOGIC_VECTOR(5 downto 0);
	signal RIN2 : STD_LOGIC_VECTOR(5 downto 0);
	signal RIN3 : STD_LOGIC_VECTOR(5 downto 0);
	signal CLK : STD_LOGIC;
	signal LD0 : STD_LOGIC;
	signal LD1 : STD_LOGIC;
	signal LD2 : STD_LOGIC;
	signal LD3 : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ROUT0 : STD_LOGIC_VECTOR(5 downto 0);
	signal ROUT1 : STD_LOGIC_VECTOR(5 downto 0);
	signal ROUT2 : STD_LOGIC_VECTOR(5 downto 0);
	signal ROUT3 : STD_LOGIC_VECTOR(5 downto 0);
	signal ZR0 : STD_LOGIC;
	signal ZR1 : STD_LOGIC;
	signal ZR2 : STD_LOGIC;
	signal ZR3 : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : mainregisters
		port map (
			RIN0 => RIN0,
			RIN1 => RIN1,
			RIN2 => RIN2,
			RIN3 => RIN3,
			CLK => CLK,
			LD0 => LD0,
			LD1 => LD1,
			LD2 => LD2,
			LD3 => LD3,
			ROUT0 => ROUT0,
			ROUT1 => ROUT1,
			ROUT2 => ROUT2,
			ROUT3 => ROUT3,
			ZR0 => ZR0,
			ZR1 => ZR1,
			ZR2 => ZR2,
			ZR3 => ZR3
		);


	process
	begin
	CLK <= '0';
	--------------
	LD0 <= '0';
	LD1 <= '0';
	LD2 <= '0';
	LD3 <= '0';
	-------------------
	RIN0 <= "111111";
	RIN1 <= "000000";
	RIN2 <= "000011";
	RIN3 <= "010101";
	------------------	
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
	CLK <='1';
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
	LD0 <= '1';
	LD1 <= '1';
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	CLK <= '0';
	LD2 <= '1';
	LD3 <= '1';
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	CLK <= '0';
	LD0 <= '0';
	LD1 <= '0';
	WAIT FOR 5 NS;
	CLK <= '1';
	WAIT FOR 5 NS;
	wait;
	end Process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mainregisters of mainregisters_tb is
	for TB_ARCHITECTURE
		for UUT : mainregisters
			use entity work.mainregisters(mainregisters);
		end for;
	end for;
end TESTBENCH_FOR_mainregisters;

