-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description 64 bit factor multiplier  test bench for the polynomial multiplication 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;
library source;
use source.all;

entity mult64_pe is
end entity  mult64_pe;

architecture mult64_pe_tb_arch of mult64_pe is

component mult64_pe is 
			port (
				bit64_a_i: in bit64;
				bit64_b_i: in bit64;
       		    bit128_o: out bit128
   			);
end component;

signal bit64_a_i_s: bit64 :="1010101100101011001010110010101110101011001010110010101100101011";
signal bit64_b_i_s: bit64 :="1010101100101011001010110010101000001011001010110010101100101011";
signal bit128_o_s: bit128;

begin
MULT64_PE_MAP: mult64_pe port map ( bit64_a_i => bit64_a_i_s,
							     bit64_b_i => bit64_b_i_s, 
							     bit128_o => bit128_o_s);

end mult64_pe_tb_arch;



	
