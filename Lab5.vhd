library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Gated_D_Latch is
    Port (
        D   : in  STD_LOGIC;
        Clk : in  STD_LOGIC;
        Q   : out STD_LOGIC;
        Qb  : out STD_LOGIC
    );
end Gated_D_Latch;

architecture Behavioral of Gated_D_Latch is
begin
    process(D, Clk)
    begin
        if Clk = '1' then  
            Q  <= D;
            Qb <= not D;
        end if;
    end process;
end Behavioral;

