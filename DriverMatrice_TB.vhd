library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;


entity DriverMatrice_TB is
end DriverMatrice_TB;

architecture rtl of DriverMatrice_TB is


		COMPONENT DriverMatrice
        PORT(
            iclk10k	 : in	std_logic;
				data	 : out std_logic;
				itrame : in std_logic_vector(15 downto 0);
				CS_n : out std_logic;
				Cl10k : out std_logic);
    END COMPONENT;

	signal tramescan 			: std_logic_vector(15 downto 0):="0000101100000111";
	signal iclk10k : std_logic := '0';
	signal data : std_logic;
	signal itrame : std_logic_vector (15 downto 0) := (others => '0');
	signal CS_n : std_logic;
	signal cl10k : std_logic;
	constant clk_period : time := 10 ns;
	
begin
 uut: DriverMatrice PORT MAP (
            iclk10k=>iclk10k,
				data	 =>data,
				itrame =>itrame,
				CS_n =>CS_n,
				Cl10k =>Cl10k
    );
	

-- Definition of the clock process.
   clk_process :process begin
        iclk10k <= '0';
        wait for clk_period/2;
        iclk10k <= '1';
        wait for clk_period/2;
		  
   end process;	

    -- Stimuli process.
    stimuli: process begin
        itrame <= tramescan;
        wait for 200 ns;
--        itrame <= trameshtdwn;
--        wait for 200 ns;
--		  itrame <= tramedisplay;
--        wait for 200 ns;
--        itrame <= tramedecodemod;
--        wait for 200 ns;
--		  itrame <= trameintensity;
--        wait for 200 ns;
--        itrame <= "0000" & "0001" & "00000000";
--		  wait for 200 ns;
--		  itrame <= "0000" & "0010" & "00100100";
	end process;
end rtl;