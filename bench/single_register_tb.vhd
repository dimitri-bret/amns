-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description compteur test bench function for the AES algorithm

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;
library source;
use source.all;

entity single_register_tb is
end entity  single_register_tb;

architecture single_register_tb_arch of single_register_tb is

component single_register is
  port (
        resetb_i: in std_logic;
        clk_i: in std_logic;
        enable_i: in std_logic;
        p_i: in bit132;
        s_o: out bit132);
end component;

signal p_i_s: bit132;
signal resetb_s: std_logic :='0';
signal clk_s: std_logic :='0';
signal enable_s: std_logic  :='0';
signal s_o_s: bit132;

begin
p_i_s <= std_logic_vector(to_unsigned(1234567, 132)) after 150 ns, std_logic_vector(to_unsigned(8910111, 132)) after 500 ns;
clk_s <= not clk_s after 100 ns;
enable_s <= '1' after 450 ns, '0' after 600 ns;
resetb_s <= '1' after 950 ns;

single_register_MAP: single_register port map (
                      p_i => p_i_s,
                      resetb_i => resetb_s,
                      clk_i => clk_s,
                      enable_i => enable_s,
                      s_o => s_o_s);
end single_register_tb_arch;
