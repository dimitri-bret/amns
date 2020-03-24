-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Convert a  polynomial of bit132 to a poylynomial of bit64: warning, may loose information if any coefficient is greater than 2^64 - 1
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity conv_polynomial is
	    port (a_i: in polynomial;
    converted_a_o: out input_polynomial);
end entity conv_polynomial;


architecture conv_polynomial_arch of conv_polynomial is
    begin
        process(a_i)
        begin
            for I in 0 to degree_minus_one loop
                converted_a_o(I) <= a_i(I)(64 downto 0);
            end loop;
        end process;
end architecture conv_polynomial_arch;


