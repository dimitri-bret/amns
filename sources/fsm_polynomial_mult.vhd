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
          with_mod_phi_i: in std_logic;
              finished_o: out std_logic;
               enable0_o: out std_logic_vector(0 to degree -1);
               enable1_o: out std_logic;
         enable_output_o: out std_logic;
    polynomial_b_coeff_o: out bit64);
end entity fsm_polynomial_mult;


architecture fsm_polynomial_mult_arch of fsm_polynomial_mult is

    component lambda_lookup is
        port ( count_i: in integer;
                 clk_i: in std_logic;
              resetb_i: in std_logic;
              enable_i: in std_logic;
              enable_o: out std_logic_vector(0 to degree-1)); --n = 7.
    end component lambda_lookup;

    signal polynomial_b_coeff_s: bit64 := 65D"0";

    signal first: integer := 0;

    begin

      enable_output_o <= '1' when enable_i = '0' else '0' when count_i <degree_plus_one else '1';  -- signal for freezing registers and saving result
      enable1_o <= with_mod_phi_i when count_i = degree else '0';
      finished_o <= '1' when count_i > degree else '0';

      P0: process(clk_i)
      begin
        if(falling_edge(clk_i) and count_i > 0) then
          polynomial_b_coeff_s <= 65D"0" when (count_i> degree_minus_one) else polynomial_b_i(count_i);
        else if (rising_edge(clk_i) and count_i = 0) then
          polynomial_b_coeff_s <= polynomial_b_i(0);
        end if;
      end if;
      end process;

    LAMBDA_LOOKUP_MAP: lambda_lookup port map(count_i,
                                              clk_i,
                                              resetb_i,
                                              enable_i,
                                              enable0_o);

    polynomial_b_coeff_o <= polynomial_b_coeff_s;
end fsm_polynomial_mult_arch;
