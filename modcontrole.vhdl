library ieee;
use ieee.std_logic_1164.all;

  entity modcontrol is
     port (
      barr_inst : in std_logic_vector(7 downto 0);
      NZ : in std_logic_vector(1 downto 0);
      nrw_pc, nrw_ri, nbarr_inc : in std_logic;
      clk:  in std_logic;
      clear:  in std_logic;
      barr_control : out std_logic_vector(10 downto 0);
      pc2mem : out std_logic_vector(7 downto 0)
   );

    end entity;

    architecture archmodcontrol of modcontrol is

    component uc is
     port(
      dec: in std_logic_vector(10 downto 0);
      clk, cl : in std_logic;
      NZ: in std_logic_vector (1 downto 0);
      controle: out std_logic_vector (10 downto 0)
     );
     end component;

     component decode is
     port(
     irout : in std_logic_vector(7 downto 0);
     dec : out std_logic_vector(10 downto 0)
     );
     end component;

     component pc is
  port(
  cl, clk : in std_logic;
  rw: in std_logic;
  barrinc: in std_logic;
  barr: in std_logic_vector(7 downto 0);
  endout: out std_logic_vector(7 downto 0)
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

   signal s_ri2dec : std_logic_vector(7 downto 0);
   signal s_dec2uc : std_logic_vector(10 downto 0);

   begin

   u_RI : regCarga8bit port map(barr_inst, clk, clear, nrw_ri, s_ri2dec);
   u_decode : decode port map(s_ri2dec, s_dec2uc);
   u_uc : uc port map(s_dec2uc, clk, clear, NZ, barr_control);
   u_pc : pc port map(clear, clk, nrw_pc, nbarr_inc, barr_inst, pc2mem);

   end architecture;
