--*********************************************************************
--           boutons poussoirs 
--********************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
ENTITY boutons IS
		PORT (
		clk : in std_logic;
		BP_Babord,BP_Tribord, BP_STBY  : in std_logic;  
		ledBabord, ledTribord,ledSTBY, out_bip : out std_logic
		);
END boutons;

ARCHITECTURE arch_boutons OF boutons IS
signal codeFonction: std_logic_vector (3 downto 0);
signal clk_50, clk_100, rst_n: std_logic;
begin

gestion_bp:process(clk_100) 
variable etat : integer range 0 to 2;
begin	
	if clk_100'event and clk_100='1' then
	etat:= 0;
	codeFonction <="0000";
	case etat is
	when 0 =>
		if BP_Babord='1' then 
		etat:=1; codeFonction <="0001";
		end if;
		if BP_Tribord='1' then 
		etat:=2; codeFonction <="0010";
		end if;
	when 1 =>
		if BP_Babord='1' then 
		etat:=0; codeFonction <="0000";
		end if;
      ledBabord <= clk_50; ledTribord <= clk_50;
	when 2 =>
		if BP_Tribord='1' then 
		etat:=0; codeFonction <="0000";
      ledBabord <= clk_50; ledTribord <= clk_50;
		end if;
end case;
end if;
end process gestion_bp;

--*********************************************************************	
-- génération 100Hz
--*********************************************************************
gene_100:	process(clk,rst_n)
	variable count : integer range 0 to 250000;	
	BEGIN
		if rst_n= '0' then
			count:=0; clk_100 <= '0';
		elsif clk'event and clk='1' then
			count:= count +1;
			if count =  249999 then
				clk_100 <= not clk_100;
				count:= 0;
			end if;
		end if;	
	end process gene_100;
--*********************************************************************

end architecture arch_boutons;