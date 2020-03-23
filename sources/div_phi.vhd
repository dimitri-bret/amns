-- @author Dimitri Bret
-- @author Clement Dargein
-- @description General Processing Element used for modular multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity div_phi is -- division par phi = 64 -> décalage de 6
	port (
        A_i: in input_polynomial;
        enable_i: in std_logic;
        S_o: out input_polynomial);
end entity div_phi;

architecture div_phi_arch of div_phi is

signal S_s : input_polynomial;

begin

  process(A_i, enable_i)
  begin
    if enable_i = '1' then
    	for i in 0 to degree-1 loop
        S_s(i) <= (A_i(i)(64) and 7B"1111111") & A_i(i)(63 downto 6);
    	end loop;
    end if;
  end process;

  S_o <= S_s;

end architecture div_phi_arch;
