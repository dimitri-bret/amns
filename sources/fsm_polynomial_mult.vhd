-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Control the b_i operand given in the Processing Element according to the count_i
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity fsm_polynomial_mult is
    port (polynomial_b_i: in input_polynomial;
                  clk_i: in std_logic;
                count_i: in integer;
               resetb_i: in std_logic;
               enable_i: in std_logic;
               enable_o: out std_logic_vector(0 to degree -1);
         polynomial_b_coeff_o: out bit64);
end entity fsm_polynomial_mult;


architecture fsm_polynomial_mult_arch of fsm_polynomial_mult is

    component lambda_lookup is
        port ( count_i: in integer;
                 clk_i: in std_logic;
              resetb_i: in std_logic; 
              enable_i: in std_logic;
              enable_o: out std_logic_vector(0 to degree-1) -- n = 7.
            );
    end component lambda_lookup;

    

    begin
    polynomial_b_coeff_o <=  64D"0" when (count_i < 0 or count_i> degree_minus_one) else polynomial_b_i(count_i);
    
    LAMBDA_LOOKUP_MAP: lambda_lookup port map(count_i,
                                              clk_i,
                                              resetb_i,
                                              enable_i,
                                              enable_o);
end fsm_polynomial_mult_arch;