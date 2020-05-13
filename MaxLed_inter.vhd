
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity MaxLed_inter is port(
	CLOCK_50 : in std_logic;
	SW			: in std_logic_vector( 0 downto 0);
	GPIO_0   : out std_logic_vector( 5 downto 1)
	);
end entity;

architecture rtl of maxLed_inter is 
	signal strame : std_logic_vector(15 downto 0);
	signal sinput : std_logic;
	signal soclk10k : std_logic;
	
	component MAX7216 is
		port
		(
			clk		 : in	std_logic;
			input	 : in	std_logic_vector(0 downto 0);
			otrame	 : out std_logic_vector(15 downto 0);
			oclk10k : out std_logic
		);
	end component;
	component DriverMatrice is
		port
		(
			iclk10k	 : in	std_logic;
			data	 : out std_logic;
			itrame : in std_logic_vector(15 downto 0);
			CS_n : out std_logic;
			Cl10k : out std_logic
		);
	end component;
begin

	IMAX7216 :MAX7216 port map (
			clk => CLOCK_50,
			input => SW,
			otrame => strame,
			oclk10k =>soclk10k
		);
		
		
	IDriverMatrice:DriverMatrice port map(
		iclk10k => soclk10k,
		itrame => strame,
		data =>  GPIO_0(1),
		CS_n =>  GPIO_0(3),
		Cl10k => GPIO_0(5)
	
	);
	
	
end rtl;
