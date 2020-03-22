-- @author Dimitri Bret
-- @author Clement Dargein
-- @description Modulo 2^64 function on en_i signal in the processing unit.
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity modulo_pe is
	port (
        bit132_i: in bit132;
		    en_i: in std_logic;
        bit132_o: out bit132
	   );
end entity modulo_pe;


architecture modulo_pe_arch of modulo_pe is

    signal modulo132_s: bit132;
    
    begin
        modulo132_s <= bit132_i and "0000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111";
        bit132_o <= bit132_i when en_i = '0' else  modulo132_s;
end architecture modulo_pe_arch;
