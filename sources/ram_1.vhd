 library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity ram_1 is
  generic(
    w        : natural:=64; --tailles des mots;
    e        : natural:=64;--nb de mots
    nbit_ram : natural:=64;--nb de bit de l'addresse de la ram
    ram_size : natural:=64--taille de la ram
    );

  port(  -- pas de reset car le copro ne le contrôlera pas.
    address   : in  std_logic_vector(nbit_ram-1 downto 0);
    clock     : in  std_logic;
    data      : in  std_logic_vector(w-1 downto 0); -- port d'écriture ram
    wren      : in  std_logic;
    q         : out std_logic_vector(w-1 downto 0));  -- to get the ram
end entity ram_1;


architecture ram_1_arch of ram_1 is
    signal adr_s  : std_logic_vector(nbit_ram-1 downto 0);
    signal data_s : std_logic_vector(ram_size*w-1 downto 0) := (others => '0');
  
    --debug fp5

  begin  -- syn

    seq0 : process(clock, address)
  
    begin
  
      if clock'event and clock = '1' then
        adr_s <= address;
        if wren = '1' then
          data_s((to_integer(unsigned(address))+1)*w-1 downto (to_integer(unsigned(address))*w)) <= data;
        else  -- valeur réservé en mémoire pour les donnée d'entrées.
          -- initialiser les valeurs de la ram ici
                                 --A en AMNS
                                 data_s(w-1 downto 0)<=x"007ffe09dff5e3a8";
                                 --B en AMNS
        end if;
      end if;
    end process seq0;
   
  
    q <= data_s((to_integer(unsigned(adr_s))+1)*w-1 downto (to_integer(unsigned(adr_s))*w));
  
  end architecture ram_1_arch;


 