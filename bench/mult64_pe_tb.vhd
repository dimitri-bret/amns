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

-- signal bit64_a_i_s: bit64 :="1010101100101011001010110010101110101011001010110010101100101011";
-- signal bit64_b_i_s: bit64 :="1010101100101011001010110010101000001011001010110010101100101011";



signal bit64_a_i_s: bit64 := "0000000001111111111111100000100111011111111101011110001110101000";
signal bit64_b_i_s: bit64 := "0000000001110100111101000011000010000010101100101011100111001110";
signal bit64_a_i_s_2: bit64 := 64D"36026640407847848";
signal bit64_b_i_s_2: bit64 := 64D"32919586486794702";

signal bit128_o_s: bit128;
signal bit128_o_s_2: bit128;


begin
MULT64_PE_MAP: mult64_pe port map ( bit64_a_i => bit64_a_i_s,
							     bit64_b_i => bit64_b_i_s, 
								 bit128_o => bit128_o_s);
								 
								 
								 
MULT64_PE2_MAP: mult64_pe port map ( bit64_a_i => bit64_a_i_s_2,
						  		    bit64_b_i => bit64_b_i_s_2, 
							     	bit128_o => bit128_o_s_2);


end mult64_pe_tb_arch;



	
