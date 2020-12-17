Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity Compteur is
port ( RESET, CLK : in std_logic;
	   Q          : inout std_logic_vector (3 downto 0));
end Compteur;

architecture arch_Compteur of Compteur is
signal DIGIT_LSB : std_logic_vector (3 downto 0);
begin 
	process (RESET,CLK)
	begin
	if RESET ='1' then DIGIT_LSB <= (others=>'0');
	elsif (CLK ='1' and CLK'event) then 
		if DIGIT_LSB < 9 then DIGIT_LSB <= DIGIT_LSB + 1;
						 else DIGIT_LSB <= (others=>'0');
		end if;
		end if;
	end process;
Q <= DIGIT_LSB;
end arch_Compteur;