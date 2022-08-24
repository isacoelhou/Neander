library ieee;
use ieee.std_logic_1164.all;

entity eor is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 sor : out std_logic_vector(10 downto 0)
	  );
  end entity;

architecture archor of eor is

begin

     sor(10) <= '1';
     sor(9) <= not q(2) or not q(0) or q(1);
     sor(8 downto 6) <= "010";
     sor(5) <= (not q(2) and not q(1) and q(0)) or (q(2) and not q(1) and not q(0));
     sor(4) <= q(2) and q(1) and q(0);
     sor(3) <= '0';
     sor(2) <= (not q(2) and not q(1) and not q(0)) or (q(2) and not q(1) and q(0)) or (not q(2) and q(1) and q(0));
     sor(1) <= (not q(2) and not q(1) and q(0)) or (q(2) and not q(1) and not q(0)) or (q(2) and q(1) and not q(0));
     sor(0) <= not q(2) and q(1) and not q(0);

 end architecture;
