-- @author Dimitri Bret
-- @author Clement Dargein
-- @description General Processing Element used for modular multiplication
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity lambda_lookup is
	port (
        count_i: in integer;
        clk_i: in std_logic;
        resetb_i: in std_logic;
				enable_i: in std_logic;
        enable_o: out std_logic_vector(0 to degree-1) -- n = 7.
        );
end entity lambda_lookup;


architecture lambda_lookup_arch of lambda_lookup is

signal enable_s : std_logic_vector(0 to degree-1);

begin

  process(count_i)
  begin
    enable_s <= (others => '0');
    if (count_i <= degree) and (count_i > 0) then -- on s'assure que le compteur ne délire pas
      for i in degree-1 downto degree-count_i loop
        enable_s(i) <= '1';
      end loop;
    end if;
  end process;

  enable_o <= enable_s;

end architecture lambda_lookup_arch;
