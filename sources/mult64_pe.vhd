-- @author Dimitri Bret
-- @author Clement Dargein
-- @description 64 bit multiplication used by the processing element
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity mult64_pe is
	port (bit64_a_i: in bit64;
		  bit64_b_i: in bit64;
          bit129_o: out bit129);
end entity mult64_pe;


architecture mult64_pe_arch of mult64_pe is


	begin
		bit129_o <= std_logic_vector(signed(bit64_a_i) * signed(bit64_b_i));	

end architecture mult64_pe_arch;
