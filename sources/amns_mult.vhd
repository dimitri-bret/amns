-- @author Dimitri Bret
-- @author Clement Dargein
-- @description AMNS Multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity amns_mult is
	port (a_i: in input_polynomial;
            b_i: in input_polynomial;
          clk_i: in std_logic;
       resetb_i: in std_logic;
     finished_o: out std_logic;
      ab_amns_o: out input_polynomial;
      
      -- ports for degub
      v0_converted_debug: out input_polynomial;
      finished_v0_debug: out std_logic;
      q2_converted_debug: out input_polynomial;
      finished_q2_debug:out std_logic;
      qm_debug: out polynomial;
      finished_qm_debug: out std_logic;
      r_debug: out polynomial);
end entity amns_mult;


architecture amns_mult_arch of amns_mult is

component polynomial_mult
port (polynomial_a_i: in input_polynomial;
      polynomial_b_i: in input_polynomial;
               clk_i: in std_logic;
            resetb_i: in std_logic;
            enable_i: in std_logic;
      with_mod_phi_i: in std_logic;
          finished_o: out std_logic;
            result_o: out polynomial);
end component;

component polynomial_add
port (enable_i: in std_logic;
           A_i: in polynomial;
           B_i: in polynomial;
           R_o: out polynomial);
end component;

component conv_polynomial is
      port (a_i: in polynomial;
  converted_a_o: out input_polynomial);
end component;

component div_phi is
      port (enable_i: in std_logic;
                 a_i: in polynomial;
                 s_o: out input_polynomial);
      end component;


signal v_s: polynomial;
signal finished_v_s: std_logic;

signal v0_s: polynomial;
signal v0_converted_s: input_polynomial;

signal finished_v0_s: std_logic;

signal q2_s: polynomial;
signal q2_converted_s: input_polynomial;
signal finished_q2_s: std_logic;

signal qm_s: polynomial;
signal finished_qm_s: std_logic;

signal r_s: polynomial;
signal result_s: polynomial;


begin
    -- compute V= A*B
    POLYNOMIAL_MULT_MAP_1: polynomial_mult port map(polynomial_a_i => b_i,
                                                    polynomial_b_i => a_i,
                                                    clk_i => clk_i,
                                                    resetb_i => resetb_i,
                                                    enable_i => '1',
                                                    with_mod_phi_i => '0',
                                                    finished_o => finished_v_s,
                                                    result_o => v_s);
    -- compute V0 = A*B[phi]
    POLYNOMIAL_MULT_MAP_2: polynomial_mult port map(polynomial_a_i => b_i,
                                                    polynomial_b_i => a_i,
                                                    clk_i => clk_i,
                                                    resetb_i => resetb_i,
                                                    enable_i => '1',
                                                    with_mod_phi_i => '1',
                                                    finished_o => finished_v0_s,
                                                    result_o => v0_s);
     CONV_POLYNOMIAL_MAP_1: conv_polynomial port map(v0_s, v0_converted_s);                                
                                                    
      -- compute  Q2 = V0*mp [phi]
      POLYNOMIAL_MULT_MAP_3: polynomial_mult port map(polynomial_a_i => M_P,           
                                                      polynomial_b_i => v0_converted_s,
                                                      clk_i => clk_i,
                                                      resetb_i => resetb_i,
                                                      enable_i => finished_v0_s,
                                                      with_mod_phi_i => '1',
                                                      finished_o => finished_q2_s,
                                                      result_o => q2_s);
      CONV_POLYNOMIAL_MAP_2: conv_polynomial port map(q2_s, q2_converted_s);                                               

      -- compute  QM = Q2*m
      POLYNOMIAL_MULT_MAP_4: polynomial_mult port map(polynomial_a_i => M,
                                                      polynomial_b_i => q2_converted_s,
                                                      clk_i => clk_i,
                                                      resetb_i => resetb_i,
                                                      enable_i => finished_q2_s,
                                                      with_mod_phi_i => '0',
                                                      finished_o => finished_qm_s,
                                                      result_o => qm_s);

      -- compute R = V + QM
      POLYNOMIAL_ADD_MAP: polynomial_add port map(enable_i => finished_qm_s,
                                                  A_i => v_s,
                                                  B_i => qm_s,
                                                  R_o => r_s);
      -- compute S = R/phi
      DIV_PHI_MAP:  div_phi port map(a_i => r_s,
                                     enable_i => finished_qm_s,
                                     s_o => ab_amns_o);

      finished_o <= finished_qm_s;

      -- debug
      v0_converted_debug <= v0_converted_s;
      finished_v0_debug <= finished_v0_s;
      q2_converted_debug <= q2_converted_s;
      finished_q2_debug <= finished_q2_s;
      qm_debug <= qm_s;
      finished_qm_debug <= finished_qm_s;
      r_debug <= r_s;
                                                   
end architecture amns_mult_arch;
