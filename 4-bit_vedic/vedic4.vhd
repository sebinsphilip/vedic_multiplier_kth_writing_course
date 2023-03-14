
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--------------------------------------------------------

entity vedic4 is
port(	A:	in std_logic_vector(3 downto 0);
	B:	in std_logic_vector(3 downto 0);
	P:	out std_logic_vector(7 downto 0)
);
end vedic4;

--------------------------------------------------------

architecture behv of vedic4 is
--------------------------------------------------------

component vedic2 is 
port(	A:	in std_logic_vector(1 downto 0);
	B:	in std_logic_vector(1 downto 0);
	P:	out std_logic_vector(3 downto 0)
);
end component;
--------------------------------------------------------

component ADDER is
--generic(n: natural :=4);
port(	A:	in std_logic_vector(3 downto 0);
	B:	in std_logic_vector(3 downto 0);
	carry:	out std_logic;
	sum:	out std_logic_vector(3 downto 0)
);
end component;
--------------------------------------------------------

-- define a temparary signal to store the result

--signal result: std_logic_vector(n downto 0);
signal a1a0, b3b2, a3a2, b1b0: std_logic_vector(1 downto 0); 
signal P3,P2,P1,P0: std_logic_vector(3 downto 0);
signal c0,c1,c2: std_logic;
signal S3,S2,S1,S0: std_logic_vector(3 downto 0);
begin					  
 
    -- the 3rd bit should be carry
    a1a0(0) <= A(0);
	 a1a0(1) <= A(1);
	 b3b2(0) <= B(2);
	 b3b2(1) <= B(3);
	 a3a2(0) <= A(2);
	 a3a2(1) <= A(3);
	 b1b0(0) <= B(0);
	 b1b0(1) <= B(1);
	 
	 Vedic2_3:Vedic2 port map(a1a0, b3b2, P3);
	 Vedic2_2:Vedic2 port map(a3a2, b1b0, P2);
	 Vedic2_1:Vedic2 port map(a1a0, b1b0, P1);
	 Vedic2_0:Vedic2 port map(a3a2, b3b2, P0);
	 
	 ADDER_0:ADDER port map(P3, P2, c0, S0);
	 ADDER_1:ADDER port map(S0, '0' &'0' & P1(3) & P1(2), c1, S1);
	 ADDER_2:ADDER port map('0' & c0 & S1(3) & S1(2), P0, c2, S2);
	 
	 P(0) <= P1(0);
	 P(1) <= P1(1);
	 p(2) <= S1(0);
    P(3) <= S1(1);
	 p(4) <= S2(0);
    P(5) <= S2(1);
	 p(6) <= S2(2);
    P(7) <= S2(3);
	 --result <= ('0' & A)+('0' & B);
    --sum <= result(n-1 downto 0);
    --carry <= result(n);

end behv;

--------------------------------------------------------
