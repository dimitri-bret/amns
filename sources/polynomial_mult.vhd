-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Polynomial multiplication for the AMNS multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity polynomial_mut is
	port (
     polynomial_a_i: in polynomial;
     polynomial_b_i: in polynomial;
    clk_i: in std_logic;
   resetb_i:in std_logic;
   enable_i: in std_logic;
result_o: in polynomial
);
end entity polynomial_mut;


architecture polynomial_mutlt_arch of polynomial_mut is

    component combined is
        port (
            a_i: in bit64;
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

  signal tempo_result_s: internal_polynomial_mult;


begin
    COMBINED_GEN: for I in 0 to 5 generate
                  COMBINED_MAP : combined port map (polynomial_a_i(I),        -- a_i
                                                    polynomial_b_i(I),        -- b_i
                                                    lambda,                   -- lambda_i
                                                    tempo_result_s(I+1),      -- s_i
                                                    '0',                        -- en0_i
                                                    '0',                        -- en1_i
                                                    resetb_i,                  -- reset_i
                                                    clk_i,                    -- clk_i
                                                    enable_i,                 -- enable_i
                                                    tempo_result_s(I));       -- s_0
                                                   
					end generate;

    COMBINED_6_MAP: combined port map(polynomial_a_i(6),
                                      polynomial_b_i(6),
                                      lambda,
                                      tempo_result_s(0),
                                      '0',
                                      '0',
                                      resetb_i,
                                      clk_i,
                                      enable_i, 
                                      tempo_result_s(6));

end architecture polynomial_mutlt_arch;


