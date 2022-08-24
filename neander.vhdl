library ieee;
use ieee.std_logic_1164.all;

 entity neander is
        port(
        clock : in std_logic;
        clear : in std_logic
        );
 end entity;

  architecture archneander of neander is

        component modula is
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
end component;

  component modmem is
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

    end component;

    component modcontrol is
     port (
      barr_inst : in std_logic_vector(7 downto 0);
      NZ : in std_logic_vector(1 downto 0);
      nrw_pc, nrw_ri, nbarr_inc : in std_logic;
      clk:  in std_logic;
      clear:  in std_logic;
      barr_control : out std_logic_vector(10 downto 0);
      pc2mem : out std_logic_vector(7 downto 0)
   );

    end component;

   signal s_barrinst_dados : std_logic_vector(7 downto 0);
   signal s_pc2mem : std_logic_vector(7 downto 0);
   signal s_NZ : std_logic_vector(1 downto 0);
   signal s_barr_control : std_logic_vector(10 downto 0);
   --signal s_emuxmem : std_logic_vector(7 downto 0);


   begin

      u_modcontrol : modcontrol port map(s_barrinst_dados, s_NZ, s_barr_control(5), s_barr_control(0), s_barr_control(10), clock, clear, s_barr_control, s_pc2mem);
      u_modmem : modmem port map(s_pc2mem, s_barrinst_dados, s_barrinst_dados, s_barr_control(9), s_barr_control(2), s_barr_control(3), s_barr_control(1), clock, clear);
      u_modula : modula port map(s_barrinst_dados, clear, clock, s_barr_control(4), s_barr_control(3), s_barr_control(8 downto 6), s_NZ);


   end architecture;
