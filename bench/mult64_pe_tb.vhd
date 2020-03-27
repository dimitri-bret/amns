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
end entity mult64_pe;

architecture mult64_pe_tb_arch of mult64_pe is

component mult64_pe is 
			port (bit64_a_i: in bit64;
				  bit64_b_i: in bit64;
				  bit129_o: out bit129);
end component;

signal bit64_a_i_s: bit64 := 65D"36026640407847848";
signal bit64_b_i_s: bit64 := "11111111110001011000010111100111101111101010011010100011000110010"; --  -32919586486794702 in two's complement
signal bit129_o_s: bit129;  -- result is:  36026640407847848*(-32919586486794702) = -1185982104734799988550379628501296 = 0x3FFFFC586CD2420E7F09D0B217BCE66D0 in two's complement

begin
MULT64_PE_MAP: mult64_pe port map(bit64_a_i => bit64_a_i_s,
							      bit64_b_i => bit64_b_i_s, 
								  bit129_o => bit129_o_s);
								 
																


end mult64_pe_tb_arch;



	
