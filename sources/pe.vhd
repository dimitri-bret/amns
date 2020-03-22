-- @author Dimitri Bret
-- @author Clement Dargein
-- @description General Processing Element used for modular multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity pe is
	port ( a_i: in bit64;
           b_i: in bit64;
      lambda_i: in bit2;
           s_i: in bit132;
         en0_i: in std_logic;
         en1_i: in std_logic;
           p_o: out bit132);
end entity pe;


architecture pe_arch of pe is

    signal ai_bi_s: bit129;
    signal lambda_ai_bi_s: bit132;

    signal added_to_s_i_s: bit132;  -- lambda*a_i*b_i or a_i*b_i
    signal addition_result_s: bit132;

    begin
        MULT64_PE: entity work.mult64_pe(mult64_pe_arch) port map(bit64_a_i => a_i,
                                                                  bit64_b_i => b_i,
                                                                  bit129_o => ai_bi_s);

        MULT128_2_PE: entity work.mult128_2_pe(mult128_2_pe_arch) port map(bit129_i => ai_bi_s,
                                                                           bit2_i   => lambda_i,
                                                                           bit132_o => lambda_ai_bi_s);

        MULTIPLEXER_PE: entity work.multiplexer_pe(multiplexer_pe_arch) port map(bit132_i => lambda_ai_bi_s,
                                                                                 bit129_i => ai_bi_s,
                                                                                     en_i => en0_i,
                                                                                 bit132_o => added_to_s_i_s);

        ADD_PE_MAP:entity work.add_pe(add_pe_arch) port map(bit132_a_i => added_to_s_i_s,
                                                            bit132_b_i => s_i,
                                                            bit132_o => addition_result_s);     --   result = s_i + ai_bi or result = s_i + ai_bi*lambda

        MODULO_PE_MAP:entity work.modulo_pe(modulo_pe_arch) port map( bit132_i => addition_result_s,  -- p_o = result MOD(2^64)
                                                                          en_i => en1_i,
                                                                      bit132_o => p_o);
end architecture pe_arch;
