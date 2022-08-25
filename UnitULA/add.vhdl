library ieee;
use ieee.std_logic_1164.all;

entity add is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 sadd : out std_logic_vector(10 downto 0)
	  );
  end entity;

architecture archadd of add is

begin

     sadd(10) <= '1';
     sadd(9) <= not q(2) or not q(0) or q(1);
     sadd(8 downto 6) <= "001";
     sadd(5) <= (not q(2) and not q(1) and q(0)) or (q(2) and not q(1) and not q(0));
     sadd(4) <= q(2) and q(1) and q(0);
     sadd(3) <= '0';
     sadd(2) <= (not q(2) and not q(1) and not q(0)) or (q(2) and not q(1) and q(0)) or (not q(2) and q(1) and q(0));
     sadd(1) <= (not q(2) and not q(1) and q(0)) or (q(2) and not q(1) and not q(0)) or (q(2) and q(1) and not q(0));
     sadd(0) <= not q(2) and q(1) and not q(0);

 end architecture;
