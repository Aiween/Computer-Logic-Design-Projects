-- VHDL Four Bit Adder
-- Built using full adder components

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY FourBitAdder IS 
    PORT (
        A     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);  -- 4 bit input for A
        B      : IN STD_LOGIC_VECTOR(3 DOWNTO 0);  -- 4 bit input for B
        Cin  : IN STD_LOGIC;                     -- single bit carry-in
        Sum  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4 bit output
        Cout : OUT STD_LOGIC                     -- Final carry-out
        );
END FourBitAdder;

ARCHITECTURE structure OF FourBitAdder IS
    SIGNAL W: STD_LOGIC_VECTOR(2 DOWNTO 0);      -- 3 bits vector for the internal wires

    COMPONENT FullAdder IS          -- Full adder component
            PORT (  A, B, C    :  IN  STD_LOGIC;
                    Cout, S    :  OUT STD_LOGIC
                    );
    END COMPONENT FullAdder;

BEGIN
FA0 : FullAdder PORT MAP( 
                                            A => A(0), 
                                            B => B(0), 
                                            C => Cin, 
                                            S => Sum(0), 
                                            Cout => W(0) -- Connects FA0 to FA1
                                            );

    FA1 : FullAdder PORT MAP( 
                                            A => A(1), 
                                            B => B(1), 
                                            C => W(0), 
                                            S => Sum(1), 
                                            Cout => W(1) --Connects FA1 to FA2
                                            );
    FA2 : FullAdder PORT MAP(
                                            A => A(2),
                                            B => B(2),
                                            C => W(1),
                                            S => Sum(2),
                                            Cout => W(2) --Connects FA2 to FA3
                                            );
    FA3 : FullAdder PORT MAP(
                                            A => A(3),
                                            B => B(3),
                                            C => W(2),
                                            S => Sum(3),
                                            Cout => Cout 
                                            );
END structure;
