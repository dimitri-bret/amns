-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;
library source;
use source.all;

entity div_phi_tb is
end entity  div_phi_tb;

architecture div_phi_tb_arch of div_phi_tb is

component div_phi is
  port (
        enable_i: in std_logic;
        A_i: in input_polynomial;
        S_o: out input_polynomial);
end component;

signal enable_s : std_logic := '0';
signal A_s : input_polynomial := (65B"00000000000000000000000000000000000000000000000000000000001000000",
                      65B"00000000000000000000000000000000000000000000000000000000010000000",
                      65B"00000000000000000000000000000000000000000000000000000000011000000",
                      65B"00000000000000000000000000000000000000000000000000000000100000000",
                      65B"11111111111111111111111111111111111111111111111111111111011000000",
                      65B"11111111111111111111111111111111111111111111111111111111010000000",
                      65B"11111111111111111111111111111111111111111111111111111111001000000");
signal S_s : input_polynomial;

begin

enable_s <= '1' after 50 ns;


div_phi_MAP: div_phi port map (enable_i => enable_s,
                                A_i => A_s,
                                S_o => S_s);
end div_phi_tb_arch;
