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
        port ( polynomial_a_i: in input_polynomial;
               polynomial_b_i: in input_polynomial;
                        clk_i: in std_logic;
                     resetb_i: in std_logic;
                     enable_i: in std_logic;
                     result_o: out polynomial;
                     enable0_table_debug: out std_logic_vector(0 to degree -1));
    end component;

signal polynomial_a_i_s: input_polynomial:= A_POLYNOMIAL;
signal polynomial_b_i_s: input_polynomial:= B_POLYNOMIAL;
signal clk_i_s: std_logic :='0';
signal resetb_i_s: std_logic := '0';
signal enable_i_s: std_logic:='0';
signal result_o_s: polynomial;

signal enable0_table_debug_s: std_logic_vector(0 to degree -1);


begin
    clk_i_s <= not clk_i_s after 50 ns;
    enable_i_s <= '1' after 10 ns;

POLYNOMIAL_PE_MAP: polynomial_mult port map (polynomial_a_i_s,  -- a_i
                                             polynomial_b_i_s,  -- b_i
                                             clk_i_s,           --clk_i
                                             resetb_i_s,        --resetb_i
                                             enable_i_s,        --enable_i
                                             result_o_s,         --result_o
                                             enable0_table_debug_s);      
                        
end polynomial_mult_tb_arch;



	
