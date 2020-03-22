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


	subtype bit2 is std_logic_vector(2 downto 0);
	subtype bit64 is std_logic_vector(64 downto 0);
	subtype bit128 is std_logic_vector(128 downto 0);
	subtype bit129 is std_logic_vector(129 downto 0);
	subtype bit130 is std_logic_vector(130 downto 0);
	subtype bit131 is std_logic_vector(131 downto 0);
	subtype bit132 is std_logic_vector(132 downto 0);
	subtype bit133 is std_logic_vector(133 downto 0);

	type input_polynomial is array(0 to degree -1) of bit64;
	type polynomial is array (0 to degree -1) of bit132;

	constant lambda: bit2 := "010";  -- lambda is equal to 2 in the given AMNS representation

	-- polynomial used for testing purpose, these polynomial are genererated by the python script in the ressources folder
	constant A_POLYNOMIAL: input_polynomial := (65D"36026640407847848",
	 											65D"26085403530407038",
	 											65D"26393009965975788",
	 											65D"8628319145113130",
												65D"3728766775252705",
												65D"13816485742461332",
												65D"24271458462324705");


	constant B_POLYNOMIAL: input_polynomial := (65D"32919586486794702",
										  		65D"27245746951696933",
										 		65D"10784571421677080",
										 		65D"15172096210922416",
										  		65D"2035833437045692",
										  		65D"10564212859445114",
												65D"11879294980848988");
										
	
	--m_p: AMNS m_p constant such as defined in the python script 
	constant m_p: input_polynomial := (	65D"4061600423064578463",  
									   	65D"1002183804661793117",  
										65D"4469914478408161405",  
										65D"13451109246071015664",  
										65D"7565988620960822268",  
										65D"5536628105856800310",  
										65D"13834881095578633368");

	-- constant m: input_polynomial := ();									
end package amns_definition_package;
