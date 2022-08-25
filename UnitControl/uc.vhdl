library ieee;
use ieee.std_logic_1164.all;

entity uc is
     port(
      dec: in std_logic_vector(10 downto 0);
      clk, cl : in std_logic;
      NZ: in std_logic_vector (1 downto 0);
      controle: out std_logic_vector (10 downto 0)
     );
     end entity;

architecture archuc of uc is

    component mux11x11 is
      port(
      c0, c1, c2, c3 , c4, c5, c6, c7, c8, c9, c10 : in std_logic_vector(10 downto 0);
      sel: in  std_logic_vector(10 downto 0);
      z: out  std_logic_vector (10 downto 0)
      );

   end component;

     component cont is
       port(
		        clk: in std_logic;
		        reset:  in std_logic;
        	 q: out std_logic_vector (2 downto 0)
	       );
     end component;

   component nop is
     port(
      	 q: in std_logic_vector (2 downto 0);
      	 snop : out std_logic_vector(10 downto 0)
	     );
     end component;

     component add is
     port(
      	 q: in std_logic_vector (2 downto 0);
      	 sadd : out std_logic_vector(10 downto 0)
	     );
     end component;

     component hlt is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 shlt : out std_logic_vector(10 downto 0)
	  );
  end component;

  component lda is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 slda : out std_logic_vector(10 downto 0)
	  );
  end component;

  component eand is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 sand : out std_logic_vector(10 downto 0)
	  );
  end component;

  component jmp is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 sjmp : out std_logic_vector(10 downto 0)
	  );
  end component;

  component jnz is
    port(
      sel : in std_logic;
        q: in std_logic_vector (2 downto 0);
        sjnz : out std_logic_vector(10 downto 0)
      );
    end component;

  component anot is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 snot : out std_logic_vector(10 downto 0)
	  );
  end component;

  component eor is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 sor : out std_logic_vector(10 downto 0)
	  );
  end component;

  component sta is
  port(
   	 q: in std_logic_vector (2 downto 0);
   	 ssta : out std_logic_vector(10 downto 0)
	  );
  end component;

  signal s_cont : std_logic_vector(2 downto 0);
  signal s_snop, s_sadd, s_shlt, s_slda, s_snot, s_sor, s_ssta, s_sjz, s_sjn, s_sjmp, s_sand : std_logic_vector(10 downto 0);
  signal instrucaoAtiva : string(1 to 3);
     begin

      instrucaoAtiva <= "NOP" when dec = "10000000000" else
      "STA" when dec = "01000000000" else
      "LDA" when dec = "00100000000" else
      "ADD" when dec = "00010000000" else
      "OR " when dec = "00001000000" else
      "AND" when dec = "00000100000" else
      "NOT" when dec = "00000010000" else
      "JMP" when dec = "00000001000" else
      "JN " when dec = "00000000100" else
      "JZ " when dec = "00000000010" else
      "HLT" when dec = "00000000001" else
      "ERR";

     u_mux : mux11x11 port map(s_snop, s_ssta, s_slda, s_sadd, s_sand, s_sor, s_snot, s_sjmp, s_sjn, s_sjz, s_shlt, dec, controle);
     u_cont : cont port map(clk, cl, s_cont);
     u_nop : nop port map(s_cont, s_snop);
     u_add : add port map(s_cont, s_sadd);
     u_hlt : hlt port map(s_cont, s_shlt);
     u_lda : lda port map(s_cont, s_slda);
     u_not : anot port map(s_cont, s_snot);
     u_or : eor port map(s_cont, s_sor);
     u_sta : sta port map(s_cont, s_ssta);
     u_jn : jnz port map(NZ(1), s_cont, s_sjn);
     u_jz : jnz port map(NZ(0), s_cont, s_sjz);
     u_jmp : jmp port map(s_cont, s_sjmp);
     u_and : eand port map(s_cont, s_sand);


     end architecture;
