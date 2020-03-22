-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description Processing Element test bench function for the AES algorithm

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;
library source;
use source.all;

entity pe_tb is
end entity  pe_tb;

architecture pe_tb_arch of pe_tb is

component pe is port ( a_i: in bit64;
                       b_i: in bit64;
                  lambda_i: in bit2;
                       s_i: bit132;
                     en0_i: in std_logic;
                     en1_i: in std_logic;
                       p_o: out bit132);
end component;

signal a_s: bit64 := 64D"36026640407847848"; 
signal b_s: bit64 := 64D"32919586486794702";
signal en0_s: std_logic :='0';
signal en1_s: std_logic :='0';
signal s_i_s: bit132 := 132D"0"; 
signal s_o_s: bit132;

begin
en0_s <= '1' after 100 ns;
en1_s <= '1' after 50 ns, '0' after 100 ns, '1' after 150 ns;

PE_MAP: pe port map (a_i => a_s,
                     b_i => b_s,
                lambda_i => lambda,
                   en0_i => en0_s,
                   en1_i => en1_s,
                   s_i => s_i_s,
                   p_o => s_o_s);
end pe_tb_arch;
