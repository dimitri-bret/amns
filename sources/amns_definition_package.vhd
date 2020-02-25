-- @author Dimitri Bret
-- @author Clement Dargein

--	Package File Template
--	Purpose: This package defines supplemental types, subtypes, 
--		     constants, and functions, used for AMNS representation


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package amns_definition_package is


	subtype bit128 is std_logic_vector(127 downto 0);
	subtype bit129 is std_logic_vector(128 downto 0);						  						  
	subtype bit64 is std_logic_vector(63 downto 0);
	subtype bit132 is std_logic_vector(131 downto 0);


	end package amns_definition_package;

