--@Author Dimitri Bret
--@date 10/11/2018
--@description compteur test bench function for the AES algorithm 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AESLibrary;
use AESLibrary.state_definition_package.all;
library source;
use source.all;

entity compteur_tb is
end entity  compteur_tb;

architecture compteur_tb_arch of compteur_tb is

component compteur is 
		port (reset_i: in std_logic;
		  	  enable_i: in std_logic;
		  	  clock_i: in std_logic;
		  	  count_o: out bit4);
end component;

signal enable_s: std_logic;
signal reset_s: std_logic := '0';
signal clock_s: std_logic := '1';
signal count_o_s: bit4;

begin

COMPTEUR_MAP: compteur port map (reset_i => reset_s,
							enable_i => enable_s,
							clock_i=> clock_s,
							count_o=> count_o_s);

clock_s <= not clock_s after 50 ns;

clk_process :process
   begin
		enable_s<='1','0' after 100 ns;
		reset_s<= '1' after 1500 ns;

	wait;
   end process;
	
end compteur_tb_arch;



	
