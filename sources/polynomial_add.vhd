-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Entity for polynomial addition
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity polynomial_add is
	port (enable_i: in std_logic;
             A_i: in polynomial;
             B_i: in polynomial;
             R_o: out polynomial);
end entity polynomial_add;

architecture polynomial_add_arch of polynomial_add is

signal R_s : polynomial;

begin

  process(A_i, B_i, enable_i)
  begin
    if enable_i = '1' then
    	for i in 0 to degree_minus_one loop
        R_s(i) <= std_logic_vector(signed(A_i(i)) + signed(B_i(i)));
    	end loop;
    end if;
  end process;

  R_o <= R_s;

end architecture polynomial_add_arch;
