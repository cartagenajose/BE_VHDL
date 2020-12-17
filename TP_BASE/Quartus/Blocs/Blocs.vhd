Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

Entity Blocs is
port (
  Clock, reset : in std_logic;
  s            : inout std_logic;
  q            : inout std_logic_vector (3 downto 0);
  af          : out std_logic_vector (6 downto 0));
	end Blocs;
Architecture arch_Blocs of Blocs is 
 signal R: STD_logic_vector (25 downto 0);
 signal Sig: STD_logic; 
 signal digit_lsb : std_logic_vector (3 downto 0);

	component div is 
 port ( 
		CLK : IN std_logic;
		S   : inout std_logic);
	  end component; 

	component Compteur is 
port ( RESET, CLK : in std_logic;
	   Q          : inout std_logic_vector (3 downto 0));
end component;

component aff is
port ( Q          : in std_logic_vector (3 downto 0);
	   Aff        : out std_logic_vector (6 downto 0));
end component;

	Begin
	U1:div
	port map (CLK=> Clock, S=>s);
	U2:Compteur
	port map (CLK=> s, RESET=>reset, Q=>q);
	U3:aff
	port map (Q=>q, Aff=>af);
end arch_Blocs;

