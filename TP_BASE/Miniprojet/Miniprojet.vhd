
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

ENTITY diviseur is 
 port ( CLK : IN  std logic;
        S   : out std logic);  
  end diviseur;
  
Architecture arch_diviseur of diviseur is 
 signal sig : STD_LOGIC_VECTOR (27 down to 0);
 signal sigint : STD_LOGIC ;
    BEGIN 
    
     PROCESS (CLK)
           begin 
			if (CLK'EVENT AND CLK='1') THEN
			sig <= sig+1;
				if (sig = 25000000) then
					sigint <= not sigint;
					sig <= 0;
				end if;
			
           end if; 
     end process; 
   S <= sigint;
 
END diviseur;