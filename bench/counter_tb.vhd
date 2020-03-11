-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description compteur test bench function for the AES algorithm

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;
library source;
use source.all;

entity counter_tb is
end entity counter_tb;


architecture counter_tb_arch of counter_tb is
component counter
	port (	clock_i : in std_logic;
			resetb_i : in std_logic;
			enable_i : in std_logic;
			count_o : out integer);
end component;

signal clock_s : std_logic := '0';
signal resetb_s, enable_s : std_logic := '0';
signal count_s : integer;

begin
	DUT : counter
	port map (	clock_i => clock_s,
				resetb_i => resetb_s,
				enable_i => enable_s,
				count_o => count_s);

clock_s <= not(clock_s) after 50 ns;

resetb_s <= '1' after 900 ns;

enable_s <= '1' after 200 ns;

end architecture counter_tb_arch;
