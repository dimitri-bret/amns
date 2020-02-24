@author Dimitri Bret
@author Clement Dargein

--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions, used for AMNS representation


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package amns_definition_package is

  
  subtype polynomial is std_logic_vector(3 downto 0);

  type row_state is array(0 to 3) of bit8;
  type column_state is array(0 to 3) of bit8;
  type type_state is array(0 to 3) of row_state;
  type  is array(0 to 3) of integer range 0 to 255;


-- Constant amns_sample_p19
  constant Rcon : type_rcon := (
    X"01", X"02", X"04", X"08", X"10", X"20", X"40", X"80", X"1b", X"36", X"00");

end state_definition_package;

