library ieee;
use ieee.std_logic_1164.all;

entity jmp is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 sjmp : out std_logic_vector(10 downto 0)
	  );
  end entity;

architecture archjmp of jmp is

begin

     sjmp(10) <= not q(2) or q(1) or not q(0);
     sjmp(9) <= not q(2) or q(1) or not q(0);
     sjmp(8 downto 6) <= "000";
     sjmp(5) <= not q(1) and q(0);
     sjmp(4) <= '0';
     sjmp(3) <= '0';
     sjmp(2) <= (not q(1) and (q(2) xnor q(0))) or (not q(2) and q(1) and q(0));
     sjmp(1) <= not q(1) and (q(2) xor q(0));
     sjmp(0) <= not q(2) and q(1) and not q(0);

 end architecture;
