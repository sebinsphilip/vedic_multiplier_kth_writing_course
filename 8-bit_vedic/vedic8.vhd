
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--------------------------------------------------------

entity vedic8 is
port(	A:	in std_logic_vector(7 downto 0);
	B:	in std_logic_vector(7 downto 0);
	P:	out std_logic_vector(15 downto 0)
);
end vedic8;

--------------------------------------------------------

architecture behv of vedic8 is
--------------------------------------------------------

component vedic4 is 
port(	A:	in std_logic_vector(3 downto 0);
	B:	in std_logic_vector(3 downto 0);
	P:	out std_logic_vector(7 downto 0)
);
end component;
--------------------------------------------------------

component ADDER1 is
port(	A:	in std_logic_vector(7 downto 0);
	B:	in std_logic_vector(7 downto 0);
	carry:	out std_logic;
	sum:	out std_logic_vector(7 downto 0)
);
end component;
signal a7a6a5a4, b3b2b1b0, a3a2a1a0, b7b6b5b4: std_logic_vector(3 downto 0);
signal P3,P2,P1,P0: std_logic_vector(7 downto 0);
signal c0,c1,c2: std_logic;
signal S2,S1,S0: std_logic_vector(7 downto 0);
begin	
a7a6a5a4 <= A(7) & A(6) & A(5) & A(4);
a3a2a1a0 <= A(3) & A(2) & A(1) & A(0);
b3b2b1b0 <= B(3) & B(2) & B(1) & B(0);
b7b6b5b4 <= B(7) & B(6) & B(5) & B(4);

--cross product
Vedic4_3:Vedic4 port map (a7a6a5a4, b3b2b1b0, P3);
Vedic4_2:Vedic4 port map (a3a2a1a0, b7b6b5b4, P2);
--vertical product
Vedic4_1:Vedic4 port map (a3a2a1a0, b3b2b1b0, P1);
Vedic4_0:Vedic4 port map (a7a6a5a4, b7b6b5b4, P0);

ADDER_0:ADDER1 port map(P3, P2, c0, S0);
ADDER_1:ADDER1 port map(S0, '0' & '0'&'0'&'0' & P1(7) & P1(6) & P1(5) & P1(4), c1, S1);
ADDER_2:ADDER1 port map('0'&'0'&'0' & c0 & S1(7) & S1 (6) & S1(5) & S1(4), P0, c2, S2);

P(0) <= P1(0);
P(1) <= P1(1);
P(2) <= P1(2);
P(3) <= P1(3);
P(4) <= S1(0);
P(5) <= S1(1);
P(6) <= S1(2);
P(7) <= S1(3);
P(8) <= S2(0);
P(9) <= S2(1);
P(10) <= S2(2);
P(11) <= S2(3);
P(12) <= S2(4);
P(13) <= S2(5);
P(14) <= S2(6);
P(15) <= S2(7);

end behv;

--------------------------------------------------------