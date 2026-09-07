--Mux2to1
--Built using 2-inputs NAND gates

Library ieee;
USE ieee.std_logic_1164.all;

ENTITY Mux2to1 IS
 PORT (
    s, x2, x1 : IN STD_LOGIC;
    f         : OUT STD_LOGIC
  );
END Mux2to1;

--structural specs
ARCHITECTURE structure
    OF Mux2to1 IS
        SIGNAL s_n, w1, w2 : STD_LOGIC;
BEGIN
  s_n <= s NAND s;        -- NOT s
  w1  <= x1 NAND s_n;     -- x1 AND NOT s
  w2  <= x2 NAND s;       -- x2 AND s
  f   <= w1 NAND w2;      -- OR using NAND
END structure;