library ieee;
use ieee.std_logic_1164.all;

   entity modmem is
     port (
      end_PC, end_BARR : in std_logic_vector (7 downto 0);
      qmem_interface : inout std_logic_vector (7 downto 0);
      nbarpc: in std_logic;
      rem_rw : in std_logic;
      mem_rw:  in std_logic;
      rdm_rw : in std_logic;
      clk:  in std_logic;
      clear:  in std_logic
   );

    end entity;

    architecture archmodmem of modmem is

      component mux2x8 is
         port(
         c0, c1 : in std_logic_vector(7 downto 0);
         sel: in  std_logic;
         z: out  std_logic_vector (7 downto 0)
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

         component as_ram is
            port(
               addr  : in    std_logic_vector(7 downto 0);
               data  : inout std_logic_vector(7 downto 0);
               notrw : in    std_logic;
               reset : in    std_logic
            );
         end component as_ram;


         signal s_mux2rem, s_rem2mem, s_mem2rdm, s_rdm2mux: std_logic_vector(7 downto 0);

         begin
            qmem_interface <= s_rdm2mux when mem_rw = '0' else (others => 'Z');
            s_mem2rdm <= qmem_interface when mem_rw = '1' else (others => 'Z');

         u_MUX : mux2x8 port map(end_BARR, end_PC, nbarpc, s_mux2rem);
         u_REM : regCarga8bit port map(s_mux2rem, clk, clear, rem_rw, s_rem2mem);
         u_MEM : as_ram port map(s_rem2mem, s_mem2rdm, mem_rw, clear);
         u_RDM : regcarga8bit port map(s_mem2rdm, clk, clear, rdm_rw, s_rdm2mux);

         end architecture;
