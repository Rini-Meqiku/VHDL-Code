library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture test of full_adder_tb is
    signal a, b, Cin  : STD_LOGIC := '0';
    signal Sum, Cout  : STD_LOGIC;

    component full_adder
        Port (
            a    : in  STD_LOGIC;
            b    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

begin
    UUT: full_adder
        port map (
            a    => a,
            b    => b,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );

    stim_proc: process
    begin
        a <= '0'; b <= '0'; Cin <= '0'; wait for 10 ns;
        a <= '0'; b <= '0'; Cin <= '1'; wait for 10 ns;
        a <= '0'; b <= '1'; Cin <= '0'; wait for 10 ns;
        a <= '0'; b <= '1'; Cin <= '1'; wait for 10 ns;
        a <= '1'; b <= '0'; Cin <= '0'; wait for 10 ns;
        a <= '1'; b <= '0'; Cin <= '1'; wait for 10 ns;
        a <= '1'; b <= '1'; Cin <= '0'; wait for 10 ns;
        a <= '1'; b <= '1'; Cin <= '1'; wait for 10 ns;

        wait;
    end process;
end test;
