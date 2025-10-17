LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Lab5 IS
    PORT(
        D   : IN  STD_LOGIC;
        Clk : IN  STD_LOGIC;
        Q_latch, Q_pos, Q_neg : OUT STD_LOGIC
    );
END Lab5;

ARCHITECTURE Behavior OF Lab5 IS


SIGNAL Q_gated_latch : STD_LOGIC;

SIGNAL Q_pos_edge : STD_LOGIC;

SIGNAL Q_neg_edge : STD_LOGIC;

BEGIN
    
    PROCESS (D, Clk)
    BEGIN
        IF Clk = '1' THEN
            Q_gated_latch <= D;
        END IF;
    END PROCESS;

    
    PROCESS (Clk)
    BEGIN
        IF rising_edge(Clk) THEN
            Q_pos_edge <= D;
        END IF;
    END PROCESS;

    
    PROCESS (Clk)
    BEGIN
        IF falling_edge(Clk) THEN
            Q_neg_edge <= D;
        END IF;
    END PROCESS;

    
    Q_latch <= Q_gated_latch;
    Q_pos   <= Q_pos_edge;
    Q_neg   <= Q_neg_edge;

END Behavior;
