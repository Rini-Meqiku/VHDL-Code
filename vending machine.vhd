LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab7 IS
  PORT (
    clk, rst: IN STD_LOGIC;
    nickel_in, dime_in, quarter_in: IN BOOLEAN;
    candy_out, nickel_out, dime_out: OUT STD_LOGIC
  );
END lab7;

ARCHITECTURE behavior OF lab7 IS

  TYPE state IS (st0, st5, st10, st15, st20, st25, st30, st35, st40, st45);
  ATTRIBUTE enum_encoding : STRING;
  ATTRIBUTE enum_encoding OF state : TYPE IS "sequential";

  SIGNAL pr_state, nx_state: state;

BEGIN

  
  PROCESS(clk, rst)
  BEGIN
    IF rst = '1' THEN
      pr_state <= st0;
    ELSIF rising_edge(clk) THEN
      pr_state <= nx_state;
    END IF;
  END PROCESS;

  
  PROCESS(pr_state, nickel_in, dime_in, quarter_in)
  BEGIN
    CASE pr_state IS
      WHEN st0 =>
        IF nickel_in THEN nx_state <= st5;
        ELSIF dime_in THEN nx_state <= st10;
        ELSIF quarter_in THEN nx_state <= st25;
        ELSE nx_state <= st0;
        END IF;

      WHEN st5 =>
        IF nickel_in THEN nx_state <= st10;
        ELSIF dime_in THEN nx_state <= st15;
        ELSIF quarter_in THEN nx_state <= st30;
        ELSE nx_state <= st5;
        END IF;

      WHEN st10 =>
        IF nickel_in THEN nx_state <= st15;
        ELSIF dime_in THEN nx_state <= st20;
        ELSIF quarter_in THEN nx_state <= st35;
        ELSE nx_state <= st10;
        END IF;

      WHEN st15 =>
        IF nickel_in THEN nx_state <= st20;
        ELSIF dime_in THEN nx_state <= st25;
        ELSIF quarter_in THEN nx_state <= st40;
        ELSE nx_state <= st15;
        END IF;

      WHEN st20 =>
        IF nickel_in THEN nx_state <= st25;
        ELSIF dime_in THEN nx_state <= st30;
        ELSIF quarter_in THEN nx_state <= st45;
        ELSE nx_state <= st20;
        END IF;

      WHEN st25 | st30 | st35 | st40 | st45 =>
        nx_state <= st0;  

      WHEN OTHERS =>
        nx_state <= st0;
    END CASE;
  END PROCESS;

 
  PROCESS(pr_state)
  BEGIN
    
    candy_out <= '0';
    nickel_out <= '0';
    dime_out <= '0';

    CASE pr_state IS
      WHEN st25 =>
        candy_out <= '1'; 

      WHEN st30 =>
        candy_out <= '1';
        nickel_out <= '1'; 

      WHEN st35 =>
        candy_out <= '1';
        dime_out <= '1'; 
		  
      WHEN st40 =>
        candy_out <= '1';
        dime_out <= '1';
        nickel_out <= '1';

      WHEN st45 =>
        candy_out <= '1';
        dime_out <= '1';
        
      WHEN OTHERS =>
        candy_out <= '0';
        nickel_out <= '0';
        dime_out <= '0';
    END CASE;
  END PROCESS;

END behavior;
