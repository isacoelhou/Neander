library ieee;
use ieee.std_logic_1164.all;

entity eand is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 sand : out std_logic_vector(10 downto 0)
	  );
  end entity;

architecture archand of eand is

begin

     sand(10) <= '1';
     sand(9) <= not q(2) or not q(0) or q(1);
     sand(8 downto 6) <= "011";
     sand(5) <= (not q(2) and not q(1) and q(0)) or (q(2) and not q(1) and not q(0));
     sand(4) <= q(2) and q(1) and q(0);
     sand(3) <= '0';
     sand(2) <= (not q(2) and not q(1) and not q(0)) or (q(2) and not q(1) and q(0)) or (not q(2) and q(1) and q(0));
     sand(1) <= (not q(2) and not q(1) and q(0)) or (q(2) and not q(1) and not q(0)) or (q(2) and q(1) and not q(0));
     sand(0) <= not q(2) and q(1) and not q(0);

 end architecture;
