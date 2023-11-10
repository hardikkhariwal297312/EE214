library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity read_block is
  Port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    update_signal : in STD_LOGIC;  -- Update signal for the current memory word
    memory_word_data : in STD_LOGIC_VECTOR(35 downto 0); -- Adjust the size as needed
    default_weight : in STD_LOGIC_VECTOR(35 downto 0);   -- Default weight for update signal 0
    weight_out : out STD_LOGIC_VECTOR(35 downto 0) -- Output for the weight (w(j))
  );
end read_block;

architecture Behavioral of read_block is
begin
  process(clk, reset)
  begin
    if reset = '1' then
      weight_out <= default_weight;
    elsif rising_edge(clk) then
      if update_signal = '1' then
        weight_out <= memory_word_data;
      else
        weight_out <= default_weight;
      end if;
    end if;
  end process;
end Behavioral;
