-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Internal multiplexer for the processing element
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity multiplexer_pe is
	port (bit132_i: in bit132;
          bit129_i: in bit129;
              en_i: in std_logic;
          bit132_o: out bit132);
end entity multiplexer_pe;


architecture multiplexer_pe_arch of multiplexer_pe is

    begin
        -- en_i = 1, bit130: the result multiplied by the lambda is selected
        bit132_o <= bit132_i when en_i = '1' else STD_LOGIC_VECTOR(RESIZE(signed(bit129_i),133));

end architecture multiplexer_pe_arch;
