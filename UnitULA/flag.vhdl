library ieee;
use ieee.std_logic_1164.all;

entity flags is
port(
	datain : in  std_logic_vector(1 downto 0);
	nrw    : in  std_logic;
	clk    : in  std_logic;
	preset : in  std_logic;
	cl : in std_logic;
	dataout: out std_logic_vector(1 downto 0)
);
end entity;

architecture archflags of flags is

    component regCarga1bit is
        port (
            d: in std_logic;
            nrw: in std_logic;
            pr: in std_logic;
            cl: in std_logic;
            clk: in std_logic;
            s: out std_logic
        );
    end component regCarga1bit;

--signal reg_d, s_d : std_logic_vector(1 downto 0);

begin

	u_ffdN : regCarga1bit port map(datain(1), nrw, preset, cl, clk, dataout(1));
	u_ffdz : regCarga1bit port map(datain(0), nrw, cl, preset, clk, dataout(0));

end architecture;
