library ieee;
use ieee.std_logic_1164.all;

entity decode is
     port(
     irout : in std_logic_vector(7 downto 0);
     dec : out std_logic_vector(10 downto 0)
     );
     end entity;

architecture archdecode of decode is

     begin

       dec <= "10000000000" when irout = "00000000" else
       "01000000000" when irout = "00010000" else
       "00100000000" when irout = "00100000" else
       "00010000000" when irout = "00110000" else
       "00001000000" when irout = "01000000" else
       "00000100000" when irout = "01010000" else
       "00000010000" when irout = "01100000" else
       "00000001000" when irout = "10000000" else
       "00000000100" when irout = "10010000" else
       "00000000010" when irout = "10100000" else
       "00000000001" when irout = "11110000" else
       (others => 'Z');

     end architecture;
