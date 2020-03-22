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

entity add_pe_tb is
end entity  add_pe_tb;

architecture add_pe_tb_arch of add_pe_tb is

component add_pe is 
			port (bit132_a_i: in bit132;
				  bit132_b_i: in bit132;
				    bit132_o: out bit132);
end component;

signal bit132_a_i: bit132 :=133D"3187937022549630234851053751756909860438";
signal bit132_b_i: bit132 :="1010110100001111000000000101101101101010000101010110001000000110101111000100100111010011010000110100110101001101010011010100110101010";-- -3527937022549630234851053751756909860438 in two's complement
signal bit132_o_s: bit132; -- expected result: -340000000000000000000000000000000000000 = 0x 1f003661c39902972ddf90bec000000000 in two's component

begin

ADD_PE_MAP: add_pe port map (bit132_a_i,
							 bit132_b_i, 
							 bit132_o_s);

end add_pe_tb_arch;



	
