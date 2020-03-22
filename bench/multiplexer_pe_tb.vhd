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
        port (bit132_i: in bit132;
              bit129_i: in bit129;
              en_i: in std_logic;
              bit132_o: out bit132);
end component;

signal bit132_i_s: bit132 :=133D"222323232518151555511";
signal bit129_i_s: bit129 :=130D"9996262062626262412";
signal bit132_o_s: bit132;
signal en_i_s: std_logic :='1';

begin
    en_i_s <= '0' after 50 ns;

MULTIPLEXER_PE_MAP:  multiplexer_pe port map (bit132_i_s,
                                              bit129_i_s, 
                                              en_i_s,
				    	                      bit132_o_s);
end multiplexer_pe_tb_arch;



	
