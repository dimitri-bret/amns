-- @author Dimitri Bret
-- @author Clement Dargein
-- @description 128 bits by two bits multiplication used for the processing element
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity mult128_2_pe is
	port (bit129_i: in bit129;
		    bit2_i: in bit2;
          bit132_o: out bit132);
end entity mult128_2_pe;


architecture mult128_2_pe_arch of mult128_2_pe is

	begin
		bit132_o <= std_logic_vector(signed(bit129_i) * signed(bit2_i));

end architecture mult128_2_pe_arch;
