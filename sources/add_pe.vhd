-- @author Dimitri Bret
-- @date 22/11/2018
-- @description Add polynomial without checking internal reduction
library IEEE;
use IEEE.std_logic_1164.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity add_amns is
	port (
		a_i: in polynomial_p19;
		b_i: in polynomial_p19;
      sum_o: out polynomial_p19
	   );
end entity add_amns;


architecture add_amns_arch of add_amns is

signal sum_s: polynomial_p19; 

begin

	GEN_ADD: for i in 0 to 2 generate 
            	sum_s(i) <= a_i(i) + b_i(i);                         
    end generate;

   sum_o <=sum_s;
end architecture add_amns_arch;
