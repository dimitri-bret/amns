-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Polynomial multiplication for the AMNS multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity polynomial_mult is
	port ( polynomial_a_i: in input_polynomial;
         polynomial_b_i: in input_polynomial;
                  clk_i: in std_logic;
               resetb_i: in std_logic;
               enable_i: in std_logic;
         with_mod_phi_i: in std_logic;
             finished_o: out std_logic;
               result_o: out polynomial);
end entity polynomial_mult;


architecture polynomial_mult_arch of polynomial_mult is

    component combined is
        port (a_i: in bit64;
              b_i: in bit64;
         lambda_i: in bit2;
              s_i: in bit132;
            en0_i: in std_logic;
            en1_i: in std_logic;
         resetb_i: in std_logic;
            clk_i: in std_logic;
         enable_i: in std_logic;
              s_o: out bit132);
    end component;


  component fsm_polynomial_mult is
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
  end component;

  component counter is
	  port (clock_i : in std_logic;
		     resetb_i : in std_logic;
		     enable_i : in std_logic;
			   count_o : out integer);
  end component;

  signal tempo_result_s: polynomial;
  signal count_s: integer := 0;

  signal enable_mod_phi_s: std_logic;
  signal enable0_table_s: std_logic_vector(0 to degree -1);
  signal enable_register_s: std_logic; -- if enable_register_s is set at the end, all register are 'frozen', ie won't update on clock tick
  signal polynomial_b_coeff_s: bit64;


begin

   COUNTER_MAP: counter port map(clk_i,    -- clk_i
			                           resetb_i, -- resetb_i
			                           enable_i, -- enable_i
			                           count_s); -- count_o


   FSM_POLYNOMIAL_MULT_MAP: fsm_polynomial_mult port map(polynomial_b_i,
                                                         clk_i,               -- clk_i
                                                         count_s,             -- count_s
                                                         resetb_i,            -- resetb_i
                                                         enable_i,            -- enable_i
																												 with_mod_phi_i,
																												 finished_o,
                                                         enable0_table_s,     --enable_o
																												 enable_mod_phi_s,
																												 enable_register_s,
                                                         polynomial_b_coeff_s);-- s_o


    COMBINED_GEN: for I in 0 to degree_minus_two generate
                  COMBINED_MAP : combined port map (polynomial_a_i(I),        -- a_i
                                                    polynomial_b_coeff_s,     -- b_i
                                                    lambda,                   -- lambda_i
                                                    tempo_result_s(I+1),      -- s_i
                                                    enable0_table_s(I),       -- en0_i
                                                    enable_mod_phi_s,         -- en1_i
                                                    resetb_i,                 -- reset_i
                                                    clk_i,                    -- clk_i
                                                    enable_register_s,        -- enable_i
                                                    tempo_result_s(I));       -- s_0
					end generate;

    COMBINED_LAST_MAP: combined port map(polynomial_a_i(degree_minus_one),    -- a_i
                                         polynomial_b_coeff_s,                -- b_i
                                         lambda,                              -- lambda_i
                                         tempo_result_s(0),                   -- s_i
                                         enable0_table_s(degree_minus_one),   -- en0_i
                                         enable_mod_phi_s,                    -- en1_i
                                         resetb_i,                            -- reset_i
                                         clk_i,                               -- clk_i
                                         enable_register_s,                   -- enable_i
                                         tempo_result_s(degree_minus_one));   -- s_0

      result_o <= tempo_result_s;

end architecture polynomial_mult_arch;
