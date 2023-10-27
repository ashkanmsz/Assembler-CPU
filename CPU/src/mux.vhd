library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity mux is	
	port(
		i0,i1,i2,i3,i4,i5,i6,i7: in std_logic_vector(5 downto 0);
		Mdata,ALURes : in std_logic_vector(5 downto 0);
		S0 : in std_logic_vector(1 downto 0);
		S1 : in std_logic_vector(1 downto 0);
		bus_sel : in std_logic;
		mux_bus,mux0,mux1 : out std_logic_vector(5 downto 0)
		);
end mux;



architecture mux of mux is
begin  
	
----------------------------- bus mux ----------------------------------

MUXBUS: process(bus_sel,Mdata,ALURes)
		begin
			case bus_sel is
				when '0' => mux_bus <= Mdata;
				when '1' => mux_bus <= ALURes;
				when others => mux_bus<= (others => 'X');						  
			end case;
		end process MUXBUS;
	   
---------------------------- alu muxes ---------------------------------

M_0: 	
		process(S0,i0,i1,i2,i3)
		begin
			case S0 is
				when "00" => mux0 <= i0;
				when "01" => mux0 <= i1;
				when "10" => mux0 <= i2;
				when "11" => mux0 <= i3;
				when others => mux0 <= (others => 'X');
			end case;
		end process M_0;
	   
	   
M_1: 	
		process(S1,i4,i5,i6,i7)
		begin
			case S1 is
				when "00" => mux1 <= i4;
				when "01" => mux1 <= i5;
				when "10" => mux1 <= i6;
				when "11" => mux1 <= i7;	
				when others => mux1 <= (others => 'X');
			end case;
		end process M_1;
 
end mux;
