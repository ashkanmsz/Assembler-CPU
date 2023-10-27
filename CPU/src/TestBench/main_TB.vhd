library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity main_tb is
end main_tb;

architecture TB_ARCHITECTURE of main_tb is
	-- Component declaration of the tested unit
	component main
	port(
		CLK : in STD_LOGIC;
		RESET_main : in STD_LOGIC;
		BUS_Select : out STD_LOGIC;
		INCREMENTPC : out STD_LOGIC;
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
		MemoryData : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CLK : STD_LOGIC;
	signal RESET_main : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal BUS_Select : STD_LOGIC;
	signal INCREMENTPC : STD_LOGIC;
	signal CMD_final : STD_LOGIC;
	signal IR_final : STD_LOGIC_VECTOR(5 downto 0);
	signal LD_final : STD_LOGIC_VECTOR(0 to 3);
	signal R_out0 : STD_LOGIC_VECTOR(5 downto 0);
	signal R_out1 : STD_LOGIC_VECTOR(5 downto 0);
	signal R_out2 : STD_LOGIC_VECTOR(5 downto 0);
	signal R_out3 : STD_LOGIC_VECTOR(5 downto 0);
	signal Select0 : STD_LOGIC_VECTOR(1 downto 0);
	signal Select1 : STD_LOGIC_VECTOR(1 downto 0);
	signal ALU_R : STD_LOGIC_VECTOR(5 downto 0);
	signal busdata_out : STD_LOGIC_VECTOR(5 downto 0);
	signal MemoryData : STD_LOGIC_VECTOR(5 downto 0);

   constant CLK_period : time := 10 ns;



begin

	-- Unit Under Test port map
	UUT : main
		port map (
			CLK => CLK,
			RESET_main => RESET_main,
			BUS_Select => BUS_Select,
			INCREMENTPC => INCREMENTPC,
			CMD_final => CMD_final,
			IR_final => IR_final,
			LD_final => LD_final,
			R_out0 => R_out0,
			R_out1 => R_out1,
			R_out2 => R_out2,
			R_out3 => R_out3,
			Select0 => Select0,
			Select1 => Select1,
			ALU_R => ALU_R,
			busdata_out => busdata_out,
			MemoryData => MemoryData
		);

	-- Add your stimulus here ... 
		 CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
	 RESET_main <= '0';
	 wait for CLK_period/2;
     RESET_main <= '1';
	 wait for CLK_period/2;
	 RESET_main <= '0';
	 wait;		   
   end process;
   
   

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_main of main_tb is
	for TB_ARCHITECTURE
		for UUT : main
			use entity work.main(main);
		end for;
	end for;
end TESTBENCH_FOR_main;

