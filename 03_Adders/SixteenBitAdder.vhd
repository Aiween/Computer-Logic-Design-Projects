-- 16 bit adder
-- Built using two 8-bits adders


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY SixteenBitAdder IS
    PORT( A    : IN STD_LOGIC_VECTOR(15 DOWNTO 0);  -- 16-bit input A
        B    : IN STD_LOGIC_VECTOR(15 DOWNTO 0);  -- 16-bit input B
        Cin  : IN STD_LOGIC;                      -- Initial carry-in
        Sum  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); -- 16-bit output
        Cout : OUT STD_LOGIC                      -- Final carry-out
    );
END SixteenBitAdder;

ARCHITECTURE Structure OF SixteenBitAdder IS
    -- Signal to carry the bit from the first 8-bit adder to the second
    SIGNAL carry_mid : STD_LOGIC; 

    -- Declare 8-bit adder as a component
    COMPONENT EightBitAdder IS
        PORT( 
            A    : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
            B    : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
            Cin  : IN STD_LOGIC;
            Sum  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            Cout : OUT STD_LOGIC
        );
    END COMPONENT EightBitAdder;
BEGIN
    --  (Bits 0 to 7)
    Lower8: EightBitAdder PORT MAP(
        A    => A(7 DOWNTO 0),
        B    => B(7 DOWNTO 0),
        Cin  => Cin,
        Sum  => Sum(7 DOWNTO 0),
        Cout => carry_mid  -- goes to next stage
    );

    --(Bits 8 to 15)
    Upper8: EightBitAdder PORT MAP(
        A    => A(15 DOWNTO 8),
        B    => B(15 DOWNTO 8),
        Cin  => carry_mid, -- Takes carry from the lower adder
        Sum  => Sum(15 DOWNTO 8),
        Cout => Cout       -- Final carry out of the 16th bit
    );

END Structure;
