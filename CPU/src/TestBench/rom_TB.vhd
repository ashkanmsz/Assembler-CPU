library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity rom_tb is
end rom_tb;

architecture TB_ARCHITECTURE of rom_tb is
	-- Component declaration of the tested unit
	component rom
	port(
		Address : in STD_LOGIC_VECTOR(5 downto 0);
		Data : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Address : STD_LOGIC_VECTOR(5 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Data : STD_LOGIC_VECTOR(5 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : rom
		port map (
			Address => Address,
			Data => Data
		);

	-- Add your stimulus here ...
	
	process	 
	begin
	Address <= "000000"; wait for 25 ns;
	Address <= "000001"; wait for 25 ns;
	Address <= "000010"; wait for 25 ns;
	Address <= "000011"; wait for 25 ns;
	Address <= "000100"; wait for 25 ns;
	Address <= "000101"; wait for 25 ns;
	wait;
	
	
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_rom of rom_tb is
	for TB_ARCHITECTURE
		for UUT : rom
			use entity work.rom(rom);
		end for;
	end for;
end TESTBENCH_FOR_rom;

