-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description 128 * 2 bit factor multiplier  test bench for the polynomial multiplication 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;
library source;
use source.all;

entity mult128_2_pe is
end entity  mult128_2_pe;

architecture mult128_2_pe_tb_arch of mult128_2_pe is

component mult128_2_pe is 
    port (bit129_i: in bit129;
            bit2_i: in bit2;
          bit132_o: out bit132);
end component;

signal bit129_i_s: bit129 :="1010101100101101100101011001010111101010110010101100101011001010111010101100101011001010110010101110101011001010110010101100101011";
signal bit2_i_s: bit2 :="010";
signal bit132_o_s: bit132;

begin

MULT128_2_PE_MAP: mult128_2_pe port map (bit129_i_s,
                                         bit2_i_s, 
							             bit132_o_s);
end mult128_2_pe_tb_arch;