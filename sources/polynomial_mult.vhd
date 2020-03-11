-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Polynomial multiplication for the AMNS multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity polynomial_mult is
	port (polynomial_a_i: in input_polynomial;
         polynomial_b_i: in input_polynomial;
         clk_i: in std_logic;
         resetb_i: in std_logic;
         enable_i: in std_logic;
         result_o: out polynomial;
         enable0_table_debug: out std_logic_vector(0 to degree -1) 
         );
end entity polynomial_mult;


architecture polynomial_mult_arch of polynomial_mult is

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

    component lambda_lookup is
      port (count_i: in Integer;
              clk_i: in std_logic;
           resetb_i: in std_logic;
           enable_i: in std_logic;
           enable_o: out std_logic_vector(0 to degree-1)); -- n = 7.
  end component;

  component counter is
	port (
			clock_i : in std_logic;
			resetb_i : in std_logic;
			enable_i : in std_logic;
			count_o : out integer);
end component;

  signal tempo_result_s: polynomial;
  signal count_s: integer;
  signal enable0_table_s: std_logic_vector(0 to degree -1);
  signal enable_register_s: std_logic; -- if enable_register_s is set at the end, all register are 'frozen', ie won't update on clock tick
  
begin
   enable_register_s <= '0' when count_s <7 else '1';
   COUNTER_MAP: counter port map(clk_i,    -- clk_i
			                        resetb_i, -- resetb_i
			                        enable_i, -- enable_i
			                        count_s); -- count_o

   LAMBDA_LOOKUP_MAP:  lambda_lookup port map(count_s,         -- count_i
                                                clk_i,         -- clk_i
                                             resetb_i,         -- resetb_i
                                             enable_i,         -- enable_i
                                             enable0_table_s); -- enable_o


    COMBINED_GEN: for I in 0 to 5 generate
                  COMBINED_MAP : combined port map (polynomial_a_i(I),        -- a_i
                                                    polynomial_b_i(I),        -- b_i
                                                    lambda,                   -- lambda_i
                                                    tempo_result_s(I+1),      -- s_i
                                                    enable0_table_s(I),       -- en0_i
                                                    '0',                      -- en1_i
                                                    resetb_i,                 -- reset_i
                                                    clk_i,                    -- clk_i
                                                    enable_register_s,        -- enable_i
                                                    tempo_result_s(I));       -- s_0                             
					end generate;

    COMBINED_6_MAP: combined port map(polynomial_a_i(6),
                                      polynomial_b_i(6),
                                      lambda,
                                      tempo_result_s(0),
                                      enable0_table_s(6),
                                      '0',
                                      resetb_i,
                                      clk_i,
                                      enable_register_s, 
                                      tempo_result_s(6));

      result_o <= tempo_result_s;

      enable0_table_debug <= enable0_table_s;
end architecture polynomial_mult_arch;


