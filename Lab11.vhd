library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab11 is
    Port (
        a    : in  STD_LOGIC;
        b    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end Lab11;

architecture Behavioral of Lab11 is
begin
    Sum  <= a XOR b XOR Cin;
    Cout <= (a AND b) OR (b AND Cin) OR (a AND Cin);
end Behavioral;