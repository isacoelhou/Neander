library ieee;
use ieee.std_logic_1164.all;

entity hlt is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 shlt : out std_logic_vector(10 downto 0)
	  );
  end entity;

architecture archnop of hlt is

begin

     shlt(10) <= '0';
     shlt(9) <= '0';
     shlt(8 downto 6) <= "000";
     shlt(5) <= '0';
     shlt(4) <= '0';
     shlt(3) <= '0';
     shlt(2) <= '0';
     shlt(1) <= '0';
     shlt(0) <= '0';

 end architecture;
