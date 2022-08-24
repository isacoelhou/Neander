library ieee;
use ieee.std_logic_1164.all;

entity cont is
port(
		 clk: in std_logic;
		 reset:  in std_logic;
 	 q: out std_logic_vector (2 downto 0)
	);
end entity;

architecture contador of cont is

         component ffjk is
    port(
        j, k   : in std_logic;
        clk    : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic
    );
end component;


   signal sj, sk, spr, scl, sq, snq : std_logic_vector(2 downto 0);


begin

    q <= sq;

    ffjk0 : ffjk port map(sj(0), sk(0), clk, '1', reset, sq(0), snq(0));
    ffjk1 : ffjk port map(sj(1), sk(1), clk, '1', reset, sq(1), snq(1));
    ffjk2 : ffjk port map(sj(2), sk(2), clk, '1', reset, sq(2), snq(2));

    sj(0) <= '1';
    sk(0) <= '1';

    sj(1) <= sq(0);
    sk(1) <= sq(0);

    sj(2) <= sq(0) and sq(1);
    sk(2) <= sq(0) and sq(1);



end architecture;
