library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		input_1 : in STD_LOGIC_VECTOR(5 downto 0);
		input_2 : in STD_LOGIC_VECTOR(5 downto 0);
		cmd : in STD_LOGIC;
		result : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input_1 : STD_LOGIC_VECTOR(5 downto 0);
	signal input_2 : STD_LOGIC_VECTOR(5 downto 0);
	signal cmd : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal result : STD_LOGIC_VECTOR(5 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			input_1 => input_1,
			input_2 => input_2,
			cmd => cmd,
			result => result
		);


		-- Add your stimulus here ...
		process
	begin
		input_1 <= "000101";
		input_2 <= "000011";
		
	cmd <= '0';
	WAIT FOR 10 NS;
	cmd <= '1';
	WAIT FOR 10 NS;
	wait;		
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(alu);
		end for;
	end for;
end TESTBENCH_FOR_alu;

