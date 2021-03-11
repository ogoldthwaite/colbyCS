-- Bruce A. Maxwell
-- Spring 2013
-- CS 232
--
-- test program for the lights circuit
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lightsbench is
end entity;

architecture test of lightsbench is
  constant num_cycles : integer := 80; -- Changed to 80 cycles for longer programs

  -- this circuit just needs a clock and a reset
  signal clk : std_logic := '1';
  signal reset : std_logic;

  -- lights component
  component lights
    port(		
        clk		 : in	std_logic;
        reset	 : in	std_logic;
        lightsOut	 : out	std_logic_vector(7 downto 0);
        IRView	 : out	std_logic_vector(3 downto 0)
    );
  end component;

  -- output signals
  signal lightsig : std_logic_vector(7 downto 0);
  signal irview : std_logic_vector(3 downto 0);
  signal pcview : std_logic_vector(4 downto 0);

begin

  -- start off with a short reset
  reset <= '0', '1' after 5 ns;

  -- create a clock
  process begin
    for i in 1 to num_cycles loop
      clk <= not clk;
      wait for 5 ns;
      clk <= not clk;
      wait for 5 ns;
    end loop;
    wait;
  end process;

  -- port map the circuit
  L0: lights port map( clk, reset, lightsig, irview);

end test;