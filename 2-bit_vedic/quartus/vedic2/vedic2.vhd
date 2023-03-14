
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--------------------------------------------------------

entity vedic2 is


port(	A:	in std_logic_vector(1 downto 0);
	B:	in std_logic_vector(1 downto 0);
	P:	out std_logic_vector(3 downto 0)
);

end vedic2;

--------------------------------------------------------

architecture behv of vedic2 is

-- define a temparary signal to store the result

--signal result: std_logic_vector(n downto 0);
signal r00, r11, r10, r01: std_logic; 
begin					  
 
    -- the 3rd bit should be carry
    r00 <= A(0) and B(0);
	 r10 <= A(1) and B(0);
	 r01 <= A(0) and B(1);
	 r11 <= A(1) and B(1);
	 
	 P(0) <= r00;
	 P(1) <= r10 xor r01;
	 p(2)  <= (r10 and r01) xor r11;
    P(3) <= (r10 and r01) and r11;
	 --result <= ('0' & A)+('0' & B);
    --sum <= result(n-1 downto 0);
    --carry <= result(n);

end behv;

--------------------------------------------------------
