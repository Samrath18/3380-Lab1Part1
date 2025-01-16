-- Full Adder Testbench

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench entity for Full Adder (no ports because it's used for simulation only)
entity tb_Full_Adder is
end tb_Full_Adder;

architecture behavior of tb_Full_Adder is

    -- Component declaration for the Full Adder
    -- This tells the testbench how to instantiate the Full Adder
    component Full_Adder
        Port ( A_fa : in  STD_LOGIC;
               B_fa : in  STD_LOGIC;
               Cin_fa : in  STD_LOGIC;
               S_fa : out  STD_LOGIC;
               Cout_fa : out  STD_LOGIC);
    end component;

    -- Signals to connect to the Full Adder inputs and outputs
    -- These signals will be driven with test values during simulation
    signal A_fa : STD_LOGIC := '0';  -- Input A for Full Adder
    signal B_fa : STD_LOGIC := '0';  -- Input B for Full Adder
    signal Cin_fa : STD_LOGIC := '0'; -- Carry-in input for Full Adder
    signal S_fa : STD_LOGIC;  -- Sum output from Full Adder
    signal Cout_fa : STD_LOGIC;  -- Carry-out output from Full Adder

begin
    -- Instantiate the Full Adder (Unit Under Test, UUT)
    -- The UUT is connected to the signals declared above
    uut: Full_Adder
        port map (
            A_fa => A_fa,
            B_fa => B_fa,
            Cin_fa => Cin_fa,
            S_fa => S_fa,
            Cout_fa => Cout_fa
        );

    -- Stimulus process to generate input combinations
    -- This process applies different input vectors to test the Full Adder
    stim_proc: process
    begin
        -- Test Case 1: A_fa = 0, B_fa = 0, Cin_fa = 0
        -- Expected output: S_fa = 0, Cout_fa = 0
        A_fa <= '0'; B_fa <= '0'; Cin_fa <= '0';
        wait for 10 ns;  -- Wait for 10 ns to observe the output

        -- Test Case 2: A_fa = 0, B_fa = 0, Cin_fa = 1
        -- Expected output: S_fa = 1, Cout_fa = 0
        A_fa <= '0'; B_fa <= '0'; Cin_fa <= '1';
        wait for 10 ns;

        -- Test Case 3: A_fa = 0, B_fa = 1, Cin_fa = 0
        -- Expected output: S_fa = 1, Cout_fa = 0
        A_fa <= '0'; B_fa <= '1'; Cin_fa <= '0';
        wait for 10 ns;

        -- Test Case 4: A_fa = 0, B_fa = 1, Cin_fa = 1
        -- Expected output: S_fa = 0, Cout_fa = 1
        A_fa <= '0'; B_fa <= '1'; Cin_fa <= '1';
        wait for 10 ns;

        -- Test Case 5: A_fa = 1, B_fa = 0, Cin_fa = 0
        -- Expected output: S_fa = 1, Cout_fa = 0
        A_fa <= '1'; B_fa <= '0'; Cin_fa <= '0';
        wait for 10 ns;

        -- Test Case 6: A_fa = 1, B_fa = 0, Cin_fa = 1
        -- Expected output: S_fa = 0, Cout_fa = 1
        A_fa <= '1'; B_fa <= '0'; Cin_fa <= '1';
        wait for 10 ns;

        -- Test Case 7: A_fa = 1, B_fa = 1, Cin_fa = 0
        -- Expected output: S_fa = 0, Cout_fa = 1
        A_fa <= '1'; B_fa <= '1'; Cin_fa <= '0';
        wait for 10 ns;

        -- Test Case 8: A_fa = 1, B_fa = 1, Cin_fa = 1
        -- Expected output: S_fa = 1, Cout_fa = 1
        A_fa <= '1'; B_fa <= '1'; Cin_fa <= '1';
        wait for 10 ns;

        -- End the simulation (no more test cases to run)
        wait;
    end process;

end behavior;
