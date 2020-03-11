-- @author Dimitri Bret
-- @author Clement Dargein

--	Package File Template
--	Purpose: This package defines supplemental types, subtypes, 
--		     constants, and functions, used for AMNS representation

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package amns_definition_package is

	subtype bit2 is std_logic_vector(1 downto 0);
	subtype bit64 is std_logic_vector(63 downto 0);
	subtype bit128 is std_logic_vector(127 downto 0);
	subtype bit129 is std_logic_vector(128 downto 0);
	subtype bit130 is std_logic_vector(129 downto 0);						  						  						  						  
	subtype bit132 is std_logic_vector(131 downto 0);

	type polynomial is array(0 to 6) of bit64;
	type internal_polynomial_mult is array (0 to 6) of bit132;



	-- polynomial used for testing purpose, these polynomial are genererated by the python script in the ressources folder
	-- constant A_POLYNOMIAL : polynomial := (5091930861202636, 1217142518816209, 7184050027866706, 21419353384672347, 29235643963879093, 15509934832078867, 9908593040533934);
	-- constant B_POLYNOMIAL: polynomial := (8061402509918760, 24915735230335350, 2307460268887778, 10320379778704402, 21468013475865192, 19910571261989853, 3758084057749864);
	
	constant lambda: bit2 := "10"; 

end package amns_definition_package;

