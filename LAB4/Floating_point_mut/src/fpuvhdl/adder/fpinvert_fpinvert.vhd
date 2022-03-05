--
-- VHDL Architecture HAVOC.FPinvert.FPinvert
--
-- Created:
--          by - Guillermo
--          at - ITESM, 20:19:07 07/19/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2002.1b (Build 7)
--
-- hds interface_start
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY FPinvert IS
   GENERIC( 
      width : integer := 29
   );
   PORT( 
      A_in     : IN     std_logic_vector (width-1 DOWNTO 0);
      B_in     : IN     std_logic_vector (width-1 DOWNTO 0);
      invert_A : IN     std_logic;
      invert_B : IN     std_logic;
      A_out    : OUT    std_logic_vector (width-1 DOWNTO 0);
      B_out    : OUT    std_logic_vector (width-1 DOWNTO 0)
   );

-- Declarations

END FPinvert ;


-- hds interface_end
ARCHITECTURE FPinvert OF FPinvert IS
BEGIN

A_out <= (NOT A_in) WHEN (invert_A='1') ELSE A_in;

B_out <= (NOT B_in) WHEN (invert_B='1') ELSE B_in;

END FPinvert;

