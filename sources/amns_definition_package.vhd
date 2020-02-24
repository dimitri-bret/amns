-- @author Dimitri Bret
-- @author Clement Dargein

--	Package File Template
--	Purpose: This package defines supplemental types, subtypes, 
--		     constants, and functions, used for AMNS representation


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package amns_definition_package is

 type  polynomial_p19 is array(0 to 2) of integer;


-- Constant amns_sample_p19
-- Represent all the polynomials in Big Endian representation
  type type_amns_sample_p19 is array(0 to 18) of polynomial_p19;
  constant amns_sample_p19 : type_amns_sample_p19 := (
    					(0, 0, 0),   	--  		 0
    					(0, 0, 1), 		--  		 1
    					(-1,-1,1), 		--  -X^2 -X +1
    					(1,-1,-1),		--   X^2 -X -1
    					(1,-1, 0),      --   X^2 -X
    					(1,-1, 1),		--   X^2 -X +1
    					(0, 1,-1),		-- 		  X -1
    		  			(0, 1, 0),      --        X
    		  			(0, 1, 1),		-- 		  X +1
    		  			(-1,0, 1),		--  -X^2    +1
    		  			(1, 0,-1), 		--   X^2    -1
    		  			(1, 0, 0),     	--	 X^2
    		  			(1, 0, 1), 		--   X^2    +1
    		  			(0,-1, 1),		-- 		 -X +1
    		  			(-1,1,-1),		-- -X^2  +X -1		
    		  			(-1,1, 0),		-- -X^2  +X
    		  			(-1,1, 1),       -- -X^2  +X +1
    		  			(1, 1,-1), 		--  X^2  +X -1		
    		  			(0, 0,-1)		--          -1
    		  			);
end package amns_definition_package;

