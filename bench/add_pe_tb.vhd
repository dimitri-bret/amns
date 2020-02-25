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
			port (
				bit129_i: in bit129;
				bit132_i: in bit132;
       		    bit132_o: out bit132
   			);
end component;

signal bit129_i_s: bit129 :="101010110010101100101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101100101011001010110";

signal bit132_i_s: bit132 :="101001010110010101100101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101100101011001010110";
signal bit132_o_s: bit132;

begin

ADD_PE_MAP: add_pe port map ( bit129_i => bit129_i_s,
							  bit132_i => bit132_i_s, 
							  bit132_o => bit132_o_s);

end add_pe_tb_arch;



	
