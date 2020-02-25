-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Add function used for the processing element
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity add_pe is
	port (
		bit129_i: in bit129;
		bit132_i: in bit132;
        bit132_o: out bit132
	   );
end entity add_pe;


architecture add_pe_arch of add_pe is

	signal bit129_internal_s: bit129;
	signal bit132_internal_s : bit132;

	begin
		bit129_internal_s <= std_logic_vector(unsigned(bit129_i) + unsigned(bit129_i));	
		bit132_internal_s <=   STD_LOGIC_VECTOR(RESIZE(UNSIGNED(bit129_internal_s), 132));-- pading with zeros the uper bits

		bit132_o <= bit132_internal_s;
end architecture add_pe_arch;
