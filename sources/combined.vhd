-- @author Dimitri Bret
-- @author Clement Dargein
-- @description General Processing Element used for modular multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity combined is
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
end entity combined;


architecture combined_arch of combined is

component pe
  port (
        a_i: in bit64;
        b_i: in bit64;
        lambda_i: in bit2;
        s_i: in bit132;
        en0_i: in std_logic;
        en1_i: in std_logic;
        p_o: out bit132);
end component;

component single_register
  port (	enable_i : in std_logic;
      clk_i : in std_logic;
      resetb_i : in std_logic;
      p_i : in bit132;
      s_o : out bit132);
end component;

signal p_s : bit132;

begin

  PE1 : pe port map (
    a_i => a_i,
    b_i => b_i,
    lambda_i => lambda_i,
    s_i => s_i,
    en0_i => en0_i,
    en1_i => en1_i,
    p_o => p_s
  );

  REG1 : single_register port map (
    enable_i => enable_i,
    clk_i => clk_i,
    resetb_i => resetb_i,
    p_i => p_s,
    s_o => s_o
  );

end architecture combined_arch;

configuration combined_conf of combined is
for combined_arch
	for all : pe
		use entity work.pe(pe_arch);
	end for;
	for all : single_register
		use entity work.single_register(single_register_arch);
	end for;
end for;
end configuration combined_conf;
