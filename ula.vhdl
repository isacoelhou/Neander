library ieee;
use ieee.std_logic_1164.all;

entity ula is
	port(
		--dados
		x, y : in std_logic_vector(7 downto 0);
		resultado : out std_logic_vector(7 downto 0);

		--controle
		ula_op : in std_logic_vector(2 downto 0);

		NZ : out std_logic_vector(1 downto 0)

	);
end entity;

architecture archula of ula is
	--distribuicao de sinais
	--signal s_x, s_y : std_logic_vector(7 downto 0);
	signal s_resultado : std_logic_vector(7 downto 0);
	signal s_not, s_and, s_or, s_lda, s_add : std_logic_vector(7 downto 0);




	--modulo adder
	component fulladd8 is
        port(
                x : in std_logic_vector(7 downto 0);
                y : in std_logic_vector(7 downto 0);
                Cin_geral : in std_logic;
                S : out std_logic_vector(7 downto 0);
                Cout_geral : out std_logic
        );
	end component;

	component mux5x8 is
    port (
        c0: in std_logic_vector(7 downto 0);
        c1: in std_logic_vector(7 downto 0);
        c2: in std_logic_vector(7 downto 0);
        c3: in std_logic_vector(7 downto 0);
        c4: in std_logic_vector(7 downto 0);

        sel: in std_logic_vector(2 downto 0);
        z: out std_logic_vector(7 downto 0)
    );
end component mux5x8;




begin

--modulo lda
	s_lda <= y;

	--modulo not
	s_not <= not(x);

	--modulo and
	s_and <= x and y;

	--modulo or
	s_or <= x or y;

	u_add : fulladd8 port map(x, y,'0', s_add);

 u_mux : mux5x8 port map(s_lda, s_add, s_or, s_and, s_not, ula_op, s_resultado);
	--modulo mux 5x8
 --s_resultado <= s_lda when ula_op = "000" else
   --               s_add when ula_op = "001" else
     --             s_and when ula_op = "010" else
       --           s_or when ula_op = "011" else
         --         s_not when ula_op = "100" else
           --       (others => 'Z');

 resultado <= s_resultado;

        --modulo NZ
        NZ(1) <= s_resultado(7);
        NZ(0) <= not(s_resultado(7) or s_resultado(6) or s_resultado(5) or s_resultado(4) or s_resultado(3) or s_resultado(2) or s_resultado(1) or s_resultado(0));

end architecture;
