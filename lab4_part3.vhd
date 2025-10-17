library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity lab4 is
    Port ( SW9_8  : in  STD_LOGIC_VECTOR (1 downto 0);  
           SW5_0  : in  STD_LOGIC_VECTOR (5 downto 0);  
           LEDR   : out STD_LOGIC_VECTOR (5 downto 0);  
           LEDG1_0: out STD_LOGIC_VECTOR (1 downto 0)); 
end lab4;


architecture Behavioral of lab4 is
    
    signal U, V, W : STD_LOGIC_VECTOR (1 downto 0);
    signal M       : STD_LOGIC_VECTOR (1 downto 0); 
begin

    
    U <= SW5_0(1 downto 0);  
    V <= SW5_0(3 downto 2);  
    W <= SW5_0(5 downto 4);  

    
    process(SW9_8, U, V, W)
    begin
        case SW9_8 is
            when "00" => M <= U; 
            when "01" => M <= V;  
            when "10" => M <= W;  
            when others => M <= "00";  
        end case;
    end process;

    
    LEDG1_0 <= M;

   
    LEDR <= SW5_0;

end Behavioral;
