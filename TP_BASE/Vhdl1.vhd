
Library ieee;
use ieee.std_logic_1164.all;

ENTITY PorteET IS
		PORT(
			a,b						: IN	STD_LOGIC;
			s						: OUT	STD_LOGIC);
END PorteET;

ARCHITECTURE arch_PorteET of PorteET is
BEGIN 
	s <= a AND b;
END arch_PorteET;