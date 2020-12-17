Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity PwmSig is
	generic ( n : integer := 8;
	          eoc : integer := 99
	         );
	         
	port ( clock, reset : in std_logic;
	       rapcyc       : in std_logic_vector (n-1 downto 0);
	       sigout       : out std_logic
	      );
end PwmSig;

architecture arch_PwmSig of PwmSig is
	signal i : integer range of 0 to 2**n-1 -- 256 bit res
	signal i_clk_div : integer range of 0 to eoc;
	signal clk_div : std_logic;
	


