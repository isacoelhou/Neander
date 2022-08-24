library ieee;
use ieee.std_logic_1164.all;

entity modula is
	port(
		--dados
		barramento : inout std_logic_vector(7 downto 0);

		--controle
		reset, clock : in std_logic;
		ac_nrw : in std_logic;
		mem_nrw : in std_logic;
		ula_op : in std_logic_vector(2 downto 0);

		--status
		flags_NZ : out std_logic_vector(1 downto 0)

	);
end entity;

architecture archmodula of modula is
	--componentes
	component ula is
	port(
		--dados
		x, y : in std_logic_vector(7 downto 0);
		resultado : out std_logic_vector(7 downto 0);

		--controle
		ula_op : in std_logic_vector(2 downto 0);

		NZ : out std_logic_vector(1 downto 0)

	);
	end component;

	component flags is
port(
	datain : in  std_logic_vector(1 downto 0);
	nrw    : in  std_logic;
	clk    : in  std_logic;
	preset : in  std_logic;
	cl : in std_logic;
	dataout: out std_logic_vector(1 downto 0)
);
end component;

	component regCarga8bit is
   	port(
     		datain : in  std_logic_vector(7 downto 0);
    	 	clk : in  std_logic;
     		reset : in  std_logic;
     		nrw : in  std_logic;
    		dataout : out std_logic_vector(7 downto 0)
       );
   	end component;

	--signals
	signal s_ac2ula, s_ula2ac : std_logic_vector(7 downto 0);
	signal s_flags : std_logic_vector(1 downto 0);



begin

	barramento <= s_ac2ula when mem_nrw='1' else (others => 'Z');

	--port map dos componentes
	u_regAC : regCarga8bit port map(s_ula2ac, clock, reset, ac_nrw, s_ac2ula);

	u_ula : ula port map(s_ac2ula, barramento, s_ula2ac, ula_op, s_flags);

	u_flag : flags port map(s_flags, ac_nrw, clock, '1', reset,  flags_NZ);

end architecture;
