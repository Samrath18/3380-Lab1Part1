--Multiplexer TEST BENCH
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
USE ieee.numeric_std.ALL;
 
ENTITY mux_tb IS
END mux_tb;
 
ARCHITECTURE behavior OF mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_TwoOne
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
		 S  : in std_logic;	
         Z : out  std_logic
        );
    END COMPONENT;
 
 
   --signals
   signal in1 : std_logic := '0';
   signal in2 : std_logic := '0';
   signal sel: std_logic := '0';
   signal mux_out : std_logic := '0';
 
 
 
   constant tick : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_TwoOne PORT MAP (
          A => in1,
          B => in2,
          S => sel, 
          Z=> mux_out
         
        );

   -- Stimulus process
 drive_in1 : process
	 begin
	 wait for (tick*3);
	 in1<= (not in1);
	 end process drive_in1;
 
    drive_in2 : process
	 begin
	 wait for (tick*5);
	 in2<= (not in2);
	 end process drive_in2;

  drive_sel : process
	 begin
	 wait for (tick*20);
	 sel<= (not sel);
	 end process drive_sel;

END;