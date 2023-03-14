entity ha is
Port (a: in  STD_LOGIC;
b : in  STD_LOGIC;
sha : out  STD_LOGIC;
cha : out  STD_LOGIC);
end ha;

architecture BehavioralHA of ha is

begin
sha <= a xor b ;
cha <= a and b ;
end BehavioralHA

entity full_add is
Port ( a : in  STD_LOGIC;
b : in  STD_LOGIC;
cin : in  STD_LOGIC;
sum : out  STD_LOGIC;
cout : out  STD_LOGIC);
end full_add;

architecture BehavioralFA of full_add is
component ha is
Port ( a : in  STD_LOGIC;
b : in  STD_LOGIC;
sha : out  STD_LOGIC;
cha : out  STD_LOGIC);
end component;
signal s_s,c1,c2: STD_LOGIC ;
begin
HA1:ha port map(a,b,s_s,c1);
HA2:ha port map (s_s,cin,sum,c2);
cout<=c1 or c2 ;
end BehavioralFA;
