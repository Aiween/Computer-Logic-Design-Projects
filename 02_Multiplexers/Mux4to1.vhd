-- Mux4to1 built in vhdl with 2 to 1 mux component

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
 
ENTITY Mux4to1 IS 
 PORT( 
       S1, S0, I3, I2, I1, I0 : IN  STD_LOGIC; 
       F : OUT STD_LOGIC
   ); 
END Mux4to1; 
 
ARCHITECTURE Structure OF Mux4to1 IS 
 
 SIGNAL W1, W2 : STD_LOGIC; 
 
 COMPONENT Mux2to1 IS
   PORT (s, x2, x1 : IN STD_LOGIC;
         f         : OUT STD_LOGIC);
 END COMPONENT;
 
BEGIN 
 
 -- First stage (controlled by S0)
 mux0 : Mux2to1 PORT MAP (S0, I1, I0, W1);
 mux1 : Mux2to1 PORT MAP (S0, I3, I2, W2);

 -- Second stage (controlled by S1)
 mux2 : Mux2to1 PORT MAP (S1, W2, W1, F);

END Structure;