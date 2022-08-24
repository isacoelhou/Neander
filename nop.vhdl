library ieee;
use ieee.std_logic_1164.all;

entity nop is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 snop : out std_logic_vector(10 downto 0)
	  );
  end entity;

architecture archnop of nop is

begin

     snop(10) <= (not(q(2)) and not(q(1))) or (not(q(2)) and not(q(0)));
     snop(9) <= (not(q(2)) and not(q(1))) or (not(q(2)) and not(q(0)));
     snop(8 downto 6) <= "000";
     snop(5) <= not q(2) and not q(1) and q(0);
     snop(4) <= '0';
     snop(3) <= '0';
     snop(2) <= not q(2) and not q(1) and not q(0);
     snop(1) <= not q(2) and not q(1) and q(0);
     snop(0) <= not q(2) and q(1) and not q(0);

 end architecture;
