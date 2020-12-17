Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity clock_div is

generic ( eoc : integer := 99
	     );
	     
port ( CLK, RESET : in std_logic
	  );
end clock_div;

architecture arch_clock_div of clock_div is
signal cpt_clk_div : integer range 0 to eoc;
signal clk_div : std_logic;

begin

process (CLK) begin
	if rising_edge(CLK) then
		clk_div <= '0';
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
