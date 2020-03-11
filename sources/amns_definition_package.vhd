-- @author Dimitri Bret
-- @author Clement Dargein

--	Package File Template
--	Purpose: This package defines supplemental types, subtypes,
--		     constants, and functions, used for AMNS representation

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package amns_definition_package is

	constant degree : integer := 7;
	subtype bit2 is std_logic_vector(1 downto 0);
	subtype bit64 is std_logic_vector(63 downto 0);
	subtype bit128 is std_logic_vector(127 downto 0);
	subtype bit129 is std_logic_vector(128 downto 0);
	subtype bit130 is std_logic_vector(129 downto 0);
	subtype bit132 is std_logic_vector(131 downto 0);
	type matrix is array (0 to degree) of std_logic_vector(0 to degree-1);

	type polynomial is array(0 to 6) of bit64;
	type internal_polynomial_mult is array (0 to 6) of bit132;

	 std_logic_vector(to_unsigned(32919586486794702, 132)),
	 std_logic_vector(to_unsigned(27245746951696933, 132)),
	 std_logic_vector(to_unsigned(10784571421677080, 132)),
	 std_logic_vector(to_unsigned(15172096210922416, 132)),
	 std_logic_vector(to_unsigned(2035833437045692, 132)),
	 std_logic_vector(to_unsigned(10564212859445114, 132)),
	 std_logic_vector(to_unsigned(11879294980848988, 132)),



	-- polynomial used for testing purpose, these polynomial are genererated by the python script in the ressources folder
	 constant A_POLYNOMIAL : polynomial := (std_logic_vector(to_unsigned(36026640407847848, 132)), 	 
	 										std_logic_vector(to_unsigned(26085403530407038, 132)),
	 										std_logic_vector(to_unsigned(26393009965975788, 132)),
	 										std_logic_vector(to_unsigned(8628319145113130, 132)),
											std_logic_vector(to_unsigned(3728766775252705, 132)),
											std_logic_vector(to_unsigned(13816485742461332, 132)),
											std_logic_vector(to_unsigned(24271458462324705, 132)));
	 
		
	constant B_POLYNOMIAL: polynomial := (std_logic_vector(to_unsigned(32919586486794702, 132)),
										  std_logic_vector(to_unsigned(27245746951696933, 132)),
										  std_logic_vector(to_unsigned(10784571421677080, 132)),
										  std_logic_vector(to_unsigned(15172096210922416, 132)),
										  std_logic_vector(to_unsigned(2035833437045692, 132)),
										  std_logic_vector(to_unsigned(10564212859445114, 132)),
										  std_logic_vector(to_unsigned(11879294980848988, 132)));
	
	constant lambda: bit2 := "10";  -- lambda is equal to 2 in the given AMNS representation

end package amns_definition_package;
