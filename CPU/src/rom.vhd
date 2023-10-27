library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
use ieee.numeric_std.all; 

entity rom is	
	port(
	    Address : in std_logic_vector(5 downto 0);
		Data : out std_logic_vector(5 downto 0)
		);	
end rom;

architecture rom of rom is

type ROM_type is array(0 to 63) of std_logic_vector(5 downto 0);
signal m : ROM_type;
begin
		m(0) <= "000011" ;
		m(1) <= "000000" ;
		m(2) <= "000111" ;
		m(3) <= "000001" ;
		m(4) <= "001011" ;
		m(5) <= "000111" ;
		m(6) <= "001111" ;
		m(7) <= "001000" ;
		m(8) <= "010010" ;
		m(9) <= "101101" ;
		m(10) <= "111111" ;
		m(11) <= "001000" ;
		m(12) <= "000000" ;

	Data <= m(to_integer(unsigned(Address)));
	     
end rom;
