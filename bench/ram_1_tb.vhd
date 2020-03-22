library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
library AMNSLibrary;
use AMNSLibrary.amns_definition_package.all;

entity ram_1_tb is
end entity ram_1_tb;


architecture ram_1_tb_arch of ram_1_tb is
 
  component ram_1 is
    generic(
      w        : natural:=64; --tailles des mots;
      e        : natural;--nb de mots
      nbit_ram : natural;--nb de bit de l'addresse de la ram
      ram_size : natural--taille de la ram
      );
  
    port(  -- pas de reset car le copro ne le contrôlera pas.
      address   : in  std_logic_vector(nbit_ram-1 downto 0);
      clock     : in  std_logic;
      data      : in  std_logic_vector(w-1 downto 0); -- port d'écriture ram
      wren      : in  std_logic;
      q         : out std_logic_vector(w-1 downto 0));  -- to get the ram
  end component;

  constant w_c        : natural := 4;
  constant e_c        : natural := 2;
  constant nbit_ram_c : natural := 4;
  constant ram_size_c : natural := 16;

 

  signal address_s   : std_logic_vector(nbit_ram_c-1 downto 0);
  signal clock_s     : std_logic := '1';
  signal data_s      : std_logic_vector(w_c-1 downto 0);
  signal wren_s      : std_logic;
  signal q_s         : std_logic_vector(w_c-1 downto 0);
  signal all_ram_o_s : std_logic_vector(ram_size_c*w_c-1 downto 0);  -- to get the
                                                                 -- ram during simulation

begin  --ram_1_tb_arch

  dut : ram_1
    generic map (
      w        => w_c,
      e        => e_c,
      nbit_ram => nbit_ram_c,
      ram_size => ram_size_c)

    port map (
      address   => address_s,
      clock     => clock_s,
      data      => data_s,
      wren      => wren_s,
      q         => q_s,
      all_ram_o => all_ram_o_s);

  clock_s <= not(clock_s) after 5 ns;

 process
  begin
    data_s    <= x"0";
    wren_s    <= '0';
    address_s <= x"0";
    wait for 10 ns;
    data_s    <= x"1";
    wren_s    <= '1';
    address_s <= x"1";
    wait for 10 ns;
    data_s    <= x"3";
    wren_s    <= '1';
    address_s <= x"3";
    wait for 10 ns;
    data_s    <= x"5";
    wren_s    <= '1';
    address_s <= x"5";
    wait for 10 ns;
    data_s    <= x"7";
    wren_s    <= '1';
    address_s <= x"7";
    wait for 10 ns;
    data_s    <= x"f";
    wren_s    <= '0';
    address_s <= x"1";
    wait for 10 ns;
    data_s    <= x"f";
    wren_s    <= '0';
    address_s <= x"2";
    wait;
  end process;
end architecture ram_1_tb_arch;


configuration ram_1_tb_conf of ram_1_tb is
  for ram_1_tb_arch
    for dut : ram_1
      use entity work.ram_1(ram_1_arch);
    end for;
  end for;
end configuration ram_1_tb_conf;