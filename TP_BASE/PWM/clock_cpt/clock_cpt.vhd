Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity clock_cpt is

generic ( n : integer := 8
	     );
	     
port ( RESET : in std_logic
	  );
end clock_cpt;

architecture arch_clock_cpt of clock_cpt is
signal clk_div : std_logic;
signal cpt : integer range 0 to 2**n-1;

begin

process (clk_div) begin
	if rising_edge(clk_div) then
		if reset = '1' then
			cpt_clk_div <= 0;
		elsif cpt_clk_div = eoc then
			cpt_clk_div <= 0;
			clk_div <= '1';
		else cpt_clk_div <= cpt_clk_div +1;
		end if;
	end if;
end process;
end arch_clock_div;