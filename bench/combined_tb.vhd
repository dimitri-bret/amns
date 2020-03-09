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

entity combined_tb is
end entity  combined_tb;

architecture combined_tb_arch of combined_tb is

component combined is
  port (
        a_i: in bit64;
        b_i: in bit64;
        lambda_i: in bit2;
        s_i: in bit132;
        en0_i: in std_logic;
        en1_i: in std_logic;
        resetb_i: in std_logic;
        clk_i: in std_logic;
        enable_i: in std_logic;
        s_o: out bit132);
end component;

signal a_s: bit64 := "1010101010101010101010101010101010101010101010101010101010101010"; --12297829382473034410 in decimal
signal b_s: bit64 := "1010101010101010101010101010101010101010101010101010101010101010"; --12297829382473034410 in decimal
signal lambda_s: bit2 := "10";
signal s_i_s: bit132 := std_logic_vector(to_unsigned(1234567, 132));
signal en0_s: std_logic :='0';
signal en1_s: std_logic :='0';
signal resetb_s: std_logic :='0';
signal clk_s: std_logic :='0';
signal enable_s: std_logic  :='0';
signal s_o_s: bit132;

begin
clk_s <= not clk_s after 100 ns;
enable_s <= '1' after 450 ns, '0' after 850 ns;
resetb_s <= '1' after 950 ns;

combined_MAP: combined port map (
                      a_i => a_s,
                      b_i => b_s,
                      lambda_i => lambda_s,
                      s_i => s_i_s,
                      en0_i => en0_s,
                      en1_i => en1_s,
                      resetb_i => resetb_s,
                      clk_i => clk_s,
                      enable_i => enable_s,
                      s_o => s_o_s);
end combined_tb_arch;
