library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
library AESLibrary;
use AESLibrary.state_definition_package.all;
library source;

entity RTL_REG is
	port (	enable_i : in std_logic;
			clk_i : in std_logic;
			resetb_i : in std_logic;
			p_i : in bit132;
			s_o : out bit132);
end RTL_REG;


architecture RTL_REG_arch of RTL_REG is

signal s_s : bit128;

begin

	seq_0 : process(clk_i, resetb_i)
		begin
		if resetb_i = '0' then
			s_s <= (others => 'X');
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

end architecture RTL_REG_arch;
