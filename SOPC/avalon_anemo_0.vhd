-- avalon_anemo_0.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity avalon_anemo_0 is
	port (
		clk                : in  std_logic                     := '0';             --          clock.clk
		chipselect         : in  std_logic                     := '0';             -- avalon_slave_0.chipselect
		write_n            : in  std_logic                     := '0';             --               .write_n
		writedata          : in  std_logic_vector(31 downto 0) := (others => '0'); --               .writedata
		readdata           : out std_logic_vector(31 downto 0);                    --               .readdata
		address            : in  std_logic_vector(1 downto 0)  := (others => '0'); --               .address
		reset_n            : in  std_logic                     := '0';             --          reset.reset_n
		in_freq_anemometre : in  std_logic                     := '0'              --    conduit_end.export
	);
end entity avalon_anemo_0;

architecture rtl of avalon_anemo_0 is
	component avalon_anemo is
		port (
			clk                : in  std_logic                     := 'X';             -- clk
			chipselect         : in  std_logic                     := 'X';             -- chipselect
			write_n            : in  std_logic                     := 'X';             -- write_n
			writedata          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			readdata           : out std_logic_vector(31 downto 0);                    -- readdata
			address            : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			reset_n            : in  std_logic                     := 'X';             -- reset_n
			in_freq_anemometre : in  std_logic                     := 'X'              -- export
		);
	end component avalon_anemo;

begin

	avalon_anemo_0 : component avalon_anemo
		port map (
			clk                => clk,                --          clock.clk
			chipselect         => chipselect,         -- avalon_slave_0.chipselect
			write_n            => write_n,            --               .write_n
			writedata          => writedata,          --               .writedata
			readdata           => readdata,           --               .readdata
			address            => address,            --               .address
			reset_n            => reset_n,            --          reset.reset_n
			in_freq_anemometre => in_freq_anemometre  --    conduit_end.export
		);

end architecture rtl; -- of avalon_anemo_0
