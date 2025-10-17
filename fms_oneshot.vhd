library ieee;
use ieee.std_logic_1164.all;

=====  port(
    clk     : in  std_logic;                              
    reset_n : in  std_logic;                              
    w       : in  std_logic;                              
    z       : out std_logic;                              
    leds    : out std_logic_vector(8 downto 0)            
  );
end Lab8;

architecture Behavioral of Lab8 is
  signal Q, Q_next : std_logic_vector(8 downto 0);  
begin

  
  process(Q, w)
  begin
    Q_next <= (others => '0');  
    if Q(0) = '1' then                
      if w = '0' then
         Q_next(1) <= '1';         
      else
         Q_next(5) <= '1';          
      end if;
      
    elsif Q(1) = '1' then             
      if w = '0' then
         Q_next(2) <= '1';          
      else
         Q_next(5) <= '1';          
      end if;
      
    elsif Q(2) = '1' then             
      if w = '0' then
         Q_next(3) <= '1';          
      else
         Q_next(5) <= '1';
      end if;
      
    elsif Q(3) = '1' then             
      if w = '0' then
         Q_next(4) <= '1';          
      else
         Q_next(5) <= '1';
      end if;
      
    elsif Q(4) = '1' then            
      if w = '0' then
         Q_next(4) <= '1';          
      else
         Q_next(5) <= '1';          
      end if;
      
    elsif Q(5) = '1' then           
      if w = '1' then
         Q_next(6) <= '1';          
      else
         Q_next(1) <= '1';          
      end if;
      
    elsif Q(6) = '1' then           
      if w = '1' then
         Q_next(7) <= '1';          
      else
         Q_next(1) <= '1';
      end if;
      
    elsif Q(7) = '1' then             
      if w = '1' then
         Q_next(8) <= '1';          
      else
         Q_next(1) <= '1';
      end if;
      
    elsif Q(8) = '1' then             
      if w = '1' then
         Q_next(8) <= '1';          
      else
         Q_next(1) <= '1';
      end if;
      
    else
      Q_next <= (others => '0');     
    end if;
  end process;
  
  
  process(clk)
  begin
    if rising_edge(clk) then
      if reset_n = '0' then
        Q <= "000000001";  
      else
        Q <= Q_next;
      end if;
    end if;
  end process;
  
  
  z <= '1' when (Q(4) = '1' or Q(8) = '1') else '0';
  
  
  leds <= Q;

end Behavioral;
