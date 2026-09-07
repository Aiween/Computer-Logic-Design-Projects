--One Bit Register
--Behavioral Code

Library ieee;
USE ieee.std_logic_1164.ALL;

ENTITY OneBitRegister IS
    PORT (D, Clock, Load : IN STD_LOGIC;
                    Q    : INOUT STD_LOGIC);
END OneBitRegister;

ARCHITECTURE Behavior OF OneBitRegister IS
BEGIN
    PROCESS (clock)
    BEGIN
        IF (RISING_EDGE (clock)) THEN
            IF (Load = '1' ) THEN
                Q <= D;
        END IF;


        END IF;
    END PROCESS;
END Behavior;