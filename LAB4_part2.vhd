library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LAB4 is
    Port ( x : in STD_LOGIC_VECTOR(3 downto 0);
           y : in STD_LOGIC_VECTOR(3 downto 0);
           s : in STD_LOGIC;  
           m : out STD_LOGIC_VECTOR(3 downto 0));
end LAB4;

architecture Behavioral of LAB4 is
SIGNAL set: STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
    m <= (NOT (set)AND x) OR ((set)) AND y);	 
end Behavioral;

