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

entity multiplexer_pe_tb is
end entity  multiplexer_pe_tb;

architecture multiplexer_pe_tb_arch of multiplexer_pe_tb is

component multiplexer_pe is 
        port (
             bit130_i: in bit130;
             bit128_i: in bit128;
             en_i: in std_logic;
             bit130_o: out bit130
   );
end component;

signal bit130_i_s: bit130 :="1010101100101011001010110010101110101011001010110010101100101011101010110010101100101011001010111010101100101011001010110010101110";
signal bit128_i_s: bit128 :="10101011001010110010101100101011101010110010101100101011001010111010101100101011001010110010101110101011001010110010101100101011";
signal bit130_o_s: bit130;
signal en_i_s: std_logic :='1';

begin
    en_i_s <= '0' after 50 ns;

MULT64_PE_MAP:  multiplexer_pe port map (bit130_i => bit130_i_s,
                                         bit128_i => bit128_i_s, 
                                             en_i => en_i_s,
					                     bit130_o => bit130_o_s);



end multiplexer_pe_tb_arch;



	
