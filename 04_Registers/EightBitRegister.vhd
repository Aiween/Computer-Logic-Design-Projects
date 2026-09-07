-- 8 bit Register
-- Behavioral code

Library ieee;
USE ieee.std_logic_1164.ALL;


ENTITY EightBitRegister IS
PORT (
        D        : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- 8bit input
        Clock    : IN STD_LOGIC;
        Load    : IN STD_LOGIC;
        Q        : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
END EightBitRegister;
ARCHITECTURE Behavior OF EightBitRegister IS
BEGIN
    PROCESS(Clock)
    BEGIN
        IF (RISING_EDGE(Clock)) THEN
            IF (Load =  '1') THEN
                Q <= D;
            END IF;
        END IF;
    END PROCESS;

END Behavior;