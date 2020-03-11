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

entity polynomial_mut_tb is
end entity  polynomial_mut_tb;

architecture polynomial_mut_tb_arch of polynomial_mut_tb is

    component polynomial_mut is
        port ( polynomial_a_i: in polynomial;
               polynomial_b_i: in polynomial;
                        clk_i: in std_logic;
                     resetb_i: in std_logic;
                     enable_i: in std_logic;
                     result_o: in polynomial);
    end component;

signal polynomial_a_i_s: polynomial;
signal polynomial_b_i_s: polynomial;
signal clk_i_s: std_logic;
signal resetb_i_s: std_logic;
signal enable_i_s: std_logic;
signal result_o_s: polynomial;

begin
    clk_i_s <= '0' after 0 ns, not clk_i_s after 50 ns;

MULTIPLEXER_PE_MAP:  polynomial_mut port map (polynomial_a_i_s,
                                              polynomial_b_i_s,
                                              clk_i_s,
                                              resetb_i_s,
                                              clk_i_s,
                                              result_o_s);
end polynomial_mut_tb_arch;



	
