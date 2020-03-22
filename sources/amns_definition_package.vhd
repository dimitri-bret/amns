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
	constant degree_plus_one: integer := degree + 1; 
	constant degree_minus_one: integer := degree - 1;
	constant degree_minus_two: integer := degree - 2;


	subtype bit2 is std_logic_vector(1 downto 0);
	subtype bit64 is std_logic_vector(63 downto 0);
	subtype bit128 is std_logic_vector(127 downto 0);
	subtype bit129 is std_logic_vector(128 downto 0);
	subtype bit130 is std_logic_vector(129 downto 0);
	subtype bit132 is std_logic_vector(131 downto 0);

	type input_polynomial is array(0 to degree -1) of bit64;
	type polynomial is array (0 to degree -1) of bit132;

	constant lambda: bit2 := "10";  -- lambda is equal to 2 in the given AMNS representation

	-- polynomial used for testing purpose, these polynomial are genererated by the python script in the ressources folder
	constant A_POLYNOMIAL: input_polynomial := (64D"36026640407847848",
	 											64D"26085403530407038",
	 											64D"26393009965975788",
	 											64D"8628319145113130",
												64D"3728766775252705",
												64D"13816485742461332",
												64D"24271458462324705");


	constant B_POLYNOMIAL: input_polynomial := (64D"32919586486794702",
										  		64D"27245746951696933",
										 		64D"10784571421677080",
										 		64D"15172096210922416",
										  		64D"2035833437045692",
										  		64D"10564212859445114",
										  		64D"11879294980848988");


end package amns_definition_package;
