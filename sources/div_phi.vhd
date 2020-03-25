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
        A_i: in polynomial;
        enable_i: in std_logic;
        S_o: out input_polynomial);
end entity div_phi;

architecture div_phi_arch of div_phi is

  component conv_polynomial is
    port (a_i: in polynomial;
converted_a_o: out input_polynomial);
end component;


signal S_s : polynomial;

begin

  process(A_i, enable_i)
  begin
    if enable_i = '1' then
    	for i in 0 to degree-1 loop
        S_s(i) <= (A_i(i)(132) and 65B"11111111111111111111111111111111111111111111111111111111111111111") & A_i(i)(131 downto 64);
    	end loop;
    end if;
  end process;

  CONV_POLYNOMIAL_MAP: conv_polynomial port map(S_s, S_o);                                               
  
end architecture div_phi_arch;
