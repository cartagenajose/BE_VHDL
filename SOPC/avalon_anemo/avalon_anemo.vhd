LIBRARY       IEEE; 
USE           IEEE.STD_LOGIC_1164.ALL;
use           ieee.std_logic_unsigned.all;
use           IEEE.NUMERIC_STD.all;

entity avalon_anemo is 
port (
clk, chipselect, write_n, reset_n : in std_logic;
writedata : in std_logic_vector (31 downto 0);
readdata : out std_logic_vector (31 downto 0);
address: std_logic_vector (1 downto 0);
--entrees 
in_freq_anemometre  : in std_logic -- freq du vent
);

end avalon_anemo;

architecture behv of avalon_anemo is 
signal valeur_present   : std_logic_vector (25 downto 0):=(others => '0');
signal valeur_precedent : std_logic_vector (25 downto 0):=(others => '0');
signal valeur_calcule : std_logic_vector (25 downto 0):=(others => '0');
signal debut_periode: std_logic;
signal clk_1Hz : std_logic;
signal count_1Hz   : std_logic_vector (25 downto 0):=(others => '0');
signal buff		:   std_logic_vector (7 downto 0);
signal centaine, dizaine, unite : std_logic_vector (7 downto 0):=(others => '0');
signal AffCentaine, AffDizaine, AffUnite : std_logic_vector (6 downto 0):=(others => '0');

signal continu				: std_logic;	-- mode de fonctionnement
signal start_stop			: std_logic; -- start/stop
signal raz_n           	: std_logic;	-- reset
signal data_valid			: std_logic; -- validation donnee
signal data_anemometre		: std_logic_vector (7 downto 0); -- valeur anemo

BEGIN
-- process pour comptage avec horloge de 50M
compteur: process (clk)
begin
	if rising_edge(clk) then
	    if(valeur_present = X"2FAF080") then 
	         valeur_present <= (others => '0'); --"00000000000000000000000000";
				
	    else
		 if(debut_periode='1') then
		valeur_present <= valeur_present + X"1";
		end if;
	end if;
	end if;
end process;

div_clk: process (clk)
begin
	if rising_edge(clk) then
	    if(count_1Hz = X"2FAF080") then 
	         count_1Hz <= (others => '0');
				clk_1Hz<=not(clk_1Hz);
				buff<=std_logic_vector(to_unsigned( to_integer( 50000000 / unsigned (valeur_calcule)) ,8 ) );
	    else
		count_1Hz <= count_1Hz + X"1";
	end if;
	end if;
	if((buff>=X"00") or( buff<=X"FA")) then
    data_valid<='1';
else
data_valid<='0';
end if;

end process;


mesure_periode: process (in_freq_anemometre)
begin 
	if rising_edge(in_freq_anemometre) then
	debut_periode<='1';
		if (valeur_precedent < valeur_present) then
		valeur_calcule <= valeur_present - valeur_precedent;
		elsif (valeur_precedent > valeur_present ) then
        valeur_calcule <= valeur_precedent - valeur_present;
        end if;
        valeur_precedent <= valeur_present;
     end if;
end process;
 data_anemometre <= buff;

centaine <= std_logic_vector(to_unsigned(to_integer( unsigned(buff) / 100), 8));
dizaine  <= std_logic_vector(to_unsigned(to_integer( unsigned ( buff) /10  mod 10), 8));
unite    <= std_logic_vector(to_unsigned(to_integer(unsigned ( buff) mod 10 ), 8)) ;

AffCentaine <=  "0000001" when centaine =X"00"   else
                "1001111" when centaine =X"01"   else
                "0010010" when centaine =X"02"   else
                "0000110" when centaine =X"03"   else
                "1001100" when centaine =X"04"   else
                "0100100" when centaine =X"05"   else
                "0100000" when centaine =X"06"   else
                "0001111" when centaine =X"07"   else
                "0000000" when centaine =X"08"   else
                "0000100" when centaine =X"09"   else
                "1111111";
                
AffDizaine <=    "0000001" when dizaine =X"00"   else
                "1001111" when dizaine =X"01"   else
                "0010010" when dizaine =X"02"   else
                "0000110" when dizaine =X"03"   else
                "1001100" when dizaine =X"04"   else
                "0100100" when dizaine =X"05"   else
                "0100000" when dizaine =X"06"   else
                "0001111" when dizaine =X"07"   else
                "0000000" when dizaine =X"08"   else
                "0000100" when dizaine =X"09"   else
                "1111111";
                
AffUnite <=     "0000001" when unite =X"00"   else
                "1001111" when unite =X"01"   else
                "0010010" when unite =X"02"   else
                "0000110" when unite =X"03"   else
                "1001100" when unite =X"04"   else
                "0100100" when unite =X"05"   else
                "0100000" when unite =X"06"   else
                "0001111" when unite =X"07"   else
                "0000000" when unite =X"08"   else
                "0000100" when unite =X"09"   else
                "1111111";
               


--interface avalon
--ï¿½criture registres
--process_write: process (clk, reset_n)
--begin
--if reset_n = '0' then
--control <= (others => '0');
--elsif clk'event and clk = '1' then
--if chipselect ='1' and write_n = '0' then
--if address = "00" then
--freq  <= writedata;
--end if;
--if address = "01" then
--duty  <= writedata;
--end if;
--if address = "10" then
--control  <= writedata (1 downto 0);
--end if;
--end if;
--end if;
--end process;


--lecture registres
process_Read:PROCESS(address, data_anemometre)
 BEGIN
 case address is
 when "00" => readdata(9 downto 0) <=data_valid & '0' & data_anemometre ;
			  readdata(31 downto 10) <= (others => '0');
 when others => readdata <= (others => '0');
 end case;
 END PROCESS process_Read ;
 
 
 END behv;



