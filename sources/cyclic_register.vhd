-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Cyclic register used for polynomial multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity cyclic_register is
	port (
         clk_i: in std_logic;
    reset_en_i: in std_logic;
          en_i: in std_logic;
        s0_i: in bit132;
        s1_i: in bit132;
        s2_i: in bit132;
        s3_i: in bit132;
        s4_i: in bit132;
        s5_i: in bit132;
        s6_i: in bit132;
        s0_o: out bit132;
        s1_o: out bit132;
        s2_o: out bit132;
        s3_o: out bit132;
        s4_o: out bit132;
        s5_o: out bit132;
        s6_o: out bit132
        );
end entity cyclic_register;


architecture cyclic_register_arch of cyclic_register is

    signal counter_s: integer;
    
    begin

    CLCK_PROCESS: process (clk_i)
	begin
        if rising_edge(clk_i) then 
             if (counter_s = 6) then counter_s <= 0; 
                                else counter_s <= counter_s + 1;
             end if;
        end if;
    end process;

    s0_o <= s0_i when counter_s= 0  else s1_i when  counter_s=1 else s2_i when  counter_s=2 else s3_i when  counter_s= 3 
                   else s4_i when counter_s=4 else s5_i when  counter_s=5 else s6_i when  counter_s=6;
                   
    s1_o <= s1_i when counter_s=0 else s2_i when  counter_s=1 else s3_i when  counter_s=2 else s4_i when  counter_s=3 
                   else s5_i when counter_s=4 else s6_i when  counter_s=5 else s0_i when  counter_s=6;

    s2_o <= s2_i when counter_s=0 else s3_i when  counter_s=1 else s4_i when  counter_s=2 else s5_i when  counter_s=3 
                   else s6_i when counter_s=4 else s0_i when  counter_s=5 else s1_i when  counter_s=6;
    
    s3_o <= s3_i when counter_s=0 else s4_i when  counter_s=1 else s5_i when  counter_s=2 else s6_i when  counter_s=3 
                   else s0_i when counter_s=4 else s1_i when  counter_s=5 else s2_i when  counter_s=6;
    
    s4_o <= s4_i when counter_s=0 else s5_i when  counter_s=1 else s6_i when  counter_s=2 else s0_i when  counter_s=3 
                   else s1_i when counter_s=4 else s2_i when  counter_s=5 else s3_i when  counter_s=6;
    
    s5_o <= s5_i when counter_s=0 else s6_i when  counter_s=1 else s0_i when  counter_s=2 else s1_i when  counter_s=3 
                   else s2_i when counter_s=4 else s3_i when  counter_s=5 else s4_i when  counter_s=6;
    
    s6_o <= s6_i when counter_s=0 else s0_i when  counter_s=1 else s1_i when  counter_s=2 else s2_i when  counter_s=3 
                   else s3_i when counter_s=4 else s4_i when  counter_s=5 else s5_i when  counter_s=6;
    
end architecture cyclic_register_arch;
