-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description multiplexer test bench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;
library source;
use source.all;

entity polynomial_mult_tb is
end entity  polynomial_mult_tb;

architecture polynomial_mult_tb_arch of polynomial_mult_tb is

    component polynomial_mult is
        port (polynomial_a_i: in input_polynomial;
              polynomial_b_i: in input_polynomial;
                       clk_i: in std_logic;
                    resetb_i: in std_logic;
                    enable_i: in std_logic;
              with_mod_phi_i: in std_logic;
                  finished_o: out std_logic;
                    result_o: out polynomial;
                    count_debug : out integer
                    );
    end component;

signal polynomial_a_i_s: input_polynomial:= A_POLYNOMIAL;
signal polynomial_b_i_s: input_polynomial:= B_POLYNOMIAL;

signal v0: input_polynomial := (65D"1233391555714376842", 65D"530847424906472060", 65D"6284500945172922178", 65D"5951544063551154808", 65D"2972375772545743636", 65D"12978380936195739677", 65D"9982721463654963238");

signal clk_i_s: std_logic :='0';
signal resetb_i_s: std_logic := '0';
signal enable_i_s: std_logic:='0';
signal finished_s: std_logic;
signal finished_s2: std_logic;

signal result_o_s: polynomial;
signal result_o2_s: polynomial;

signal count_debug: integer;


begin
    clk_i_s <= not clk_i_s after 50 ns;
    enable_i_s <= '1' after 50 ns;


POLYNOMIAL_PE_MAP: polynomial_mult port map (polynomial_a_i_s,  -- a_i
                                             polynomial_b_i_s,  -- b_i
                                             clk_i_s,           -- clk_i
                                             resetb_i_s,        -- resetb_i
                                             enable_i_s,        -- enable_i
                                             '1',               -- with_mod_phi_i
                                             finished_s,        
                                             result_o_s,
                                             count_debug);       -- result_o

POLYNOMIAL_PE_MAP_2: polynomial_mult port map (v0,  -- a_i
                                               M_P,  -- b_i
                                              clk_i_s,           -- clk_i
                                              resetb_i_s,        -- resetb_i
                                              enable_i_s,        -- enable_i
                                              '1',               -- with_mod_phi_i
                                              finished_s2,        
                                              result_o2_s);       -- result_o
                                                   
                        
end polynomial_mult_tb_arch;



	
