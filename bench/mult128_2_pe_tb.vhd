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
                    port (
                    bit128_i: in bit128;
                    bit2_i: in bit2;
                    bit130_o: out bit130
                    );
end component;

signal bit128_i_s: bit128 :="10101011001010110010101100101011101010110010101100101011001010111010101100101011001010110010101110101011001010110010101100101011";
signal bit2_i_s: bit2 :="10";
signal bit130_o_s: bit130;

begin
MULT128_2_PE_MAP: mult128_2_pe port map ( bit128_i => bit128_i_s,
							              bit2_i => bit2_i_s, 
							              bit130_o => bit130_o_s);

end mult128_2_pe_tb_arch;



	
