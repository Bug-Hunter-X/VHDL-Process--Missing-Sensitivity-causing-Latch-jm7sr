```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity my_entity is
  port (
    clk : in std_logic;
    data_in : in std_logic_vector(7 downto 0);
    data_out : out std_logic_vector(7 downto 0);
    enable : in std_logic  -- Added signal for demonstration
  );
end entity;

architecture behavioral of my_entity is
  signal data_reg : std_logic_vector(7 downto 0);
begin
  process (clk, enable)  -- **Corrected: Added 'enable' to sensitivity list**
  begin
    if rising_edge(clk) then
      if enable = '1' then  --Added conditional logic for using the enable signal
        data_reg <= data_in;
      end if;
      data_out <= data_reg;
    end if;
  end process;
end architecture;
```