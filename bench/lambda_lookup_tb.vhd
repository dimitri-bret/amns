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

entity lambda_lookup_tb is
end entity  lambda_lookup_tb;

architecture lambda_lookup_tb_arch of lambda_lookup_tb is

component lambda_lookup is
  port (
        count_i: in Integer;
        clk_i: in std_logic;
        resetb_i: in std_logic;
				enable_i: in std_logic;
        enable_o: out std_logic_vector(0 to degree-1) -- n = 7.
        );
end component;

signal count_s: Integer := 0;
signal resetb_s: std_logic :='0';
signal clk_s: std_logic :='0';
signal enable_i_s: std_logic  :='0';
signal enable_o_s: std_logic_vector(0 to degree-1);

begin
count_s <= count_s+1 after 100 ns;
clk_s <= not clk_s after 100 ns;
enable_i_s <= '1' after 150 ns, '0' after 1050 ns;
resetb_s <= '1' after 1250 ns;

lambda_lookup_MAP: lambda_lookup port map (
                      count_i => count_s,
                      resetb_i => resetb_s,
                      clk_i => clk_s,
                      enable_i => enable_i_s,
                      enable_o => enable_o_s);
end lambda_lookup_tb_arch;
