-- VHDL Full Adder Circuit 
-- using NAND3 and NAND4 Components


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY FullAdder IS 
   PORT (  A, B, C  : IN  STD_LOGIC;
                Cout, S    : OUT STD_LOGIC);
END FullAdder; 

ARCHITECTURE structure OF FullAdder IS

   SIGNAL W1, W2, W3, W4, W5, W6, W7, W8, W9, W10 : STD_LOGIC;
 
   COMPONENT NAND_3 IS 
    PORT ( A, B, C       : IN  STD_LOGIC;
                X  : OUT STD_LOGIC);
   END COMPONENT NAND_3;

   COMPONENT NAND_4 IS 
    PORT (  A, B, C, D      : IN  STD_LOGIC;
               X   : OUT STD_LOGIC);
   END COMPONENT NAND_4;

BEGIN
   W1 <= A NAND A; -- NOT A
   W2 <= B NAND B; -- NOT B
   W3 <= C NAND C; -- NOT Cin

   -- conections for sum
 NAND3_1 : NAND_3 PORT MAP (W1, W2, C, W4); 
 NAND3_2 : NAND_3 PORT MAP(A, W2, W3, W5);
 NAND3_3 : NAND_3 PORT MAP(W1, B, W3, W6);
 NAND3_4 : NAND_3 PORT MAP(A, B, C, W7);

 NAND4_1 : NAND_4 PORT MAP (W4, W5, W6, W7, S);
 

   -- connections for carry
   W8 <= A NAND B;
   W9 <= A NAND C;
   W10 <= B NAND C;
   NAND3_5 : NAND_3 PORT MAP (W8, W9, W10, Cout);



END structure;
