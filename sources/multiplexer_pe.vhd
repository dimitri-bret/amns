-- @author Dimitri Bret
-- @author Clement Dargein
-- @description internal multiplexer for the processing element
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity multiplexer_pe is
	port (
        bit130_i: in bit130;
        bit128_i: in bit128;
        en_i: in std_logic;
        bit130_o: out bit130
	   );
end entity multiplexer_pe;


architecture multiplexer_pe_arch of multiplexer_pe is

    begin
        -- en_i = 1, bit130: the result multiplied by the lambda is selected
        bit130_o <= bit130_i when en_i = '1' else STD_LOGIC_VECTOR(RESIZE(UNSIGNED(bit128_i),130));

end architecture multiplexer_pe_arch;
