library ieee;
use ieee.std_logic_1164.all;

entity sta is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 ssta : out std_logic_vector(10 downto 0)
	  );
  end entity;

  architecture archsta of sta is
  begin

     ssta(10) <= '1';
     ssta(9) <= not q(2) or q(1) or not q(0);
     ssta(8 downto 6) <= "000";
     ssta(5) <= not q(1) and (q(2) xor q(0));
     ssta(4) <= '0';
     ssta(3) <= q(2) and q(1) and not q(0);
     ssta(2) <=  (not(q(1)) and (q(2) xnor q(0))) or (not(q(2)) and q(1) and q(0));
     ssta(1) <=  not q(1) and (q(2) xor q(0));
     ssta(0) <= not q(2) and q(1) and not q(0);

  end architecture;
