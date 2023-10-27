library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity alu is
	
	port(
	    input_1,input_2 : in std_logic_vector(5 downto 0);
	    cmd : in std_logic;
	    result : out std_logic_vector(5 downto 0)
		);
	
end alu;



architecture alu of alu is
signal aluresult : unsigned(5 downto 0);
signal a,b : unsigned(5 downto 0);   

begin		 	  

	a <= unsigned(input_1);
	b <= unsigned(input_2);
	    
	process(cmd,a,b)
	begin	 
		case cmd is 
			when '0' => aluresult <= a + b;
			when '1' => aluresult <= a - b;
			when others => aluresult <= (others => 'X');
		end case;
	end process;
	 
	result <= std_logic_vector(aluresult);

end alu;
