Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


Entity aff is
port ( Q          : in std_logic_vector (3 downto 0);
	   Aff        : out std_logic_vector (6 downto 0));
end aff;

architecture arch_aff of aff is
begin
process (Q)
 begin
	Case Q is
	WHEN "0000" => 
	Aff <= "1000000";
	WHEN "0001" =>
	Aff <= "1111001";
	WHEN "0010" => 
	Aff <= "0100100";
	WHEN "0011" =>
	Aff <= "0110000";
	WHEN "0100" => 
	Aff <= "0011001";
	WHEN "0101" =>
	Aff <= "0010010";
	WHEN "0110" =>
	Aff <= "0000010";
	WHEN "0111" =>
	Aff <= "1111000";
	WHEN "1000" =>
	Aff <= "0000000";
	WHEN "1001" =>
	Aff <= "0010000";
	when others =>
	Aff <= "0000000";
	end Case;
end process;
end arch_aff;