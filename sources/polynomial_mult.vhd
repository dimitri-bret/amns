-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Polynomial multiplication for the AMNS multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity polynomial_mut is
	port (
     a_i: in polynomial;
     b_i: in polynomial;    
    clk_i: in std_logic;
   reset_i:in std_logic;
   enable_i: in std_logic;
result_o: in polynomial
);
end entity polynomial_mut;


architecture polynomial_mutlt_arch of polynomial_mut is

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
    end  component;

signal p0_s: bit132;
signal p1_s: bit132;
signal p2_s: bit132;
signal p3_s: bit132;
signal p4_s: bit132;
signal p5_s: bit132;
signal p6_s: bit132;


begin
    COMBINED_GEN: for I in 0 to 6 generate -- looping over
					COMBINED_MAP : combined port map (bit130_i => lamba_ai_bi_s


                    ); 
					end generate;



 

end architecture polynomial_mutlt_arch;


