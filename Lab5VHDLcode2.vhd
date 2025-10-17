library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab5 is
    Port (
        D   : in  STD_LOGIC;
        Clk : in  STD_LOGIC;
        Q   : out STD_LOGIC;
        Qb  : out STD_LOGIC
    );
end lab5;

architecture Structural of lab5 is
  
    component Gated_D_Latch is
        Port (
            D   : in  STD_LOGIC;
            Clk : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Qb  : out STD_LOGIC
        );
    end component;
    
    
    signal Qm, Clk_inv: STD_LOGIC;
begin
   
    Clk_inv <= not Clk;
    
    
    Master: Gated_D_Latch 
        port map (
            D   => D,
            Clk => Clk_inv,
            Q   => Qm,
            Qb  => open   
        );
    
    
    Slave: Gated_D_Latch
        port map (
            D   => Qm,
            Clk => Clk,
            Q   => Q,
            Qb  => Qb
        );
    
end Structural;
