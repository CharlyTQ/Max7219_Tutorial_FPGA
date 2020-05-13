-- Quartus II VHDL Template
-- Four-State Mealy State Machine

-- A Mealy machine has outputs that depend on both the state and
-- the inputs.	When the inputs change, the outputs are updated
-- immediately, without waiting for a clock edge.  The outputs
-- can be written more than once per state or per clock cycle.

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity DriverMatrice is

	port
	(
		iclk10k	 : in	std_logic;
		data	 : out std_logic;
		itrame : in std_logic_vector(15 downto 0);
		CS_n : out std_logic;
		Cl10k : out std_logic
	);

end entity;

architecture rtl of DriverMatrice is

	-- Build an enumerated type for the state machine
	type state_type is (Recept,d15,d14,d13,d12,d11,d10,d9,d8,d7,d6,d5,d4,d3,d2,d1,d0);

	-- Register to hold the current state
	signal state : state_type;
	signal donnee: std_logic_vector(15 downto 0);
begin
	process (iclk10k,state,itrame)
	
	begin
		if (falling_edge(iclk10k)) then
			-- Determine the next state synchronously, based on
			-- the current state and the input
			case state is
				when Recept=> 
					donnee <= itrame;
				   state <= d15;
				when d15=>
						state <= d14;
				when d14=>
						state <= d13;	
				when d13=>
						state <= d12;	
				when d12=>
						state <= d11;
				when d11=>
						state <= d10;	
				when d10=>
						state <= d9;	
				when d9=>
						state <= d8;
				when d8=>
						state <= d7;	
				when d7=>
						state <= d6;	
				when d6=>
						state <= d5;
				when d5=>
						state <= d4;	
				when d4=>
						state <= d3;	
				when d3=>
						state <= d2;
				when d2=>
						state <= d1;	
				when d1=>
						state <= d0;	
				when d0=>
					state <= Recept;					
			end case;
		end if;
	end process;

	-- Determine the output based only on the current state
	-- and the input (do not wait for a clock edge).
	process (donnee,state)
	begin
			case state is
				when Recept=> 
					null;
				when d15=>
						data <= donnee(15);
						CS_n <= '0';
				when d14=>
						data <= donnee(14);
						CS_n <= '0';
				when d13=>
						data <= donnee(13);
						CS_n <= '0';
				when d12=>
						data <= donnee(12);
						CS_n <= '0';
				when d11=>
						data <= donnee(11);
						CS_n <= '0';
				when d10=>
						data <= donnee(10);
						CS_n <= '0';
				when d9=>
						data <= donnee(9);
						CS_n <= '0';
				when d8=>
						data <= donnee(8);
						CS_n <= '0';
				when d7=>
						data <= donnee(7);
						CS_n <= '0';
				when d6=>
						data <= donnee(6);
						CS_n <= '0';
				when d5=>
						data <= donnee(5);
						CS_n <= '0';
				when d4=>
						data <= donnee(4);
						CS_n <= '0';
				when d3=>
						data <= donnee(3);
						CS_n <= '0';
				when d2=>
						data <= donnee(2);
						CS_n <= '0';
				when d1=>
						data <= donnee(1);
						CS_n <= '0';
				when d0=>
						data <= donnee(0);
						CS_n <= '0';
			end case;
	end process;

	
end rtl;
