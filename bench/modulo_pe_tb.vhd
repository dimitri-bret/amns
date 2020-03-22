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

entity modulo_pe_tb is
end entity  modulo_pe_tb;

architecture modulo_pe_tb_arch of modulo_pe_tb is

component modulo_pe is 
			port (bit132_i: in bit132;
                      en_i: in std_logic;
                  bit132_o: out bit132);
end component;

signal bit132_i_s: bit132 := 133D"7035055149350123000002897335973297149526";
signal en_i_s: std_logic := '1';
signal bit132_o_s: bit132;

begin
en_i_s <= '0' after 50 ns;
MODULO_PE_MAP: modulo_pe port map (bit132_i_s,
                                   en_i_s,
							       bit132_o_s);
end modulo_pe_tb_arch;



	
