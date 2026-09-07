--D Flip Flop



Library ieee;
USE ieee.std_logic_1164.ALL;

ENTITY D_FlipFlop IS
    PORT (D, Clock : IN STD_LOGIC;
                Q  : INOUT STD_LOGIC);
END D_FlipFlop ;

ARCHITECTURE Behavior OF D_FlipFlop  IS
BEGIN
    PROCESS (Clock)
    BEGIN
        IF (RISING_EDGE (Clock)) THEN

        Q <= D;
        END IF;
    END PROCESS;
END Behavior;
