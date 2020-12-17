Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

Entity div is 
 port ( 
		CLK : IN std_logic;
		S   : inout std_logic);
	  end div; 
Architecture diviseur of div is 
 signal reg: STD_logic_vector (25 downto 0);
 signal Ssig: STD_logic; 
 
 Begin 

process (CLK)
begin 
     if (CLK='1' and CLK'event) then 
     reg<= reg+'1';
        if (reg=100000) then 
           reg<=( others=>'0' );
           Ssig<= not Ssig; 
        end if;
     
     end if;
      
end process;
S<=Ssig; 

end diviseur; 