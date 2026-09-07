--4-Input NAND
--Built from 2-input NAND

LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY NAND_4 IS 
	PORT ( A, B, C, D : IN STD_LOGIC;
		   X : OUT STD_LOGIC);
END NAND_4;

ARCHITECTURE Structure OF NAND_4 IS
    SIGNAL w1, w2, w3, w4 : STD_LOGIC;
BEGIN
	w1 <= A NAND B;
	w2 <= w1 NAND w1;
	w3 <= C NAND D;
	w4 <= w3 NAND w3;
	X <= w2 NAND w4;
	
END Structure;