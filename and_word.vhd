library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity and_word is
    generic (
        WIDTH : natural :=4
    );

    port (
        a : in std_logic_vector(0 to WIDTH-1);
        b : in std_logic_vector(0 to WIDTH-1);
        q : out std_logic_vector(0 to WIDTH-1)
    );
end entity and_word;


architecture beh of and_word is
begin
    and_bits: process(a, b)
    begin
        for i in q'range loop
            q(i) <= a(i) and b(i);
        end loop;
    end process and_bits;
end architecture beh;
