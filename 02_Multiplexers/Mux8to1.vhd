-- Mux8to1 built in vhdl with 4 to 1 mux and 2 to 1 mux components

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
 
ENTITY Mux8to1 IS 
 PORT( 
       S2, S1, S0,I7, I6, I5, I4, I3, I2, I1, I0 : IN  STD_LOGIC; 
       F : OUT STD_LOGIC
   ); 
END Mux8to1; 
 
ARCHITECTURE Structure OF Mux8to1 IS 
 
 SIGNAL W1, W2 : STD_LOGIC; 
 
 COMPONENT Mux2to1 IS -- add component for MUX2to1 
   PORT (s, x2, x1 : IN STD_LOGIC;
         f         : OUT STD_LOGIC);
 END COMPONENT;
 
 COMPONENT Mux4to1 IS     -- add component for MUX4to1
    PORT (S1, S0, I3, I2, I1, I0 : IN  STD_LOGIC; 
       F : OUT STD_LOGIC
   ); 
END COMPONENT; 

BEGIN 
 
 -- First stage (controlled by S1 and S0)
 mux0 : Mux4to1 PORT MAP (S1, S0, I3, I2, I1, I0, W1);
 mux1 : Mux4to1 PORT MAP (S1, S0, I7, I6, I5, I4, W2);

 -- Second stage (controlled by S2)
 mux2 : Mux2to1 PORT MAP (S2, W2, W1, F);

END Structure;
