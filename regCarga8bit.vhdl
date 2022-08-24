library ieee;
use ieee.std_logic_1164.all;
 entity regCarga8bit is
   port(
     datain : in  std_logic_vector(7 downto 0);
     clk : in  std_logic;
     reset : in  std_logic;
     nrw : in  std_logic;
     dataout : out std_logic_vector(7 downto 0)
       );
   end entity;

   architecture archrem of regCarga8bit is
     component ffd is port(
        d : in  std_logic;
		     clk  : in  std_logic;
		     pr, cl : in  std_logic;
		     q, nq  : out std_logic
	     );
    end component;

    signal s_d , reg_d: std_logic_vector(7 downto 0);

    begin
    dataout <= s_d;

    ffd7 : ffd port map (reg_d(7), clk, '1', reset, s_d(7));
    ffd6 : ffd port map (reg_d(6), clk, '1', reset, s_d(6));
    ffd5 : ffd port map (reg_d(5), clk, '1', reset, s_d(5));
    ffd4 : ffd port map (reg_d(4), clk, '1', reset, s_d(4));
    ffd3 : ffd port map (reg_d(3), clk, '1', reset, s_d(3));
    ffd2 : ffd port map (reg_d(2), clk, '1', reset, s_d(2));
    ffd1 : ffd port map (reg_d(1), clk, '1', reset, s_d(1));
    ffd0 : ffd port map (reg_d(0), clk, '1', reset, s_d(0));

    --generate



    reg_d <= s_d when nrw = '0' else datain when nrw = '1' else (others => 'Z');

    end architecture;
