library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity mux_tb is
end mux_tb;

architecture TB_ARCHITECTURE of mux_tb is
	-- Component declaration of the tested unit
	component mux
	port(
		i0 : in STD_LOGIC_VECTOR(5 downto 0);
		i1 : in STD_LOGIC_VECTOR(5 downto 0);
		i2 : in STD_LOGIC_VECTOR(5 downto 0);
		i3 : in STD_LOGIC_VECTOR(5 downto 0);
		i4 : in STD_LOGIC_VECTOR(5 downto 0);
		i5 : in STD_LOGIC_VECTOR(5 downto 0);
		i6 : in STD_LOGIC_VECTOR(5 downto 0);
		i7 : in STD_LOGIC_VECTOR(5 downto 0);
		Mdata : in STD_LOGIC_VECTOR(5 downto 0);
		ALURes : in STD_LOGIC_VECTOR(5 downto 0);
		S0 : in STD_LOGIC_VECTOR(1 downto 0);
		S1 : in STD_LOGIC_VECTOR(1 downto 0);
		bus_sel : in STD_LOGIC;
		mux_bus : out STD_LOGIC_VECTOR(5 downto 0);
		mux0 : out STD_LOGIC_VECTOR(5 downto 0);
		mux1 : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal i0 : STD_LOGIC_VECTOR(5 downto 0):= (others => '0');
	signal i1 : STD_LOGIC_VECTOR(5 downto 0):= (others => '0');
	signal i2 : STD_LOGIC_VECTOR(5 downto 0):= (others => '0');
	signal i3 : STD_LOGIC_VECTOR(5 downto 0):= (others => '0');
	signal i4 : STD_LOGIC_VECTOR(5 downto 0):= (others => '0');
	signal i5 : STD_LOGIC_VECTOR(5 downto 0):= (others => '0');
	signal i6 : STD_LOGIC_VECTOR(5 downto 0):= (others => '0');
	signal i7 : STD_LOGIC_VECTOR(5 downto 0):= (others => '0');
	signal Mdata : STD_LOGIC_VECTOR(5 downto 0):= (others => '0');
	signal ALURes : STD_LOGIC_VECTOR(5 downto 0):= (others => '0');
	signal S0 : STD_LOGIC_VECTOR(1 downto 0):= (others => '0');
	signal S1 : STD_LOGIC_VECTOR(1 downto 0):= (others => '0');
	signal bus_sel : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal mux_bus : STD_LOGIC_VECTOR(5 downto 0);
	signal mux0 : STD_LOGIC_VECTOR(5 downto 0);
	signal mux1 : STD_LOGIC_VECTOR(5 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : mux
		port map (
			i0 => i0,
			i1 => i1,
			i2 => i2,
			i3 => i3,
			i4 => i4,
			i5 => i5,
			i6 => i6,
			i7 => i7,
			Mdata => Mdata,
			ALURes => ALURes,
			S0 => S0,
			S1 => S1,
			bus_sel => bus_sel,
			mux_bus => mux_bus,
			mux0 => mux0,
			mux1 => mux1
		);

	-- Add your stimulus here ...
	
	
	    process
	     begin
	
			 i0 <= "000000";
			 i1 <= "000001";
			 i2 <= "000010";
			 i3 <= "000011";
			 i4 <= "000100";
			 i5 <= "000101";
			 i6 <= "000110";
			 i7 <= "000111";
			 Mdata <= "001000";
			 ALURes <= "001001";
			 S0 <= "01";
			 S1 <= "11";
			 bus_sel <= '0';
			 
			 WAIT FOR 10 NS;
			 S0 <= "00";
			 S1 <= "10";
			 bus_sel <= '1';
			 WAIT FOR 10 NS;
			 wait;
			 end process;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mux of mux_tb is
	for TB_ARCHITECTURE
		for UUT : mux
			use entity work.mux(mux);
		end for;
	end for;
end TESTBENCH_FOR_mux;

