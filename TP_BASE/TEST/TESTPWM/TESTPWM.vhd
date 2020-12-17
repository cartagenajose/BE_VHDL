LIBRARY       IEEE;
USE           IEEE.STD_LOGIC_1164.ALL;
use           ieee.std_logic_unsigned.all;
use           IEEE.NUMERIC_STD.all;


ENTITY TESTPWM IS
generic(N : integer := 20
	    
);
PORT(
clk                         :             in     std_logic;
--reset                     :             in     std_logic;
PWMOut                      :             out     std_logic

);
END  TESTPWM ;

ARCHITECTURE pwm of TESTPWM  IS

signal counter_PWM: std_logic_vector(N-1 downto 0):=(others => '0');
signal rapport_Cyclique: std_logic_vector(N-1 downto 0):= (others=>'0');

BEGIN

rapport_Cyclique <=   x"186a0" ;                                                                      
               
             
               
                                                                                                

compteur : PROCESS(clk)
begin
if rising_edge(clk) then
   counter_PWM <= counter_PWM + x"1";
   if counter_PWM > x"30d40" then
      counter_PWM <= x"00000";
    end if;
end if;
end PROCESS;

PWMOut <= '1' when counter_PWM < rapport_Cyclique else '0';
               
               
END ARCHITECTURE pwm;