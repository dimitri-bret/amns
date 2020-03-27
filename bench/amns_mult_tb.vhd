-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description AMNS multiplication testbench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;
library source;
use source.all;

entity amns_mult_tb is
end entity  amns_mult_tb;

architecture amns_mult_tb_arch of amns_mult_tb is

    component amns_mult is port (a_i: in input_polynomial;
                                 b_i: in input_polynomial;
                                 clk_i: in std_logic;
                                 resetb_i: in std_logic;
                                 finished_o: out std_logic;
                                 ab_amns_o: out input_polynomial;
 
                                 v0_converted_debug: out input_polynomial;
                                 finished_v0_debug: out std_logic;
                                 q2_converted_debug: out input_polynomial;
                                 finished_q2_debug:out std_logic;
                                 qm_debug: out polynomial;
                                 finished_qm_debug: out std_logic;
                                 r_debug: out polynomial);
    end component;

signal polynomial_a_s: input_polynomial:= A_POLYNOMIAL;
signal polynomial_b_s: input_polynomial:= B_POLYNOMIAL;
signal clk_i_s: std_logic := '0';
signal resetb_i_s: std_logic := '0';
signal finished_s: std_logic;
signal ab_amns_s: input_polynomial;
signal v0_converted_debug_s: input_polynomial;
signal finished_v0_debug_s: std_logic;
signal q2_converted_debug_s: input_polynomial;
signal finished_q2_debug_s:std_logic;
signal qm_debug_s: polynomial;
signal finished_qm_debug_s: std_logic;
signal r_debug_s: polynomial;

begin
clk_i_s <= not clk_i_s after 20 ns;

POLYNOMIAL_PE_MAP: amns_mult port map (a_i => polynomial_a_s,
                                       b_i => polynomial_b_s,
                                       clk_i => clk_i_s,
                                       resetb_i => resetb_i_s,
                                       finished_o => finished_s,
                                       ab_amns_o => ab_amns_s,
                                       v0_converted_debug => v0_converted_debug_s,
                                       finished_v0_debug => finished_v0_debug_s,
                                       q2_converted_debug => q2_converted_debug_s,
                                       finished_q2_debug => finished_q2_debug_s,
                                       qm_debug => qm_debug_s,
                                       finished_qm_debug => finished_qm_debug_s,
                                       r_debug => r_debug_s);
                    
end amns_mult_tb_arch;



	
