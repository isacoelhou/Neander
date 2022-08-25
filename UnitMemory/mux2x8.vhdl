library ieee;
use ieee.std_logic_1164.all;

entity mux2x8 is
      port(
      c0, c1 : in std_logic_vector(7 downto 0);
      sel: in  std_logic;
      z: out  std_logic_vector (7 downto 0)
      );

   end entity;

   architecture comuta of mux2x8 is
   begin
         z <= c0 when sel = '0' else
              c1 when sel = '1' else
              (others => 'Z');

   end architecture;
