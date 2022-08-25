library ieee;
use ieee.std_logic_1164.all;

entity fulladd is
	port(
		x : in std_logic;
		y : in std_logic;
		Cin_geral : in std_logic;
		S : out std_logic;
		Cout_geral : out std_logic
	);
end entity;

architecture archfull of fulladd is

begin
        S <= (y xor x) xor Cin_geral;
        Cout_geral <= (Cin_geral and y) or (Cin_geral and x) or (y and x);

end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity fulladd8 is
        port(
                x : in std_logic_vector(7 downto 0);
                y : in std_logic_vector(7 downto 0);
                Cin_geral : in std_logic;
                S : out std_logic_vector(7 downto 0);
                Cout_geral : out std_logic
        );
end entity;

architecture archfull8 of fulladd8 is
component fulladd is
        port(
                x : in std_logic;
                y : in std_logic;
                Cin_geral : in std_logic;
                S : out std_logic;
                Cout_geral : out std_logic
        );
        end component;

signal carry : std_logic_vector(6 downto 0);
begin

	fulladd0 : fulladd port map(y(0), x(0), Cin_geral, S(0), carry(0));
	fulladd1 : fulladd port map(y(1), x(1), carry(0), S(1), carry(1));
	fulladd2 : fulladd port map(y(2), x(2), carry(1), S(2), carry(2));
	fulladd3 : fulladd port map(y(3), x(3), carry(2), S(3), carry(3));
	fulladd4 : fulladd port map(y(4), x(4), carry(3), S(4), carry(4));
	fulladd5 : fulladd port map(y(5), x(5), carry(4), S(5), carry(5));
	fulladd6 : fulladd port map(y(6), x(6), carry(5), S(6), carry(6));
	fulladd7 : fulladd port map(y(7), x(7), carry(6), S(7), Cout_geral);
end architecture;
