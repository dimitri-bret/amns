-- @author Dimitri Bret
-- @author Clement Dargein
-- @description General Processing Element used for modular multiplication
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
      ab_amns_o: out input_polynomial);
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
           A_i: in input_polynomial;
           B_i: in input_polynomial;
           R_o: out polynomial);
end component;


signal v_s: input_polynomial;
signal finished_v_s: std_logic;

signal v0_s: input_polynomial;
signal finished_v0_s: std_logic;

signal q2_s: input_polynomial;
signal finished_q2_s: std_logic;

signal qm_s: input_polynomial;
signal finished_qm_s: input_polynomial;

signal r_s: input_polynomial;
signal result_s: input_polynomial;


begin
      -- calculate V= A*B
    POLYNOMIAL_MULT_MAP_1: polynomial_mult port map(b_i, -- polynomial_a_i
                                                    a_i, -- polynomial_b_i
                                                    clk_i,          -- clk_i
                                                    resetb_i,       -- resetb_i
                                                    '1',            -- enable_i
                                                    '0',            -- with_mod_phi_i
                                                    finished_v_s,   -- finished_o
                                                    v_s);           -- result_o
   -- calculate V0 = A*B[phi]
    POLYNOMIAL_MULT_MAP_2: polynomial_mult port map(b_i,             -- polynomial_a_i
                                                    a_i,             -- polynomial_b_i
                                                    clk_i,           -- clk_i
                                                    resetb_i,        -- resetb_i
                                                    '1',             -- enable_i
                                                    '1',             -- with_mod_phi
                                                    finished_v0_s,   -- finished_o
                                                    q2_s);           --result_o
                                                    

      -- calculate  Q2 = V0*mp[phi]
      POLYNOMIAL_MULT_MAP_3: polynomial_mult port map(mp,           -- polynomial_a_i
                                                      q2_s,         -- polynomial_b_i
                                                      clk_i,        --clk_i
                                                      resetb_i,     -- resetb_i
                                                      finished_v0_s, -- enable_i
                                                      '1',           -- with_mod_phi
                                                      finished_v_0_s,-- finished_o
                                                      v_0_s);        -- result_o

-- calculate  QM = Q2*m
      POLYNOMIAL_MULT_MAP_4: polynomial_mult port map(m,            -- polynomial_a_i
                                                      q2_s,         -- polynomial_b_i
                                                      clk_i,        -- clk_i
                                                      resetb_i,     -- resetb_i
                                                      '1',          -- enable_i
                                                      '0',          -- with_mod_phi
                                                      finished_qm_s,-- finished_o
                                                      qm_s);        --result_o

      -- calculate R = V + QM
      POLYNOMIAL_ADD: polynomial_add port map(enable_i => finished_qm_s,
                                                   A_i => v_s,
                                                   B_i => qm_s,
                                                   R_o => r_s);
      -- calculate S = R/phi
      DIV_PHI_MAP:  div_phi port map(A_i => r_s,
                                     enable_i => finished_qm_s,
                                     S_o => ab_amns_o);

      ab_amns_o <= ab_amns_o;
                                                   
end architecture amns_mult_arch;
