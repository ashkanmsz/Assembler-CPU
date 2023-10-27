library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity mainregisters is	
	port(  
		RIN0,RIN1,RIN2,RIN3 : in std_logic_vector(5 downto 0);
		CLK : in std_logic;
		LD0,LD1,LD2,LD3 : in std_logic;
		ROUT0,ROUT1,ROUT2,ROUT3 : out std_logic_vector(5 downto 0);
		ZR0,ZR1,ZR2,ZR3 : out std_logic
		);
	
end mainregisters;


architecture mainregisters of mainregisters is 
 
signal RN0,RN1,RN2,RN3,R_0,R_1,R_2,R_3: std_logic_vector(5 downto 0);

begin

------------------------------ MAIN registers ------------------------------		   
	  			
			
	RN0 <= RIN0 when (LD0='1') else R_0;
	RN1 <= RIN1 when (LD1='1') else R_1;
	RN2 <= RIN2 when (LD2='1') else R_2;
	RN3 <= RIN3 when (LD3='1') else R_3;
				
MAIN: 
	
	process(CLK)
    begin
		if(rising_edge(CLK)) then
			R_0 <= RN0;
			R_1 <= RN1;
			R_2 <= RN2;
			R_3 <= RN3;
		end if;
	end process MAIN;
				
	ROUT0 <= R_0;
	ROUT1 <= R_1;
	ROUT2 <= R_2;
	ROUT3 <= R_3;
				 
	ZR0 <= '1' when (R_0="000000") else '0';
	ZR1 <= '1' when (R_1="000000") else '0';
	ZR2 <= '1' when (R_2="000000") else '0';
	ZR3 <= '1' when (R_3="000000") else '0';	   

end mainregisters;
