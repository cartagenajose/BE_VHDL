
LIBRARY       IEEE;
USE           IEEE.STD_LOGIC_1164.ALL;
use           ieee.std_logic_unsigned.all;
use           IEEE.NUMERIC_STD.all;


ENTITY  pmw1 IS
generic(N : integer := 8
);
PORT(
clk                         :             in     std_logic;
--reset                     :             in     std_logic;
PWMOut                      :             out     std_logic;
rapport_Cyclique_SWs              :             in     std_logic_vector(3 downto 0)
);
END pmw1;

ARCHITECTURE pwm of pmw1 IS

signal counter_PWM: std_logic_vector(N-1 downto 0):=(others => '0');
signal rapport_Cyclique: std_logic_vector(N-1 downto 0):=x"00";

BEGIN

rapport_Cyclique <=   x"00" when rapport_Cyclique_SWs = "0000"  else
                x"0A" when rapport_Cyclique_SWs = "0001"  else
                x"14" when rapport_Cyclique_SWs = "0010"  else
                x"1E" when rapport_Cyclique_SWs = "0011"  else
                x"28" when rapport_Cyclique_SWs = "0100"  else
                x"32" when rapport_Cyclique_SWs = "0101"  else
                x"3C" when rapport_Cyclique_SWs = "0110"  else
                x"46" when rapport_Cyclique_SWs = "0111"  else
                x"50" when rapport_Cyclique_SWs = "1000"  else
                x"5A" when rapport_Cyclique_SWs = "1001"  else
                x"64" when rapport_Cyclique_SWs = "1010"  else
                x"00";

compteur : PROCESS(clk)
begin
if rising_edge(clk) then
   counter_PWM <= counter_PWM + x"1";
   if counter_PWM > x"64" then
      counter_PWM <= x"00";
    end if;
end if;
end PROCESS;
PWMOut <= '1' when counter_PWM < rapport_Cyclique else '0';
               
               
END ARCHITECTURE pwm;