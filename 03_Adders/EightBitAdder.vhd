-- 8 bit adder
-- Built using two 4-bits adders


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY EightBitAdder IS
    PORT( 
        A     : IN STD_LOGIC_VECTOR(7 DOWNTO 0);  -- 8 bit input for A
        B      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);  -- 8 bit input for B
        Cin  : IN STD_LOGIC;                     -- single bit carry-in
        Sum  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- 8 bit output
        Cout : OUT STD_LOGIC                     -- Final carry-out
        );
END EightBitAdder;

ARCHITECTURE Structure OF EightBitAdder IS
    SIGNAL W0: STD_LOGIC;  -- inner connection wire 

    COMPONENT FourBitAdder IS
            PORT(
                A     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
                B      : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
                Cin  : IN STD_LOGIC;
                Sum  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
                Cout : OUT STD_LOGIC
                );
    END COMPONENT FourBitAdder;
BEGIN
    FA4_O : FourBitAdder PORT MAP(
                                                 A    =>  A(3 DOWNTO 0),
                                                 B    =>  B(3 DOWNTO 0),
                                                 Cin  =>  Cin,
                                                 Sum  =>  Sum(3 DOWNTO 0),
                                                 Cout =>  W0  -- connects to the second 4-bit adder
                                                 );
    FA4_1 : FourBitAdder PORT MAP(
                                                 A    =>  A(7 DOWNTO 4),
                                                 B    =>  B(7 DOWNTO 4),
                                                 Cin  =>  W0,
                                                 Sum  =>  Sum(7 DOWNTO 4),
                                                 Cout => Cout -- output the carry
                                                 );
END Structure;
