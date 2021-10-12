library IEEE;
use IEEE.std_logic_1164.all; 

entity FD is

	Port (	D:	In	std_logic;
			CK:	In	std_logic;
			RESET:	In	std_logic;
			ENABLE: In std_logic;	
			Q:	Out	std_logic);

end FD;


architecture SYNCH of FD is -- flip flop D with syncronous reset

begin
	PSYNCH: process(CK,RESET,ENABLE)
	begin
	  if CK'event and CK='1' then -- positive edge triggered:

	    if RESET='1' then -- active high reset 
	      Q <= '0'; 

	    elsif ENABLE='1' then
	      Q <= D; -- input is written on output if the FD is enabled
	    end if;

	  end if;
	end process;

end SYNCH;

architecture ASYNCH of FD is -- flip flop D with asyncronous reset

begin
	
	PASYNCH: process(CK,RESET)
	begin
	  if RESET='1' then --reset is indipendent from the clock signal
	    Q <= '0';
	  elsif CK'event and CK='1' and ENABLE = '1' then -- positive edge triggered and enable is '1':
	    Q <= D; 
	  end if;
	end process;

end ASYNCH;


configuration CFG_FD_SYNCH of FD is
	for SYNCH
	end for;
end CFG_FD_SYNCH;


configuration CFG_FD_ASYNCH of FD is
	for ASYNCH
	end for;
end CFG_FD_ASYNCH;


