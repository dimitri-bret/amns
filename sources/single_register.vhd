-- @author Dimitri Bret
-- @author Clement Dargein
-- @description General Processing Element used for modular multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity single_register is
	port (enable_i : in std_logic;
			 clk_i : in std_logic;
		  resetb_i : in std_logic;
			   p_i : in bit132;
			   s_o : out bit132);
end entity single_register;


architecture single_register_arch of single_register is

signal s_s : bit132 := (others => '0'); --si on met en 'X' ça marchera pas dans l'entité "combined"

begin

	seq_0 : process(clk_i, resetb_i)
		begin
		if resetb_i = '1' then	-- /!\ le reset est effectif à l'état haut
			s_s <= (others => '0');	-- si on met en 'X' ça marchera pas dans l'entité "combined"
		elsif clk_i'event and clk_i = '1' then
			if enable_i = '0' then
				s_s <= p_i;
			else
				s_s <= s_s;
			end if;
		else
			s_s <= s_s;
		end if;
	end process seq_0;

s_o <= s_s;

end architecture single_register_arch;
