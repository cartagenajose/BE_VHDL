
library ieee;
use ieee.std_logic_1164.all;

Entity ETVhdl is 
port (
        a,b         : IN std_logic;
         c           : out std_logic);
end ETVhdl;

Architecture arch_ETVhdl of ETVhdl is 

Begin 
       c <= a AND b;
       
end arch_ETVhdl;

