-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Control the b_i operand given in the Processing Element according to the count_i
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity fsm_polynomial_mult is
    port (count_i: in integer,
          s_i: in polynomial,
          s_o: out polynomial
    );
end entity fsm_polynomial_mult;


architecture fsm_polynomial_mult_arch of fsm_polynomial_mult is

begin
    GEN  for I in 0 to degree -1 generate:
        s_o(I) <= s_o(count_i);

end polynomial_mult_arch