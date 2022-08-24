library ieee;
use ieee.std_logic_1164.all;

entity tb_neander is
end entity;

architecture tbneander of tb_neander is
constant CLK_PERIOD : time := 20 ns;

 component neander is
        port(
        clock : in std_logic;
        clear : in std_logic
        );
 end component;

 signal sclock : std_logic := '0';
 signal sclear : std_logic;

 begin

      sclock <= not(sclock) after CLK_PERIOD/2;
      u_neander : neander port map (sclock, sclear);

      u_process : process
      begin

      sclear<= '0';
      wait for CLK_PERIOD;

      sclear<= '1';
      wait for CLK_PERIOD;
      wait;

      end process;

end architecture;
