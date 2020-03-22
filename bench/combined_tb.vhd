-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description compteur test bench function for the AES algorithm

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;


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

signal a_s: bit64 := "0000000000000000000000000000000000000000000000000000000000000001"; --12297829382473034410 in decimal
signal b_s: bit64 := "0000000000000000000000000000000000000000000000000000000000000001"; --12297829382473034410 in decimal
signal lambda_s: bit2 := "10";
signal en0_s: std_logic :='0';
signal en1_s: std_logic :='0';
signal resetb_s: std_logic :='0';
signal clk_s: std_logic :='1';
signal enable_s: std_logic  :='0';
signal s_o_s: bit132;

begin
clk_s <= not clk_s after 50 ns;
enable_s <= '1' after 950 ns;
b_s <= "0000000000000000000000000000000000000000000000000000000000000010" after 200 ns;
--s_i_s <= std_logic_vector(to_unsigned(2, 132)) after 100 ns, std_logic_vector(to_unsigned(3, 132)) after 200 ns, std_logic_vector(to_unsigned(4, 132)) after 300 ns;
--resetb_s <= '1' after 950 ns;

combined_MAP: combined port map (
                      a_i => a_s,
                      b_i => b_s,
                      lambda_i => lambda_s,
                      s_i => s_o_s,
                      en0_i => en0_s,
                      en1_i => en1_s,
                      resetb_i => resetb_s,
                      clk_i => clk_s,
                      enable_i => enable_s,
                      s_o => s_o_s);
end combined_tb_arch;
