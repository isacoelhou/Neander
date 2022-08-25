library ieee;
use ieee.std_logic_1164.all;

entity anot is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 snot : out std_logic_vector(10 downto 0)
	  );
  end entity;

architecture archnot of anot is

begin

     snot(10) <= '1';
     snot(9) <= '1';
     snot(8 downto 6) <= "100";
     snot(5) <= not q(2) and not q(1) and q(0);
     snot(4) <= q(2) and q(1) and q(0);
     snot(3) <= '0';
     snot(2) <= not q(2) and not q(1) and not q(0);
     snot(1) <= not q(2) and not q(1) and q(0);
     snot(0) <= not q(2) and q(1) and not q(0);

 end architecture;
