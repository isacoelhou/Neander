library ieee;
use ieee.std_logic_1164.all;

entity lda is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 slda : out std_logic_vector(10 downto 0)
	  );
  end entity;

  architecture archlda of lda is
  begin

     slda(10) <= '1';
     slda(9) <= not q(2) or q(1) or not q(0);
     slda(8 downto 6) <= "000";
     slda(5) <= not q(1) and (q(2) xor q(0));
     slda(4) <= q(2) and q(1) and q(0);
     slda(3) <= '0';
     slda(2) <= (not q(1) and (q(2) xnor q(0))) or (not q(2) and q(1) and q(0));
     slda(1) <= (q(2) and not q(0)) or (not q(2) and not q(1) and q(0));
     slda(0) <= not q(2) and q(1) and not q(0);

  end architecture;
