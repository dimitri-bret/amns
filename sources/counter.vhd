-- @author Dimitri Bret
-- @author Clement Dargein
-- @description General Processing Element used for modular multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

-- normalement le counter doit aller de 0 à degree-1
-- nous on considère que le zéro est l'état idle, puis on compte de 1 à degree.

entity counter is
	port (
			clock_i : in std_logic;
			resetb_i : in std_logic;
			enable_i : in std_logic;
			count_o : out integer
			);
end entity counter;

architecture counter_arch of counter is

signal count_s : integer range 0 to degree_plus_one := 0;
signal security_s : std_logic := '0';	-- ce flag permet de ralonger le cycle 0 d'un coup d'horloge si on appuie sur "enable" trop proche d'un front montant et que le signal n'a pas le temps de se propager.

begin

	seq_0 : process(clock_i, resetb_i, enable_i)
		begin
		if clock_i'event and clock_i = '1' then
			if resetb_i = '1' then	-- reset actif à l'état haut
				count_s <= 0;
			elsif enable_i = '1' and count_s < degree_plus_one and security_s = '1' then
				count_s <= count_s+1;
			else
				count_s <= count_s;
			end if;
		elsif clock_i'event and clock_i = '0' then
			if enable_i = '1' then
				security_s <= '1';
			else
				security_s <= '0';
		end if;
		else
			count_s <= count_s;
		end if;
	end process seq_0;

count_o <= count_s;

end architecture counter_arch;
