-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description conv_polynomial_tb

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;
library source;
use source.all;

entity conv_polynomial_tb is
end entity  conv_polynomial_tb;

architecture conv_polynomial_tb_arch of conv_polynomial_tb is

component conv_polynomial is
	    port (a_i: in polynomial;
    converted_a_o: out input_polynomial);
end component;

signal bit132_i_s: polynomial := (133D"99999999",133D"8888888",133D"7777777", 133D"6666666", 133D"5555555", 133D"4444444", 133D"3333333");
signal bit64_o_s: input_polynomial;

begin
ADD_PE_MAP: conv_polynomial port map (a_i => bit132_i_s,
                             converted_a_o => bit64_o_s);
end conv_polynomial_tb_arch;



	
