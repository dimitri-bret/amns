--@author Dimitri Bret
--@date 22/11/2018
--@description data register 
library IEEE;
use IEEE.std_logic_1164.all;
library AMNSLibrary;
use AMNSLibrary.state_definition_package.all;



entity amns_element is
	port (
		data_i:in type_state,
		data_i: out type_state
	);
end entity amns_element;


architecture amns_element_arch of amns_element is

begin

signal memo_s: type_state;

memo_s <= data_i when memo_s =0;
data_i <= memo_s when memorisationb_i = '1';

	
end architecture register_arch;
