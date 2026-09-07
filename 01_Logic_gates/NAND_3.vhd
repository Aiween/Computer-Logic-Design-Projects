 --3-Input NAND
 --Built from 2-input NAND
 
 
LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 
ENTITY NAND_3 IS 
	PORT ( A, B, C : IN STD_LOGIC;
		   X	   : OUT STD_LOGIC);
END NAND_3;

--Structural specification
ARCHITECTURE Structure OF NAND_3 IS
    SIGNAL w1, w2 : STD_LOGIC;
BEGIN
	w1 <= A NAND B;
	w2 <= w1 NAND w1;
	X <= w2 NAND C;
END Structure;
