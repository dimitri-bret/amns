-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Add function used for the processing element
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity add_pe is
	port (bit132_a_i: in bit132;
		  bit132_b_i: in bit132;
            bit132_o: out bit132);
end entity add_pe;


architecture add_pe_arch of add_pe is

	begin
		bit132_o <= std_logic_vector(signed(bit132_a_i) + signed(bit132_b_i));	

end architecture add_pe_arch;
