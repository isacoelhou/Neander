library ieee;
use ieee.std_logic_1164.all;

entity jnz is
  port(
    sel : in std_logic;
   	 q: in std_logic_vector (2 downto 0);
   	 sjnz : out std_logic_vector(10 downto 0)
	  );
  end entity;

architecture archjnz of jnz is

begin

     sjnz(10) <= not(q(0)) or not(q(2)) or q(1) when sel = '1' else '1';
     sjnz(9) <= '1';
     sjnz(8 downto 6) <= "000";
     sjnz(5) <= not(q(1)) and q(0) when sel = '1' else q(0) and not(q(2));
     sjnz(4) <= '0';
     sjnz(3) <= '0';
     sjnz(2) <=not(q(2) or q(1) or q(0)) or (not(q(2)) and q(1) and q(0)) when sel = '1' else not(q(2)) and not(q(1)) and not(q(0));
     sjnz(1) <= not(q(1)) and (q(2) or q(0)) and (not(q(2)) or not(q(0))) when sel = '1' else not(q(2)) and not(q(1)) and q(0);
     sjnz(0) <= not(q(2)) and q(1) and not(q(0));

 end architecture;
