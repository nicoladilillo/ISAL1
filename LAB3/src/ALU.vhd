library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
---------------------------
Entity ALU is
    Generic( NbitOperands : integer := 32 ); 
    Port
	(
        A    : in std_logic_vector(NbitOperands -1 downto 0); --Operand1
        B    : in std_logic_vector(NbitOperands -1 downto 0); --Operand2
        ctrl : in std_logic_vector(3 downto 0); --Control Signal
        Y    : out std_logic_vector(NbitOperands -1 downto 0) --Result
    );
end ALU;

Architecture Bhv of ALU is
    signal result : std_logic_vector(NbitOperands -1 downto 0);
begin

    Computation: process(A, B, ctrl)
	begin
		case(ctrl) is
		    when "0000" =>
		    --SHIFT
			--shl
	        result <= std_logic_vector(unsigned(A) sll to_integer(unsigned(B))); --N must be B conv to natural

		    when "0001" =>
		        --shr
		        result <= std_logic_vector(unsigned(A) srl to_integer(unsigned(B))); --N must be B conv to natural
		    
			when "0010" =>
		        --shrA (shift right arithmetic)
		        
		    --unused "0011"
		    
			--Arithmetic      

			when "0100" =>
		        --Add
		        result <= A+B;
		    
			when "0101" =>
		        --Sub
		        result <= A-B;
		    --unused "0111"
		    --unused "1000"
		    

			--Logic    
		    when "1001" =>
		        --And
		        result <= A and B;
		    

			when "1010" =>
		        --Or
		        result <= A or B;
		    

			when "1011" =>
		        --Xor
		        result <= A xor B;
		    

			--Cmp
		    when "1100" =>
		        --set min
		        if(A<B) then
		            result <= x"1" ;
		           else
		            result <= x"0";
		        end if; 
		
			when others => result <= A + B ; 
		end case;
    end process;

    Y <= result;

end Architecture;
