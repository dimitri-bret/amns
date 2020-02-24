-- @Author Dimitri Bret
-- @Author Clement Dargein
-- @description compteur test bench function for the AES algorithm 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;
library source;
use source.all;

entity add_amns_tb is
end entity  add_amns_tb;

architecture add_amns_tb_arch of add_amns_tb is

component add_amns is 
		port (
		a_i: in polynomial_p19;
		b_i: in polynomial_p19;
		sum_o: out polynomial_p19
	);
end component;

signal a_s: polynomial_p19 := (0,1,0);
signal b_s: polynomial_p19 := (1,1,0);

signal sum_s: polynomial_p19;

begin

ADD_AMNS_MAP: add_amns port map ( a_i => a_s,
								  b_i => b_s, 
								 sum_o=> sum_s);

TEST_PROCESS :process
   begin
		a_s<=(0,1,0), (1,1,1) after 100 ns;

	wait;
   end process;

end add_amns_tb_arch;



	
