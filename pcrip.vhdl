library ieee;
use ieee.std_logic_1164.all;

 entity pc is
  port(
  cl, clk : in std_logic;
  rw: in std_logic;
  barrinc: in std_logic;
  barr: in std_logic_vector(7 downto 0);
  endout: out std_logic_vector(7 downto 0)
  );
  end entity;

  architecture pcrip of pc is

  component mux2x8 is
      port(
      c0, c1 : in std_logic_vector(7 downto 0);
      sel: in  std_logic;
      z: out  std_logic_vector (7 downto 0)
      );

   end component;

   component fulladd8 is
        port(
                x : in std_logic_vector(7 downto 0);
                y : in std_logic_vector(7 downto 0);
                Cin_geral : in std_logic;
                S : out std_logic_vector(7 downto 0);
                Cout_geral : out std_logic
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
   signal s_add, s_pc, s_muxpc, s_endpc2mem : std_logic_vector(7 downto 0);

   begin

   U_add : fulladd8 port map("00000001", s_endpc2mem, '0', s_add);
   U_mux : mux2x8 port map(barr, s_add, barrinc, s_muxpc);
   U_rip : regCarga8bit port map(s_muxpc, clk, cl, rw, s_endpc2mem);

   endout <= s_endpc2mem;

   end architecture;
