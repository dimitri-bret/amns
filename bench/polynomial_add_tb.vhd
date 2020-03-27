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

entity polynomial_add_tb is
end entity  polynomial_add_tb;

architecture polynomial_add_tb_arch of polynomial_add_tb is

component polynomial_add is
  port (
        enable_i: in std_logic;
        A_i: in polynomial;
        B_i: in polynomial;
        R_o: out polynomial);
end component;

signal enable_s : std_logic := '0';
signal A_s : polynomial := (133D"5559595959",133D"5559595959",133D"5559595959",133D"5559595959",133D"5559595959",133D"5559595959",133D"5559595959");
signal B_s : polynomial := (133D"5559595959",133D"5559595959",133D"5559595959",133D"5559595959",133D"5559595959",133D"5559595959",133D"5559595959");
signal R_s : polynomial;

begin




  enable_s <= '1' after 50 ns;
polynomial_add_MAP: polynomial_add port map (enable_i => enable_s,
                                                  A_i => A_s,
                                                  B_i => B_s,
                                                  R_o => R_s);
end polynomial_add_tb_arch;
