library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_UNSIGNED.all;

entity IR_PC is
	port(  
	    RINPC,RINIR : in std_logic_vector(5 downto 0);
	    CLK : in std_logic;
		LDPC,LDIR,INCrement,R_ST  : in std_logic;
		ROUTPC,ROUTIR : out std_logic_vector(5 downto 0)
		);
	
end IR_PC;



architecture IR_PC of IR_PC is 

signal RN0,RN1,RN2,RN3,R_0,R_1,R_2,R_3,pc1 : std_logic_vector(5 downto 0);

begin

--------------------------------- IR register  -----------------------------	

IR: process(CLK)
    begin
		if(rising_edge(CLK)) then
			if(LDIR='1') then
		        ROUTIR <= RINIR ;
			end if;
		end if;
	end process IR;  
					  
-------------------------------- PC register --------------------------------					
	           
PC: process(CLK,R_ST)
	begin 
			
		if(R_ST='1') then
			pc1 <= (others => '0');
		elsif(rising_edge(CLK)) then
			if(LDPC='1') then
				pc1 <= RINPC;
			end if;
			if(INCrement='1') then
				pc1 <= pc1 + 1;
			end if;	
		end if;
	
	end process PC;
	
	ROUTPC <= pc1;

end IR_PC;
