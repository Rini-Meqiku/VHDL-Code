LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Lab5 IS
    PORT (
        SW   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); 
        KEY0 : IN  STD_LOGIC;  
        KEY1 : IN  STD_LOGIC;  
        HEX3, HEX2, HEX1, HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) 
    );
END Lab5;

ARCHITECTURE Behavior OF Lab5 IS
    SIGNAL A_reg, B_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
    
    
    FUNCTION hex_to_7seg (hex : STD_LOGIC_VECTOR(3 DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS
    BEGIN
        CASE hex IS
            WHEN "0000" => RETURN "1000000"; 
            WHEN "0001" => RETURN "1111001"; 
            WHEN "0010" => RETURN "0100100"; 
            WHEN "0011" => RETURN "0110000"; 
            WHEN "0100" => RETURN "0011001"; 
            WHEN "0101" => RETURN "0010010"; 
            WHEN "0110" => RETURN "0000010"; 
            WHEN "0111" => RETURN "1111000"; 
            WHEN "1000" => RETURN "0000000"; 
            WHEN "1001" => RETURN "0010000"; 
            WHEN "1010" => RETURN "0001000"; 
            WHEN "1011" => RETURN "0000011"; 
            WHEN "1100" => RETURN "1000110"; 
            WHEN "1101" => RETURN "0100001"; 
            WHEN "1110" => RETURN "0000110"; 
            WHEN "1111" => RETURN "0001110"; 
            WHEN OTHERS => RETURN "1111111"; 
        END CASE;
    END hex_to_7seg;

BEGIN
    
    PROCESS(KEY1, KEY0)
    BEGIN
        IF KEY0 = '0' THEN  
            A_reg <= "00000000";   
            B_reg <= "00000000";
        ELSIF rising_edge(KEY1) THEN
            A_reg <= SW;  
            B_reg <= A_reg; 
        END IF;
    END PROCESS;

    
    HEX3 <= hex_to_7seg(A_reg(7 DOWNTO 4));
    HEX2 <= hex_to_7seg(A_reg(3 DOWNTO 0));
    HEX1 <= hex_to_7seg(B_reg(7 DOWNTO 4));
    HEX0 <= hex_to_7seg(B_reg(3 DOWNTO 0));

END Behavior;
